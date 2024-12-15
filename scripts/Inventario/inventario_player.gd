extends Control

@onready var inventario_iu: Control = $Inventario_Iu

var invPlayer: Array[arma] = Global.playerInventory

var aberto = false

func openIu():
	inventario_iu.open()
	aberto = true
	att()

func closeIu():
	inventario_iu.close()
	aberto = false


func att():
	inventario_iu.atualizar_slots(invPlayer)
	
