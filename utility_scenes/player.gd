extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var MAX_ORBIT_VELOCITY = 2
export var ORBITAL_ACCEL = 0.05
export var BULLET_COOLDOWN = 0.05

var time_begin
var time_delay
var stamp_ind = 0

var bullet_time = 0
var orbit_velocity = 0
var lives = 3

var bullet = preload("res://utility_scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	### TEST CODE
	
	if(Input.is_action_just_pressed("ui_down")):
		GameState.start_collect_mode()
	elif(Input.is_action_just_pressed("ui_up")):
		GameState.start_shoot_mode()
	
	### TEST CODE ENDS
	if(Input.is_action_pressed("left")):
		orbit_velocity = lerp(orbit_velocity, MAX_ORBIT_VELOCITY, ORBITAL_ACCEL)
	elif(Input.is_action_pressed("right")):
		orbit_velocity = lerp(orbit_velocity, -MAX_ORBIT_VELOCITY, ORBITAL_ACCEL)
	else:
		orbit_velocity = lerp(orbit_velocity, 0, ORBITAL_ACCEL)
	rotate(orbit_velocity*delta)
	
	var time = get_parent().get_node("AudioStreamPlayer").get_playback_position()
	time = max(0, time)
	if(Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()] < time && abs(time - Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()]) < 100):
		stamp_ind += 1
		if(GameState.mode == GameState.SHOOT):
			var b = bullet.instance()
			b.position = $Player_motif.global_position
			b.rotation = rotation
			b.velocity = (global_position - $Player_motif.global_position)*2.5
			get_parent().add_child(b)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func player_hit():
	if GameState.mode == GameState.COLLECT:
		GameState.obstacle_shot()
	else:
		GameState.player_hit()
#	pass
