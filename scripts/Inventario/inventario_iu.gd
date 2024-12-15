extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@export var slot: PackedScene = preload("res://cenas/slot_ui.tscn")
@onready var grid: GridContainer = $CanvasLayer/NinePatchRect/GridContainer

@onready var info_arma: NinePatchRect = $CanvasLayer/InfoArma


@onready var nome_arma: Label = $CanvasLayer/InfoArma/ControleExibicao/NomeArma

@onready var dano: Label = $CanvasLayer/InfoArma/ControleExibicao/status/Dano
@onready var speed: Label = $CanvasLayer/InfoArma/ControleExibicao/status/Speed
@onready var pen: Label = $CanvasLayer/InfoArma/ControleExibicao/status/pen
@onready var nivel: Label = $CanvasLayer/InfoArma/GridLvl/nivel



@onready var fechar: Timer = $Fechar




func _ready() -> void:
	canvas_layer.visible = true
	atualizarArmaMao(1)
	


#aqui usa pelo index retorna a arma se tiver
func atualizarArmaMao(int):
	if int > 5 or int < 0:
		return "errou"
		
	#escolhe qual vai aparecer o efeito
	for childs in grid.get_children():
		childs.atualizar(false)
	var setar = grid.get_child(int - 1)
	setar.atualizar(true)
	
	mostrarStats(int)
	
	
func mostrarStats(int):
	fechar.start()
	if (int > Global.invPlayer.size()):
		info_arma.visible = false
		return
		
	var ArmaAtualGrid = Global.getArma(int - 1)
	
	
	if ArmaAtualGrid != null:
		info_arma.visible = true
		nome_arma.text =ArmaAtualGrid.nome  #pq printa na tela e n no outro
		nivel.text = str(ArmaAtualGrid.nivel)
		dano.text =str(ArmaAtualGrid.dano)
		speed.text =str(ArmaAtualGrid.speed)
		pen.text =str(ArmaAtualGrid.penetracao)
		
		#print(Global.invPlayer[int -1].nome)
	
	

	


func atualizar_slots(itens:Array[arma]):
	
	var contador = 0
	for item in itens:
		var slote = grid.get_child(contador)
		contador += 1
		#slote.fundo.texture = item.raridade.sprite
		slote.setarItem(item)
		


func _on_reorganizar_pressed() -> void:
	Global.reorganiza(false)
	atualizar_slots(Global.invPlayer)
	mostrarStats(1)


func _on_tras_pressed() -> void:
	Global.reorganiza(true)
	atualizar_slots(Global.invPlayer)
	mostrarStats(1)


func _on_fechar_timeout() -> void:
	info_arma.visible = false
	#fazer sumir aos poucos
