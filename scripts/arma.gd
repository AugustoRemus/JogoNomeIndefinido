extends Node2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var armaAtual: arma

func trocaArma(armaa:arma):
	if armaa == armaAtual:
		return
	else:
		sprite_2d_2.texture = armaa.tipoArma.sprite
		armaAtual = armaa
		
func tiraArma():
	armaAtual = null
	sprite_2d_2.texture = null
	
