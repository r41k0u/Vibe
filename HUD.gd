extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MARGIN = 20
var window_size
var timer_x
var items_to_center = []
var time_left = 30
var life = 0
onready var lives = [$SCORE/LIVES/heart3, $SCORE/LIVES/heart2, $SCORE/LIVES/heart1]
onready var impacts = [$SCORE/LIVES/Impact3, $SCORE/LIVES/Impact2, $SCORE/LIVES/Impact]
export (NodePath)var player_node

var orbit_velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	life = 0
	GameState.connect("SCORED", self, "_on_scored")
	GameState.connect("PLAYER_HIT", self, "_on_player_hit")
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
	time_left = max(0, time_left - delta)
	if time_left == 0:
		if GameState.mode == GameState.COLLECT:
			GameState.start_shoot_mode()
		else:
			GameState.start_collect_mode()
		time_left = 30
	$TIMER/timer.text = str(int(time_left))

func _on_scored():
	$SCORE/score.text = str(GameState.score)

func _on_player_hit():
	if(life == 3):
		if GameState.score > GameState.highscore:
			GameState.highscore = GameState.score
			GameState.save_game()
		get_tree().change_scene("res://UI_scenes/End_Screen.tscn")
	else:
		lives[life].queue_free()
		impacts[life].emitting = true
		life += 1
