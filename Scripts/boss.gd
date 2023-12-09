class_name Boss extends Node2D


@onready var mao_esquerda:Area2D = $MaoEsquerda
@onready var mao_direita :Area2D = $MaoDireita

var conductor:BeatConductor
var current_beat:int = 0

@export var current_pattern = []
var data_file_path = "res://patterns/Pattern1.json"

func load_json_file(filePath:	String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Array:
			return parsedResult
		else:
			print("File isn't Dictionary")
	else:
		print("file doesn't exist")



func _ready():
	current_pattern = load_json_file(data_file_path)
	conductor = get_node("/root/Main/Conductor")
	conductor.beat.connect(thisBeat)
	pass
func ataque1():
	print("ataque1")
	var tween = create_tween()
	
	#tween.tween_property(mao_direita)
	pass

func ataque2():
	print("ataque2")
	pass

func thisBeat(song_position_in_beats):
	if current_beat == current_pattern.size():
		return
		
	if song_position_in_beats >= current_pattern[current_beat]["beat"]:
		var current_attack:int = current_pattern[current_beat]["action"]
		conductor.get_child(1).play()
		match current_attack:
			0:
				ataque1()
				pass
			1:
				ataque2()
				pass
			_:
				print("bruh moment")
				pass
		pass
		current_beat += 1
	pass



