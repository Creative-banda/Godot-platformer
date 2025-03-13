extends Node2D

@onready var character_body_2d: CharacterBody2D = $CharacterBody2D


func _ready() -> void:
	var fires = $Fires
	for fire in fires.get_children():
		if fire.has_signal("body_entered_fire"):
			fire.body_entered_fire.connect(_on_fire_body_entered_fire)

func _on_fire_body_entered_fire() -> void:
	AudioController.play_hurt()
	character_body_2d.velocity.y = -260
	
	character_body_2d.get_node("AnimatedSprite2D").play("hurt")
