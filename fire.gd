extends AnimatedSprite2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"."

signal body_entered_fire

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animated_sprite_2d.animation = "hit"
		body_entered_fire.emit()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		animated_sprite_2d.animation = "burning"
