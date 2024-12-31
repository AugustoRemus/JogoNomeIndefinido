extends Node2D

@onready var player: CharacterBody2D = $player

@onready var upgrade_manager: Node2D = $CanvasLayer/UpgradeManager

@onready var bola_s_panw_local: Node2D = $BolaSPanwLocal

@onready var kikadasLabel: Label = $GridContainer3/GridContainer2/kikadas

@onready var vidas: Label = $GridContainer3/GridContainer/vidas

@onready var bola: CharacterBody2D = $bola

@onready var kikadasText: Label = $GridContainer3/GridContainer3/kikadas

@onready var camera_2d: Camera2D = $Camera2D

@onready var iniciar: Timer = $iniciar

var vidasPlayer = 3
var kikadas :float =  0
var valorKikada: float = 1
var dificultador: int = 1

 

var kikadasParaEscolha = 10

var kikadaParaProximaEscolha = 0


func _ready() -> void:
	kikadasText.text = str(kikadasParaEscolha - kikadaParaProximaEscolha)
	bola.speed = bola.bolaSpeedBase/2 
	iniciar.start()
	
	


func _on_bola_pegou() -> void:
	bola.speed += dificultador
	kikadas += valorKikada
	kikadasLabel.text = str(kikadas)
	checarKikadas()

func checarKikadas():
	
	kikadaParaProximaEscolha +=1
	kikadasText.text = str(kikadasParaEscolha - kikadaParaProximaEscolha)
	
	if kikadaParaProximaEscolha == kikadasParaEscolha:
		upgrade_manager.Exibir3()
		Engine.time_scale = 0  
		#para o tempo ate o signal para adicionar os status
		kikadaParaProximaEscolha = 0
	


func checaVida():
	if vidasPlayer == 0:
		get_tree().change_scene_to_file("res://cenas/menu.tscn")


func escolhaAtributos():
	pass


func _on_player_debug() -> void:
	upgrade_manager.Exibir3()
	#exibir upgrades
	



func _on_upgrade_manager_escolhido_1(upgrade1) -> void:
	Engine.time_scale = 1 
	addAtributos(upgrade1)


func _on_upgrade_manager_escolhido_2(upgrade2) -> void:
	Engine.time_scale = 1 
	addAtributos(upgrade2)


func _on_upgrade_manager_escolhido_3(upgrade3) -> void:
	Engine.time_scale = 1  
	addAtributos(upgrade3)


func addAtributos(up: upgrade):


	
	#player
	vidasPlayer += up.vidasPlayer
	if(player.scale.x < 3):
		player.scale.x +=  up.tamanhoPlayer
	if(player.speed < 300):
		player.speed += up.playerSpeed
	
	#bola
	if(bola.scale.x< 1):
		bola.scale.x += up.tamanhoBola
		bola.scale.y += up.tamanhoBola
	kikadas += up.kikadas
	
	valorKikada += up.valorKikada
	dificultador+= up.dificultador
	bola.speed += up.speedBola
	if bola.speed < 30:
		bola.speed = 30
	
	if kikadasParaEscolha < 5 :
		kikadasParaEscolha += up.kikadasParaEscolha
	kikadaParaProximaEscolha += up.kikadaParaProximaEscolha
	
	vidas.text = str(vidasPlayer)
	kikadasLabel.text = str(kikadas)
	kikadasText.text = str(kikadasParaEscolha - kikadaParaProximaEscolha)
	

	
	
func _on_timer_timeout() -> void:
	#reinicia
	bola.speed = bola.bolaSpeedBase/2
	iniciar.start()
	bola.position = bola_s_panw_local.position
	#botar som
	vidasPlayer -=1
	vidas.text = str(vidasPlayer)
	
	checaVida()


func _on_iniciar_timeout() -> void:
	bola.speed =  bola.bolaSpeedBase
	
