extends CanvasLayer

@export_file("*json") var scene_text_file: String

var scene_text = {}
var selected_text = []
var in_progress = false

@onready var background = $Background
@onready var text_label = $TextLabel

func _ready() -> void:
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.connect("display_dialog", self, "on_display_dialog")

func load_scene_text():
	var file = FileAccess.new()
	if file.file_exists(scene_text_file):
		file.open(scene_text_file, FileAccess.READ)
		return parse_json(file.get_as_text())

func on_display_dialog():
	if in_progress:
		next_line()
	else:
		get_tree().paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
