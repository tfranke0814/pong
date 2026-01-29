extends CharacterBody2D

const SPEED = 300.0
var ball: Node2D = null
@export var player_id: int

@onready var game: Node2D = $".."

func _ready() -> void:
	game.ball_spawned.connect(_on_ball_spawn)

func _physics_process(delta: float) -> void:
	var direction := 0.0
	var ai_paddle := GameManager.ai_player and player_id == 2
	if ai_paddle and ball: 
		# AI Controls when ball
		var delta_y := ball.global_position.y - global_position.y
		direction = delta_y/abs(delta_y)
		if direction and abs(delta_y) > SPEED * delta:
			# Full speed when further away
			velocity.y = move_toward(velocity.y, direction * SPEED, SPEED * delta)
		elif direction: # Slows down when near
			velocity.y = move_toward(velocity.y, direction, SPEED * delta)
		else: # Stops when equal
			velocity.y = move_toward(velocity.y, 0, SPEED * delta)
	elif ai_paddle and not GameManager.victory:
		# AI Controls without ball, returns to middle
		var deltay:= 324 - global_position.y
		velocity.y = move_toward(velocity.y, deltay/abs(deltay) * SPEED/2, SPEED * delta)
	else:
		# Player Controls
		direction = Input.get_axis("up-p%d" %player_id, "down-p%d" %player_id)		
		if direction:
			velocity.y = move_toward(velocity.y, direction * SPEED, SPEED * 4 * delta)
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_collide(velocity * delta)
	
func _on_ball_spawn() -> void:
	ball = get_parent().get_node_or_null("Ball")
