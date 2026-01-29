extends Node2D

signal victory(winner: int)

var score_p1 = 0
var score_p2 = 0
var has_victory: bool = false
var points_to_win: int
var most_recent_winner: int
var ai_player = true

func add_point(player_id: int) -> void:
	if player_id == 1:
		score_p1 += 1
	elif player_id == 2:
		score_p2 += 1
		
	# Check for winner
	if score_p1 == points_to_win or score_p2 == points_to_win:
		has_victory = true
		most_recent_winner = player_id
		victory.emit(player_id)
		await get_tree().create_timer(5.0).timeout
		call_deferred("_go_to_main_menu")
		
func reset_points() -> void:
	score_p1 = 0
	score_p2 = 0
	var options = OptionsManager.read_options()
	if options.has("points_to_win"):
		points_to_win = options.points_to_win
	else:
		points_to_win = OptionsManager.default_points_to_win
		
func _go_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
