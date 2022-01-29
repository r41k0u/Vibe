extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MARGIN = 20
var window_size
var timer_x
var items_to_center = []
export (NodePath)var player_node
var orbit_velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	window_size = get_viewport().size
	timer_x = window_size.x
	$SCORE.position = Vector2(-window_size.x/2 + MARGIN, -window_size.y/2 + MARGIN)
	$TIMER.position = Vector2(window_size.x/2 - MARGIN, -window_size.y/2 + MARGIN)
pass # Replace with function body.

func _process(delta):
	var new_window_size = get_viewport().size
	if(window_size != new_window_size):
		window_size = new_window_size
		timer_x = window_size.x
		$SCORE.position = Vector2(-window_size.x/2 + MARGIN, -window_size.y/2 + MARGIN)
		$TIMER.position = Vector2(window_size.x/2 - MARGIN, -window_size.y/2 + MARGIN)
	if(GameState.mode == GameState.COLLECT):
		orbit_velocity = get_parent().get_node("Player").orbit_velocity
		rotate(orbit_velocity*delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
