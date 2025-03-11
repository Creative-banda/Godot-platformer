extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -260.0

var movingLeft = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jump"
	else:
		# Handle movement animations only when on the floor
		if velocity.x == 0:
			animated_sprite_2d.animation = "idle"
		else:
			animated_sprite_2d.animation = "run"

	# Handle jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle movement
	var direction := Input.get_axis("left", "right")
	if direction:
		movingLeft = direction < 0  # Update direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 40)

	# Flip sprite
	animated_sprite_2d.flip_h = movingLeft

	move_and_slide()
