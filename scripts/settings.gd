extends Control


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"): 
		close_settings()
	
func _on_back_button_pressed() -> void:
	close_settings()

func close_settings() -> void:
	get_node("CanvasLayer").visible = false
