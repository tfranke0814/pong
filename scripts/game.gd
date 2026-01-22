extends Node2D

const BallScene = preload("uid://bkgsgplmdrdk4")
@onready var ball_start_location: Node2D = $BallStartLocation
signal ball_spawned()

func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	place_ball()
	
func place_ball() -> void:
	var ball_instance = BallScene.instantiate()
	ball_instance.global_position = ball_start_location.global_position
	add_child(ball_instance)
	ball_spawned.emit()


func _on_child_exiting_tree(node: Node) -> void:
	if node.name == "Ball":
		await get_tree().create_timer(2.0).timeout
		place_ball()
