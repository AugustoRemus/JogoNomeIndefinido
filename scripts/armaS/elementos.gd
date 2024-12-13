extends Resource #se paresorce
#separar por cabo. lamina


class_name elemento




	#da pta botar os elementos em oprdem e depois botar os efeitos em um array nessa ordeem e so puxa o index
var efeito: Sprite2D #texture

@export_category("nome")
@export var nomeComplementoM: Array[String]
@export var nomeComplementoF: Array[String]
@export var nomeElemento: String

@export_category("status")
@export var dano: float 
@export  var speed: float
@export var penetracao: float

#var sprite: Sprite2D

func getNomeM():
	return nomeComplementoM[randi_range(0, nomeComplementoM.size()-1)]

func getNomeF():
	return nomeComplementoF[randi_range(0, nomeComplementoF.size()-1)]
