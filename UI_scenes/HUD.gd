extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var window_size
var timer_x
var items_to_center = []
# Called when the node enters the scene tree for the first time.
func _ready():
	window_size = get_viewport().size
	timer_x = window_size.x - 512
	for item in items_to_center:
		item.position.x = window_size.x/2
		item.position.y = window_size.y/2
	$SCORE.position = Vector2(512, 302)
	$TIMER.position = Vector2(timer_x, 302)
pass # Replace with function body.

func _process(delta):
	var new_window_size = get_viewport().size
	if(window_size != new_window_size):
		window_size = new_window_size
		timer_x = window_size.x - 512
		$TIMER.position = Vector2(timer_x, 302)
		for item in items_to_center:
			item.position.x = window_size.x/2
			item.position.y = window_size.y/2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass