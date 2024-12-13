extends Node

@export var todosElemento: Array[elemento]
@export var todasArmas: Array[tipoArma]
#@export var arrayRaridade: Array[raridade]

@export var todasRaridades: arrayRaridade

@onready var luck_manager: Node = $LuckManager



func criarArmaAleatoria():
	luck_manager.raridades = todasRaridades.array

	
	var novaArma = arma.new()
	
	novaArma.tipoArma = todasArmas[randi_range(0,todasArmas.size()-1)] #pega um aleatorio da pilha e bota o nome
	novaArma.elemento = todosElemento[randi_range(0,todosElemento.size()-1)] #pega um aleatorio do elemento
	novaArma.raridade = luck_manager.GerarAleatoriedade(0,0,false)
	#novaArma.nivel = 0
	
	return novaArma
	



func _ready() -> void:
	var arma = criarArmaAleatoria()
	InventarioPlayer.playerInventory.append(arma)
	InventarioPlayer.exibirInv()
	

	#arma.exibirStatus()
	#arma.adicionarXp(100)
	#arma.exibirStatus()



	
