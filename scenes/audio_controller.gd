extends Node2D


func play_jump() -> void:
	$Jump.play()
	
func play_hurt() -> void: 
	$Hurt.play()
	
	
func play_level_complete() -> void:
	$Level_complete.play()

func play_level1() -> void:
	$level_1.play()
	
func play_collect_item() -> void:
	$collect_item.play()
