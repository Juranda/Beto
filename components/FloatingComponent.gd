extends Area2D

@export var v_distance:float
@export var v_speed:float
@export var v_offset:float

@export var h_distance:float
@export var h_speed:float
@export var h_offset:float

var v_time:float
var h_time:float
var middle:Vector2

var active:bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	middle = position
	v_time += v_offset
	h_time += h_offset
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active:
		return
	
	v_time+=delta
	h_time+=delta
	
	position = middle + Vector2(sin(h_time*h_speed)*h_distance,sin(v_time*v_speed)*v_distance)
	
