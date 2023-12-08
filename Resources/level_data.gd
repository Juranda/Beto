class_name LevelData extends Resource
#nao sei pq esse script existe
extends Resource
class_name LevelData

@export var level_id: int = 0
@export var hits: Array[MusicHit] = []

func _init(level_id: int, hits: Array[MusicHit] = []):
	self.level_id = level_id
	self.hits = hits
