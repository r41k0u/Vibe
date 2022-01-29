extends Node

signal MODE_COLLECT
signal MODE_SHOOT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_collect_mode():
	emit_signal("MODE_COLLECT")

func start_shoot_mode():
	emit_signal("MODE_SHOOT")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
