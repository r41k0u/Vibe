extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var min_delay = 0
export var max_delay = 1
var delay = 2
var obstacle = preload("res://utility_scenes/Obstacle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	delay = max(0, delay - delta)
	if(delay == 0):
		delay = rand_range(min_delay, max_delay)
		var ob = obstacle.instance()
		get_parent().add_child(ob)
		
