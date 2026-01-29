extends Node2D

signal ball_spawned()

const BallScene = preload("uid://bkgsgplmdrdk4")
var options: Dictionary
@onready var ball_start_location: Node2D = $BallStartLocation

func _ready() -> void:		
	GameManager.reset_points()
	GameManager.victory.connect(_on_victory)
	await get_tree().create_timer(3.0).timeout
	place_ball()
	
func place_ball() -> void:
	var ball_instance = BallScene.instantiate()
	ball_instance.global_position = ball_start_location.global_position
	add_child(ball_instance)
	ball_spawned.emit()

func _on_child_exiting_tree(node: Node) -> void:
	if node.name == "Ball" and not GameManager.has_victory:
		await get_tree().create_timer(2.0).timeout
		place_ball()

func _on_victory(_winner: int):
	var victory_screen = load("res://scenes/victory.tscn").instantiate()
	add_child(victory_screen)
