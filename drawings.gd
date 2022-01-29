extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pos = Vector2(513, 302)
# Called when the node enters the scene tree for the first time.
func _ready():
	draw_circle(pos, 216.2936, Color(0, 0, 0, 1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
