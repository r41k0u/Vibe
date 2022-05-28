extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var MIN_RADIUS = 300
var MAX_RADIUS = 325
const BEAT_DURATION = 0.1
const BEAT_SCALE = 1.5
var stamp_ind = 0
var grow_for = 0
var radius = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	pass # Replace with function body.

func _physics_process(delta):
	grow_for = max(0, grow_for - delta)
	var time = get_parent().get_node("AudioStreamPlayer").get_playback_position()
	time = max(0, time)
	if(Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()] < time && abs(time - Stamps.time_stamps[stamp_ind % Stamps.time_stamps.size()]) < 100):
		stamp_ind += 1
		grow_for = BEAT_DURATION
	
	if(grow_for != 0):
		radius = lerp(radius, MAX_RADIUS, 0.1)
	else:
		radius = lerp(radius, MIN_RADIUS, 0.1)
	
	update()

func _draw():
	var r = radius
	draw_arc(Vector2(0, 0), r, 0, 2*PI, 200, Color.black, 0.01, true)
	r += 90
	draw_arc(Vector2(0, 0), r, 0, 2*PI, 200, Color.black, 0.01, true)
	for i in range(10):
		r += 70
		draw_arc(Vector2(0, 0), r, 0, 2*PI, 200, Color.black, 0.01, true)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
