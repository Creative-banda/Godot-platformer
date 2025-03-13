extends Node2D

@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioController.play_level1()
	var items = $Items
	for item in items.get_children():
		if item.has_signal("body_touch_saw"):
			item.body_touch_saw.connect(_on_saw_body_touch_saw)


func _on_saw_body_touch_saw(saw_position: Vector2) -> void:
	AudioController.play_hurt()
	var player_position = character_body_2d.global_position

	# Check the vertical position
	if player_position.y < saw_position.y:
		# Player is above the saw
		character_body_2d.velocity.y = -260
	else:
		# Player is below the saw
		character_body_2d.velocity.y = 260
	
	character_body_2d.get_node("AnimatedSprite2D").play("hurt")
