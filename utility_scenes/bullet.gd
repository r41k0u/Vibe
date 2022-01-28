extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_Area2D_body_entered")
	pass # Replace with function body.

func _process(delta):
	position.x += velocity.x*delta
	position.y += velocity.y*delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	print("reached")
	if body.get_parent().has_method("on_hit"):
		body.get_parent().on_hit()
		queue_free()
	pass # Replace with function body.
