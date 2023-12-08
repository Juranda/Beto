class_name MusicHit extends Resource


@export var beat: int
@export var acao: Ataques

func _init(number:int, ataque:Ataques):
	beat = number
	acao = ataque
	pass

enum Ataques {
	Mao1,
	Mao2
}

func _init(beat: int = 0, acao: Ataques = Ataques.Mao1):
	self.beat = beat
	self.acao = acao
