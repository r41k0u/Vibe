extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var MIN_RADIUS = 210
var MAX_RADIUS = 225
var expanding = true
var radius = 215
# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	pass # Replace with function body.

func _process(delta):
	if(expanding):
		radius = lerp(radius, MAX_RADIUS, 0.08)
		if(radius > MAX_RADIUS-0.5):
			expanding = false
	else :
		radius = lerp(radius, MIN_RADIUS, 0.08)
		if(radius < MIN_RADIUS+0.5):
			expanding = true
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
