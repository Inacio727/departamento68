extends Node2D

@onready var postman_anim = $Postman/AnimationPlayer
@onready var jornal_sprite = $Jornal
@onready var postman_fala = $Postman/SpeechBubble

func _ready():
	postman_anim.play("postman_basic")
	jornal_sprite.visible = false  # esconde o jornal até a entrega

func entregar_jornal():
	jornal_sprite.visible = true

func postman_talk():
	postman_fala.visible = true
	await get_tree().create_timer(1.0).timeout
	postman_fala.visible = false
