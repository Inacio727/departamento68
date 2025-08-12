extends Area2D

@export var dialog_key = ""

func _input(event):
	if event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialog", dialog_key)
