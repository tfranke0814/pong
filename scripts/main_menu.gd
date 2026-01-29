extends Control


func _on_p1_button_pressed() -> void:
	GameManager.ai_player = true
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_p2_button_pressed() -> void:
	GameManager.ai_player = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_settings_button_pressed() -> void:
	var settings = load("res://scenes/settings.tscn").instantiate()
	add_child(settings)
	
func _on_exit_button_pressed() -> void:
	get_tree().quit()
