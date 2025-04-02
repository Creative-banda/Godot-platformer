extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -260.0
var jump_count = 0
var movingLeft = false
var is_moving = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var touch_start_position = Vector2.ZERO
var touch_end_position = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton or event is InputEventMouseMotion:
		if event is InputEventScreenTouch and event.pressed or event is InputEventMouseButton and event.pressed:
			touch_start_position = event.position
		elif event is InputEventScreenTouch and not event.pressed or event is InputEventMouseButton and not event.pressed:
			touch_end_position = event.position
			var swipe_direction = touch_end_position - touch_start_position

			# Detect swipe left or right
			if abs(swipe_direction.x) > abs(swipe_direction.y) and abs(swipe_direction.x) > 50:
				if swipe_direction.x > 0:
					is_moving = true
					movingLeft = false
				else:
					is_moving = true
					movingLeft = true
			elif abs(swipe_direction.x) < 10 and abs(swipe_direction.y) < 10:
				# Detect tap to stop movement
				is_moving = false

			else:
				# Detect tap for jumping
				if jump_count < 1:
					velocity.y = JUMP_VELOCITY
					AudioController.play_jump()
					if jump_count == 0 and is_on_floor():
						animated_sprite_2d.animation = "jump"
					else:
						animated_sprite_2d.animation = "double_jump"
					jump_count += 1

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
		if velocity.x == 0:
			animated_sprite_2d.animation = "idle"
		else:
			animated_sprite_2d.animation = "run"

	# Handle movement
	if is_moving:
		velocity.x = (-SPEED if movingLeft else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, 40)

	# Flip sprite
	animated_sprite_2d.flip_h = movingLeft

	move_and_slide()
