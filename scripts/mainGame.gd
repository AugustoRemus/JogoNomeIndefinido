extends Node2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("debug")):
	#print(todosElemento[0].nomeElemento)
		pass

func _on_abrir_loja_pressed() -> void:
	print("abrindo loja")
