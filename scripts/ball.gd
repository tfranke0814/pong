extends CharacterBody2D

const SPEED = 350.0
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	velocity.x = SPEED * [-1,1][randi() % 2]
	velocity.y = sin(randf_range(-PI/12,PI/12)) * SPEED
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		audio_stream_player_2d.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
