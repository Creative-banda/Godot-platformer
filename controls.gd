extends CanvasLayer

func _ready():
	var screen_size = get_viewport().get_visible_rect().size  # Get screen size

	# Button size relative to screen width
	var button_size = screen_size.x * 0.12  # 12% of screen width

	# Adjust Left Button
	$Left.position = Vector2(button_size * 0.5, screen_size.y - button_size * 1.5)
	if $Left.texture_normal:
		$Left.scale = Vector2(button_size / $Left.texture_normal.get_width(), button_size / $Left.texture_normal.get_height())

	# Adjust Right Button
	$Right.position = Vector2(button_size * 2, screen_size.y - button_size * 1.5)
	if $Right.texture_normal:
		$Right.scale = Vector2(button_size / $Right.texture_normal.get_width(), button_size / $Right.texture_normal.get_height())

	# Adjust Jump Button
	$Jump.position = Vector2(screen_size.x - button_size * 1.5, screen_size.y - button_size * 1.7)
	if $Jump.texture_normal:
		$Jump.scale = Vector2(button_size / $Jump.texture_normal.get_width(), button_size / $Jump.texture_normal.get_height())
