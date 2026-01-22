extends Node2D

var score_p1 = 0
var score_p2 = 0

func add_point(player_id: int) -> void:
	if player_id == 1:
		score_p1 += 1
	elif player_id == 2:
		score_p2 += 1
