extends AnimatedSprite2D


signal body_touch_saw

func _on_area_2d_body_entered(_body: Node2D) -> void:
	body_touch_saw.emit(global_position)
