extends Control

@onready var fundo: Sprite2D = $fundo
@onready var elementoS: Sprite2D = $elemento
@onready var armaS: Sprite2D = $arma
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect



func _ready() -> void:
	nine_patch_rect.visible = false

func atualizar(bool):
	if bool:
		nine_patch_rect.visible = true
		
	else:
		nine_patch_rect.visible = false

	


#da pra trocar por sprite animadas
func setarItem(arma):
	armaS.texture = arma.tipoArma.sprite
	elementoS.texture = arma.elemento.sprite
	fundo.texture = arma.raridade.sprite
