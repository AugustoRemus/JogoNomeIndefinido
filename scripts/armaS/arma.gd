extends Resource

class_name arma


#criar classe encantamentos e um array pra guardar
enum Genero { MASCULINO, FEMININO }

#utilidades
#var nome: String = ""
var elemento: elemento
var tipoArma: tipoArma


#status
#var speed: float

#var penetracao:float


#raridade
@export var raridade: raridade
@export var multRariIndiv: float

#lvl
@export var nivel: int = 0
@export var experiencia: int = 0
@export var experienciaProxNivel: int = 10


#region name

@export var nome: String


#endregion



#region status

#dano

@export var dano: float

#speed

@export var speed: float

#penetracao

@export var penetracao: float
		
		
		
func atualizarStatus():
	dano = ((elemento.dano + tipoArma.dano) * (1.0 + ((nivel) * 0.05))) * raridade.mult
	penetracao = ((elemento.penetracao + tipoArma.penetracao) * (1.0 + ((nivel) * 0.05))) * raridade.mult 
	speed = ((elemento.speed + tipoArma.speed) * (1.0 + ((nivel) * 0.05))) * raridade.mult 


#endregion


#region niveis

#chamar ao upar d lvl fazer pro nivel
func uparNivel():
	nivel +=1
	atualizarStatus()
		



func adicionarXp(xp):

	experiencia += xp  #adiciona o xp
	
	while experiencia >= experienciaProxNivel:  #testa caso ganhe mt xp
		uparNivel()
		experiencia -= experienciaProxNivel #tiro o tanto nescessario pro proximo nivel
		#ajusta o tanto para o proximo nivel
		if nivel < 18:
			experienciaProxNivel = experienciaProxNivel * 1.1
		else:
			experienciaProxNivel = 50
	



#endregion


func getNome():
	return nome

#chama 1 vez pra arrumar
func setStart():
	#setaNome
	if tipoArma.genero == Genero.MASCULINO:
		nome = tipoArma.nome + " " + elemento.getNomeM() + " " + raridade.nomeM
	elif tipoArma.genero == Genero.FEMININO:
		nome = tipoArma.nome + " " + elemento.getNomeF() + " " + raridade.nomeF

	dano = ((elemento.dano + tipoArma.dano) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + ra
	speed = ((elemento.speed + tipoArma.speed) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + rarida
	penetracao = ((elemento.penetracao + tipoArma.penetracao) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + raridadeindiv

func exibirStatus():
	atualizarStatus()
	print(nome)
	print("nivel:")
	print(nivel)
	print("dano:")
	print(dano)
	print("speed:")
	print(speed)
	print("penetracao:")
	print(penetracao)
	print("")
	
