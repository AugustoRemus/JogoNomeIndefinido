extends Node2D

@onready var criador: Node = $Criador
@onready var luck_manager: Node = $LuckManager


@onready var botoesBaixo: GridContainer = $CanvasLayer/GridContainer


@onready var inventario: Control = $Inventario_Iu



func _ready() -> void:
	
	pass
	
	
	



func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("debug")):
	#print(todosElemento[0].nomeElemento)
		pass



#region botoes

func esconderBotoes():
	botoesBaixo.visible = false
func mostrarBotoes():
	botoesBaixo.visible = true

#endregion




#region loja

func _on_abrir_loja_pressed() -> void:

	print("abrindo loja")
	var arma = criador.criarArmaAleatoria()
	var teste = Global.addArma(arma)
	Global.printarInventario()
	inventario.atualizar_slots(Global.invPlayer)


#endregion


#region inventario
#
#func _on_abrir_inventario_pressed() -> void:
	#inventario.open(Global.invPlayer)
	#esconderBotoes()
	#print("abrir inv")
	#
#
#
#func _on_inventario_iu_fechado() -> void:
	#mostrarBotoes()
	#
	#
#endregion
