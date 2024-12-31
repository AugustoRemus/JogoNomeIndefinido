extends Node2D

@export var lista: Array[upgrade]

@onready var canvas_layer: CanvasLayer = $CanvasLayer

@onready var upgrade_ui: Control = $CanvasLayer/Tudo/upgradeUi

@onready var upgrade_ui_2: Control = $CanvasLayer/Tudo/upgradeUi2

@onready var upgrade_ui_3: Control = $CanvasLayer/Tudo/upgradeUi3

var upgrade1
var upgrade3
var upgrade2

signal escolhido1(upgrade)

signal escolhido2(upgrade)
signal escolhido3(upgrade)

func Exibir3():
	#se pa mudar para testar se n é igual fica melhor e da pra botar mais condicoes e ate botar mais um se fizzw arai
	canvas_layer.visible = true
	
	upgrade1 = lista [randi_range(0,lista.size()-1)]
	lista.erase(upgrade1)
	upgrade_ui.setar(upgrade1)
	
	upgrade2 = lista [randi_range(0,lista.size()-1)]
	lista.erase(upgrade2)
	upgrade_ui_2.setar(upgrade2)
	
	upgrade3 = lista [randi_range(0,lista.size()-1)]
	lista.erase(upgrade3)
	upgrade_ui_3.setar(upgrade3)
	
	
	lista.append(upgrade1)
	lista.append(upgrade2)
	lista.append(upgrade3)
	
	


func _on_upgrade_ui_pressed() -> void:
	escolhido1.emit(upgrade1)
	esconder()


func _on_upgrade_ui_2_pressed() -> void:
	escolhido2.emit(upgrade2)
	esconder()


func _on_upgrade_ui_3_pressed() -> void:
		escolhido3.emit(upgrade3)
		esconder()
		
		
		
		
func esconder():
	canvas_layer.visible = false
	
