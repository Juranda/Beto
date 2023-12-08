class_name MusicRecorder extends Node2D

@export var data_path: String

func _ready():
	if(save_level_data(0)):
		print("salvo com sucesso!")
		var level_data = load_level_data(0)
		print(level_data.hits)
	else:
		print("deu ruim familia")

func save_level_data(level: int) -> bool:
	var level_data: LevelData = LevelData.new(0, [
		MusicHit.new(),
		MusicHit.new()
	])
	
	var error = ResourceSaver.save(level_data, "res://levels_resources/level1.res")
	return error == OK
	
func load_level_data(level: int) -> LevelData:
	return ResourceLoader.load("res://levels_resources/level1.res") as LevelData

	
