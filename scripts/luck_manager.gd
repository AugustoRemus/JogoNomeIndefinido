extends Node


#exporta alguma biblioteca melhor
@export var raridades : Array[raridade] = []

var rng = RandomNumberGenerator.new()

func GerarAleatoriedade(sorteInt:int,  sorteMult:float, debug:bool):
	#criando o numero
	rng.randomize()
	var goldeNumber = rng.randi_range(0,100)
	var total:float = 0
	var quantRaridades = raridades.size()
	
	
	#adiciona aqui as parada da sorte!
	if(debug):
		print("golden")
		print(goldeNumber)
	
	for raridade in raridades:
		total += raridade.numeroChance
	
	if(debug):
		print(total)
		



	if(debug):	
		var percent: Array 
		for raridade in raridades:
			percent.append( (100 / total) * raridade.numeroChance) 
			
		for i in percent.size():
			print(raridades[i].nome)
			print(percent[i])

	
	var vetNum : Array = []
	
	for v in raridades.size():	#compara cada elemento na somatoria ate q n chega
		if v == 0:
			vetNum.append(raridades[0].numeroChance)
		else:
			vetNum.append(vetNum[v-1] +raridades[v].numeroChance )
	
		if goldeNumber < vetNum[v]:
			#print(raridades[v].nome)
			return raridades[v]
	
	
	#deu pau
	return raridades[0]


	
	
func _ready() -> void:
	GerarAleatoriedade(0,0, false)
