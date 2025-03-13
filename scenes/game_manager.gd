extends Node

var points = 0
@onready var point_label: Label = $"../UI/Panel/PointLabel"


func add_point():
	points+=1
	AudioController.play_collect_item()
	point_label.text = "Point : " + str(points)
