extends Node2D

@onready var player: CharacterBody2D = $".."

@export var speed: int



func getInput():
	var input_dir = Input.get_vector("a","d","w","s")#.normalized()
	player.velocity = input_dir * speed



func _physics_process(delta: float) -> void:
	getInput()
	player.move_and_slide()
	print(player.velocity)
