extends Resource

class_name tipoArma

enum Genero { MASCULINO, FEMININO }
@export_category("nome")
##nome da base
@export var nome: String  = ""
@export var genero: Genero

@export_category("status")
##dano que caisa
@export var dano: float
@export var speed: float
@export var penetracao: float

@export_category("cosmetico")
@export var sprite: Texture2D
