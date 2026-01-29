extends Node

const options_path = "user://options.data"

# Default Options
var default_points_to_win: int = 11

func read_options() -> Dictionary:
	var options = {}
	var file = FileAccess.open(options_path, FileAccess.READ)
	if file:
		options = file.get_var()
		file.close()
	return options

func write_option(options: Dictionary) -> void:
	var file = FileAccess.open(options_path, FileAccess.WRITE)
	file.store_var(options)
	file.close()
	
func set_points_to_win(value: float):
	var options = read_options()
	options.points_to_win = value
	write_option(options)
