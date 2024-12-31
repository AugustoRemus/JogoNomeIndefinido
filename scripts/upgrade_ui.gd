extends TextureButton

@onready var nome: Label = $GridContainer/nome
@onready var descr: Label = $GridContainer/Descr


@onready var texture_rect: TextureRect = $TextureRect

@export var debug: upgrade


func _ready() -> void:
	setar(debug)

func setar(up:upgrade):
	visible = true
	nome.text = up.nome
	descr.text = up.descricao
	texture_rect.texture = up.sprite
	pass
