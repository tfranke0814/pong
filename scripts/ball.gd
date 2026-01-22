extends CharacterBody2D

const SPEED = 400.0

func _ready() -> void:
	velocity.x = -SPEED
	velocity.y = sin(randf_range(-PI/12,PI/12)) * SPEED
	print(velocity.y)
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
