extends CharacterBody2D

const SPEED = 100.0

func _ready() -> void:
	position = Vector2(300, 200)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	 

	velocity.x = SPEED
	move_and_slide()
	
	position.x = clamp(position.x,0,800)
