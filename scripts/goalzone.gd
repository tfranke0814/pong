extends Area2D

@export var player_id: int

func _on_body_entered(body: Node2D) -> void:
	print("%s entered the Goalzone" % body.name)
	GameManager.add_point(player_id)
