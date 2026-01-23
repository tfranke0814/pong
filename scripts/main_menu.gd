extends Control


func _on_button_1p_pressed() -> void:
	GameManager.ai_player = true
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_2p_pressed() -> void:
	GameManager.ai_player = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
