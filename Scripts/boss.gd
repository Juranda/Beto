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
	print(mao_direita.position)
	pass

var ataque1Active:bool = false
func ataque1():
	if(ataque1Active):
		return
	ataque1Active = true
	mao_direita.active = false
	print("ataque1")
	
	
	var start_position:Vector2 = mao_direita.position
	var target_position:Vector2 = Vector2(-239,27)
	
	var tween = create_tween()
	tween.tween_property(mao_direita, "position", target_position, conductor.sec_per_beat).set_trans(Tween.TRANS_ELASTIC).set_delay(conductor.sec_per_beat)
	tween.tween_callback(
		func():
			var tween2 = create_tween()
			tween2.tween_property(mao_direita, "position", start_position,conductor.sec_per_beat).set_trans(Tween.TRANS_EXPO)
			tween2.tween_callback(
				func():
					mao_direita.active = true
					ataque1Active = false
					pass
			)
			)
		
	
	
	


var ataque2Active:bool = false
func ataque2():
	if(ataque2Active):
		return
	ataque2Active = true
	mao_esquerda.active = false
	print("ataque2")
	
	var start_position:Vector2 = mao_esquerda.position
	var target_position1:Vector2 = Vector2(-240, -93)
	var target_position2:Vector2 = Vector2(-239,27)
	
	
	var tween = create_tween()
	tween.tween_property(mao_esquerda, "position", target_position1, conductor.sec_per_beat)
	tween.tween_callback(
		func():
			var tween2 = create_tween()
			tween2.tween_property(mao_esquerda, "position", target_position2,.1).set_delay(conductor.sec_per_beat)
			tween2.tween_callback(
				func():
					var tween3 = create_tween()
					tween3.tween_property(mao_esquerda, "position", start_position, conductor.sec_per_beat).set_delay((conductor.sec_per_beat)-.1)
					tween3.tween_callback(
					func():
						print(position)
						mao_esquerda.active = true
						ataque2Active = false
						pass
			)
			
			)
			)
		
	

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



