extends Node


@export var playerInventory: Array[arma]



func exibirInv():
	#arma exibirstatus(
	for arma in playerInventory:
		print(arma.nome)
		print(arma.nivel)
		print()
