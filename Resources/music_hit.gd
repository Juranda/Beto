class_name MusicHit extends Resource

enum HitButton {
	A, B, X, Y
}

@export var botao: HitButton

var a: MusicHit = MusicHit.new()

func _ready():
	a.botao = HitButton.A
