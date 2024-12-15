extends Node


var moedasPlayer
var invPlayer: Array[arma]


func _ready() -> void:
	moedasPlayer = 0 #ver d save



func printarInventario():
	
	for arma in invPlayer:
		print(arma.nome)
		print(arma.nivel)
		print()







func getArma(int):
	if int < 0 or int > invPlayer.size()-1 or invPlayer.is_empty() :
		return null
		
	
	return invPlayer[int]
	

func addArma(arma):
	if invPlayer.size() < 5:
		invPlayer.append(arma)
		return true
	else:
		invPlayer[4] = arma
		return false


func reorganiza(condicao):
	if invPlayer.is_empty():
		return
	if condicao:
		var armareorganiza = invPlayer[0]
		invPlayer.erase(armareorganiza)
		invPlayer.append(armareorganiza)
	else:
		var armareorganiza = invPlayer[-1]
		invPlayer.erase(armareorganiza)
		invPlayer.insert(0,armareorganiza)
		
		
