extends CharacterBody2D
#botar no player

@export var inventario: Control
@onready var arma: Node2D = $arma

var itemAtual = 1


var itemMao: arma

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_action_pressed("itemDireita"):
			itemAtual = cuidaItem(itemAtual + 1)
			inventario.atualizarArmaMao(itemAtual)
			
			
		elif Input.is_action_pressed("itemEsquerda"):
			itemAtual = cuidaItem(itemAtual - 1)
			inventario.atualizarArmaMao(itemAtual)
			
	
	
	#atualiza a variavel daqui
	itemMao = inventario.getArmaAtual(itemAtual)
	
	
	
	
	#chamam as funcao na arma
	if itemMao != null:
		arma.trocaArma(itemMao)
	else:
		arma.tiraArma()



func cuidaItem(int):
	if int < 1:
		return 5
	if int > 5:
		return 1
	return int 
	
	
