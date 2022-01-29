extends Sprite

var expanded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.connect("MODE_COLLECT", self, "mode_collect")
	GameState.connect("MODE_SHOOT", self, "mode_shoot")
	pass # Replace with function body.

func _process(delta):
	if(expanded):
		scale.x = lerp(scale.x, 500, 0.01)
		scale.y = lerp(scale.y, 500, 0.01)
	else:
		scale.x = lerp(scale.x, 0, 0.085)
		scale.y = lerp(scale.y, 0, 0.085)

func mode_collect():
	expanded = true
	
func mode_shoot():
	expanded = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
