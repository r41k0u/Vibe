extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var orbit_velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if(GameState.mode == GameState.COLLECT):
		orbit_velocity = get_parent().get_node("Player").orbit_velocity
		rotate(orbit_velocity*delta)
#	pass
