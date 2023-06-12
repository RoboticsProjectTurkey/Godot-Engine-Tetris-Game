extends KinematicBody2D

onready var main = get_tree().get_current_scene()
var is_active = 0
var collide
var once = 0
var switch = 0

func _physics_process(delta):
	if is_active == 1:
		collide = move_and_collide(Vector2(0,32))
	
	if is_active == 1 and collide and once == 0:
		once = 1
		main.random_add()
	
	if collide and switch == 0:
		switch = 1
		main.find_blocks()
	
	if is_active == 0:
		if Input.is_action_just_pressed("ui_right"):
			position.x += 64
		if Input.is_action_just_pressed("ui_left"):
			position.x += -64
		if Input.is_action_just_pressed("ui_select"):
			main.blocks.append(get_node("."))
			is_active = 1
