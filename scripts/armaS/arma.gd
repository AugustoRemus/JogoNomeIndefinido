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
var raridade: raridade
var multRariIndiv: float

#lvl
var nivel: int = 0
var experiencia: int = 0
var experienciaProxNivel: int = 10


#region name

var _nome = ""
var nome: String: 
	get:
		if _nome == "":
			if tipoArma.genero == Genero.MASCULINO:
				_nome = tipoArma.nome + " " + elemento.getNomeM() + " " + raridade.nomeM
			elif tipoArma.genero == Genero.FEMININO:
				_nome = tipoArma.nome + " " + elemento.getNomeF() + " " + raridade.nomeF
		return _nome

#endregion



#region status

#dano
var _dano = -1
var dano: float: 
	get:
		if _dano == -1:
			_dano = ((elemento.dano + tipoArma.dano) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + raridadeindiv
		return _dano

#speed
var _speed = -1
var speed: float: 
	get:
		if _speed == -1:
			_speed = ((elemento.speed + tipoArma.speed) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + raridadeindiv
		return _speed

#penetracao
var _penetracao = -1
var penetracao: float: 
	get:
		if _penetracao == -1:
			_penetracao = ((elemento.penetracao + tipoArma.penetracao) * (1.0 + ((nivel) * 0.05))) * raridade.mult # + raridadeindiv
		return _penetracao
		
		
		
func atualizarStatus():
	_dano = ((elemento.dano + tipoArma.dano) * (1.0 + ((nivel) * 0.05))) * raridade.mult
	_penetracao = ((elemento.penetracao + tipoArma.penetracao) * (1.0 + ((nivel) * 0.05))) * raridade.mult 
	_speed = ((elemento.speed + tipoArma.speed) * (1.0 + ((nivel) * 0.05))) * raridade.mult 


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
	
