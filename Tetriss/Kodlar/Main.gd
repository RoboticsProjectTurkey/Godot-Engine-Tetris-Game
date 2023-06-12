extends Node2D

onready var blocks = []
var score = 0

func _ready():
	$Block.once = 0
	$Block2.once = 1
	$Block3.once = 1
	$Block4.once = 1

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		find_blocks()

func random_add():
	update_score(5)
	randomize()
	var c = int(rand_range(1,7))
	if c == 1:
		add_block(Vector2(4*64-24,80),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(6*64-24,80),1)
		add_block(Vector2(7*64-24,80),1)
	elif c == 2:
		add_block(Vector2(5*64-24,80-64),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(6*64-24,80),1)
		add_block(Vector2(6*64-24,80-64),1)
	elif c == 3:
		add_block(Vector2(5*64-24,80-64),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(6*64-24,80),1)
		add_block(Vector2(7*64-24,80),1)
	elif c == 4:
		add_block(Vector2(7*64-24,80-64),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(6*64-24,80),1)
		add_block(Vector2(7*64-24,80),1)
	elif c == 5:
		add_block(Vector2(4*64-24,80),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(5*64-24,80-64),1)
		add_block(Vector2(6*64-24,80-64),1)
	elif c == 6:
		add_block(Vector2(4*64-24,80-64),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(5*64-24,80-64),1)
		add_block(Vector2(6*64-24,80),1)
	elif c == 7:
		add_block(Vector2(4*64-24,80),1)
		add_block(Vector2(5*64-24,80),0)
		add_block(Vector2(6*64-24,80),1)
		add_block(Vector2(5*64-24,80-64),1)

func add_block(var b, var c):
	var a = preload("res://Sahneler/Block.tscn").instance()
	add_child(a)
	a.position = b
	a.once = c

func find_blocks():
	get_tree().paused = true
	var i = 0
	var k = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	while i<blocks.size():
		var n = (int(blocks[i].position.y)-207)/64
		k[n-1]+=1
		i+=1
	i = 0
	while i<k.size():
		if k[i]==10:
			var ni = (i+1)*64+207
			var ii=0
			while ii<blocks.size():
				if int(blocks[ii].position.y) == ni:
					blocks[ii].queue_free()
					blocks.remove(ii)
					ii-=1
				ii+=1
			update_score(20)
			break
		i+=1
	get_tree().paused = false

func update_score(var a):
	score += a
	$Label.text = str(score)
