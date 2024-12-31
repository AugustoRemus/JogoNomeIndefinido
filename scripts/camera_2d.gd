extends Camera2D

@export var tremor_intensidade: float = 2.0  # Intensidade do tremor (quanto maior, mais forte será o tremor)
@export var tremor_duracao: float = 0.2      # Duração do tremor em segundos

var original_position: Vector2
var timer: float = 0.0

func _ready():
	# Guarda a posição original da câmera
	original_position = position

func _process(delta: float) -> void:
	if timer > 0:
		# Subtrai o tempo decorrido da duração
		timer -= delta
		# Cria um efeito de tremor movendo a câmera aleatoriamente
		position = original_position + Vector2(randf_range(-tremor_intensidade, tremor_intensidade), randf_range(-tremor_intensidade, tremor_intensidade))
	else:
		# Quando o tremor acaba, volta para a posição original
		position = original_position

func iniciar_tremor():
	timer = tremor_duracao  # Inicia o temporizador do tremor


func _on_bola_tremer() -> void:
	iniciar_tremor()
