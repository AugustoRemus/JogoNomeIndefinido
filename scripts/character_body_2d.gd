extends CharacterBody2D
@export var speed = 75 

signal debug

func _physics_process(delta: float) -> void:
	var direcao = Input.get_axis("a", "d")
	velocity.x = direcao * speed 
	move_and_slide()
	
	if (Input.is_action_pressed("debug")):
		debug.emit()
		



	
