extends Resource

class_name raridade

@export_category("nome")
##nome interno
@export var nome: String

##nome no masculino
@export var nomeM: String
##nome no feminino
@export var nomeF: String

@export_category("resto")
##multiplicacao d dano da arma
@export var mult: float

##numero que na somatoria vai dar a chance total de cair esse item quando somar todas as coisas
@export var numeroChance: int
