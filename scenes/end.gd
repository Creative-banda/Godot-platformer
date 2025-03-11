extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		call_deferred("change_scene")

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
