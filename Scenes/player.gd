extends Node2D

var stun:float = 0
var health_hearts:Array[TextureRect]

@onready var conductor:BeatConductor = get_node("/root/Main/Conductor")

func _ready():
	health_hearts.assign(get_node("/root/Main/CanvasLayer/HBoxContainer").get_children())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stun-=delta
	
	
	if(stun > 0):
		return
	handle_input()
	pass


func handle_input():
	if (Input.is_action_just_pressed("ui_left")):
		move_left()
		pass
	if (Input.is_action_just_pressed("ui_up")):
		jump()
		pass
	
	
	if (Input.is_action_just_pressed("ui_left")):
		pass
	if (Input.is_action_just_pressed("ui_left")):
		pass
	if (Input.is_action_just_pressed("ui_left")):
		pass
	pass

#movement
var left_active:bool = false
func move_left():
	#stun = 1000
	if(left_active):
		return
	
	left_active = true
	var start_position:Vector2 = position
	var tween = create_tween()
	tween.tween_property(self, "position:x", -190,conductor.sec_per_beat/2).as_relative()
	tween.tween_interval(conductor.sec_per_beat/2)
	tween.tween_callback(
		func():
			var tween2 = create_tween()
			tween2.tween_property(self, "position:x", 190, conductor.sec_per_beat/2).as_relative().from_current()
			tween2.tween_callback(func():left_active = false)
			#tween2.tween_callback(func():stun = .5)
	)
	pass

var jump_active:bool = false
func jump():
	#stun = 1000
	if(jump_active):
		return
	
	jump_active=true
	var start_position:Vector2 = position
	var tween = create_tween()
	tween.tween_property(self, "position:y", -300,conductor.sec_per_beat/2).as_relative().set_ease(Tween.EASE_OUT_IN).set_trans()
	tween.tween_interval(conductor.sec_per_beat)
	tween.tween_callback(
		func():
			var tween2 = create_tween()
			tween2.tween_property(self, "position:y", 300, conductor.sec_per_beat/2).as_relative().from_current()
			tween2.tween_callback(func():jump_active = false)
			#tween2.tween_callback(func():stun = .5)
	)
	
	pass

#attacks
func melee():
	pass

func ranged():
	pass



@export var health:int = 5



func take_damage(damage):
	health-=damage
	health_hearts[0].queue_free()
	health_hearts.pop_front()
	print(health)
	if (health<=0):
		get_tree().reload_current_scene()
	pass


func _on_area_2d_area_entered(area):
	take_damage(1)
	pass # Replace with function body.
