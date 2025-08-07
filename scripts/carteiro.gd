extends CharacterBody2D

# Velocidade de movimento
@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var direction = 0.0

	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1

	var direction2 = 0.0
	
	if Input.is_action_pressed("ui_down"):
		direction2 +=1
		
	if Input.is_action_pressed("ui_up"):
		direction2 -= 1


	# Move o personagem horizontalmente
	position.x += direction * speed * delta
	position.y += direction2 * speed * delta
