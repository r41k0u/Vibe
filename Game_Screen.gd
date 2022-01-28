extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var window_size
# Called when the node enters the scene tree for the first time.
func _ready():
	window_size = get_viewport().size
	pass # Replace with function body.

func _process(delta):
	var new_window_size = get_viewport().size
	if(window_size != new_window_size):
		window_size = new_window_size
		$Player.position.x = window_size.x/2
		$Player.position.y = window_size.y/2
		$Center.position.x = window_size.x/2
		$Center.position.y = window_size.y/2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
