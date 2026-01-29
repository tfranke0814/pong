extends Control

var options: Dictionary
@onready var points_2_win_spin_box: SpinBox = $CanvasLayer/PanelContainer/VBoxContainer/GridContainer/Points2WinSpinBox

func _ready() -> void:
	options = OptionsManager.read_options()
	if options.has("points_to_win"):
		points_2_win_spin_box.value = options.points_to_win
	else:
		points_2_win_spin_box.value = OptionsManager.default_points_to_win
		
# Closing the menu
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"): 
		close_settings()
	
func _on_back_button_pressed() -> void:
	close_settings()

func close_settings() -> void:
	queue_free()

# Updating the settings
func _on_points_2_win_spin_box_value_changed(value: float) -> void:
	OptionsManager.set_points_to_win(value)
