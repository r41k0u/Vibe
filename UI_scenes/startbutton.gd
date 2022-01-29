extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_mouse_entered():
	$TextureButton.modulate.a = 0.5


func _on_TextureButton_mouse_exited():
	$TextureButton.modulate.a = 1
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Game_Screen.tscn")
	pass # Replace with function body.
