extends Control

@onready var animation_player = $AnimationPlayer

func _on_start_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/day_1.tscn")
