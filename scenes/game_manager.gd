extends Node

var points = 0
var ui = null  # Reference to the UI scene

var max_health = 3
var current_health = max_health
var hearts

func register_ui(ui_scene):
	ui = ui_scene  # Store UI reference
	update_points()
	hearts = ui.get_node("HeartContainer").get_children()

func add_point():
	points+=1
	AudioController.play_collect_item()
	update_points()

func update_health_bar():
	for i in range(max_health):
		if i < current_health:
			hearts[i].visible = true  # Show heart if health is available
		else:
			hearts[i].visible = false  # Hide heart if health is lost

func take_damage():
	current_health -= 1
	if current_health > 0:
		update_health_bar()
	else:
		points = 0
		current_health = max_health
		Input.vibrate_handheld(500)
		call_deferred("change_scene")
		AudioController.stop_level1()
		AudioController.game_loose()
		

func change_scene():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn" )

func update_points():
	if ui:
		var point_label = ui.get_node("Panel/PointLabel")  # Access child node
		point_label.text = "Point : " + str(points)
