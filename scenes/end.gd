extends Area2D

@export var scene_change : PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		call_deferred("change_scene")
		AudioController.play_level_complete()

func change_scene() -> void:
	get_tree().change_scene_to_packed(scene_change)
