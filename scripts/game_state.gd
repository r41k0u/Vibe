extends Node

signal MODE_COLLECT
signal MODE_SHOOT
signal SCORED
signal PLAYER_HIT

var score = 0
var highscore = 0

enum{
	COLLECT,
	SHOOT
}
var mode = SHOOT
# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	pass # Replace with function body.

func start_collect_mode():
	AudioServer.set_bus_effect_enabled(0, 1, true)
	mode = COLLECT
	emit_signal("MODE_COLLECT")

func start_shoot_mode():
	AudioServer.set_bus_effect_enabled(0, 1, false)
	mode = SHOOT
	emit_signal("MODE_SHOOT")

func obstacle_shot():
	score += 10
	emit_signal("SCORED")

func player_hit():
	emit_signal("PLAYER_HIT")

func save():
	var save_dict = {
		"highscore" : highscore,
	}
	return save_dict

func save_game():
	var save_data = File.new()
	save_data.open("user://savegame.save", File.WRITE)
	var node_data = save()
	save_data.store_line(to_json(node_data))
	save_data.close()

func load_game():
	var save_game = File.new()
	if save_game.file_exists("user://savegame.save"):
		save_game.open("user://savegame.save", File.READ)
		var node_data = parse_json(save_game.get_line())
		if(node_data.has("highscore")):
			highscore = node_data["highscore"]
		save_game.close()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
