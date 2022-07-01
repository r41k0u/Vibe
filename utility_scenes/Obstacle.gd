extends Node2D


const MIN_SPEED = 30
const MAX_SPEED = 80
const BEAT_DURATION = 0.1
const BEAT_SCALE = 1.5

var stamp_ind = 0
var grow_for = 0

var window_size
var velocity = Vector2(0, -20)
var hit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(0,0)
	### RESPONSIVE KA CODE
	window_size = get_viewport().size
	position.x = window_size.x/2
	position.y = window_size.y/2
	### RESPONSIVE KA CODE ENDS
	
	var speed = rand_range(MIN_SPEED, MAX_SPEED)
	velocity = Vector2(rand_range(-2, 2), rand_range(-2, 2))
	velocity = velocity.normalized()*speed
	position.x += velocity.x
	position.y += velocity.y
	
	var index = randi()%$sprites.get_child_count()
	for i in range($sprites.get_child_count()):
		if(i != index):
			$sprites.get_children()[i].queue_free()
			
	pass # Replace with function body.


func _physics_process(delta):
	grow_for = max(0, grow_for - delta)
	### RESPONSIVE KA CODE
	var new_window_size = get_viewport().size
	if(window_size != new_window_size):
		position.x += new_window_size.x/2 - window_size.x/2
		position.y += new_window_size.y/2 - window_size.y/2
		window_size = new_window_size
	### RESPONSIVE KA CODE ENDS
	if(position.x > window_size.x && position.y > window_size.y):
		queue_free()
	if(!hit):
		position += velocity*delta
	var time = get_parent().get_node("AudioStreamPlayer").get_playback_position()
	time = max(0, time)
	if(Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()] < time && abs(time - Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()]) < 100):
		stamp_ind += 1
		grow_for = BEAT_DURATION
	
	if(grow_for != 0):
		scale.x = lerp(scale.x, BEAT_SCALE, 0.5)
		scale.y = lerp(scale.y, BEAT_SCALE, 0.5)
	else:
		scale.x = lerp(scale.x, 1, 0.5)
		scale.y = lerp(scale.y, 1, 0.5)
		
	pass
	
func on_hit():
	if not hit:
		if(GameState.mode == GameState.SHOOT):
			GameState.obstacle_shot()
		hit = true
	queue_free()
	pass

func _on_Area2D_area_entered(area):
	if area.get_parent().has_method("player_hit") && !hit:
		area.get_parent().player_hit()
		hit = true
		$Impact.emitting = true
		$sprites.visible = false
		yield(get_tree().create_timer(3.0), "timeout")
		queue_free()
	pass # Replace with function body.
