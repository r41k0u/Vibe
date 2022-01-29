extends Node2D


const MIN_SPEED = 10
const MAX_SPEED = 50

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
	
	var index = randi()%$sprites.get_child_count()
	for i in range($sprites.get_child_count()):
		if(i != index):
			$sprites.get_children()[i].queue_free()
	pass # Replace with function body.


func _process(delta):
	### RESPONSIVE KA CODE
	var new_window_size = get_viewport().size
	if(window_size != new_window_size):
		position.x += new_window_size.x/2 - window_size.x/2
		position.y += new_window_size.y/2 - window_size.y/2
		window_size = new_window_size
	### RESPONSIVE KA CODE ENDS
	scale.x = lerp(scale.x, 1, 0.03)
	scale.y = lerp(scale.y, 1, 0.03)
	if(position.x > window_size.x && position.y > window_size.y):
		queue_free()
	if(!hit):
		position += velocity*delta
	pass
	
func on_hit():
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
