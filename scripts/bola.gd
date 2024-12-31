extends CharacterBody2D

@export var nodo: Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var speed = 120

var direcao: Vector2 = Vector2(1, 1)  

var direcoes = [1,-1]

signal pegou
signal tremer

var bolaSpeedBase =120

func _ready() -> void:
	
	direcao = Vector2(direcoes[randi_range(0,1)],direcoes[randi_range(0,1)])
	

func _physics_process(delta: float) -> void:
	
	if is_on_wall():
		direcao.x = -direcao.x 
		audio_stream_player_2d.play()
		tremer.emit()
	elif is_on_ceiling():
		direcao.y = -direcao.y
		audio_stream_player_2d.play()
		tremer.emit()
		
	elif is_on_floor():
		print("poin")
		direcao.y = -direcao.y
		print(speed)
		pegou.emit()
		audio_stream_player_2d.play()
		tremer.emit()

	velocity = direcao * speed


	move_and_slide()  
