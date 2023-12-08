class_name Boss extends Node2D

@export var pattern:Array[MusicHit] = [
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	MusicHit.new(1, MusicHit.Ataques.Mao1),
	]


@onready var mao_esquerda:Area2D = $MaoEsquerda
@onready var mao_direita :Area2D = $MaoDireita
var conductor:BeatConductor

func _ready():
	conductor = get_node("/root/Main/Conductor")
	conductor.beat.connect(thisBeat)
	pass
func ataque1():
	print("ataque1")
	pass

func ataque2():
	print("ataque2")
	pass

func thisBeat(song_position_in_beats):
	
	pass
