extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sensitivity=50
var rot=0
var rotation=0
export var speed=1
var pos3d
var animplayer
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	animplayer=get_node("AnimationPlayer")
	pos3d=get_node("Position3D")
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	if get_parent().get_node("Node2D").is_hidden():
		pass
	else:
		return 0
	var dir=pos3d.get_global_transform().origin-get_global_transform().origin
	if Input.is_action_pressed("forward"):
		move(dir.normalized()*speed*delta)
		if animplayer.get_current_animation()!="walk":
			animplayer.play("walk")
	elif Input.is_action_pressed("backward"):
		move(dir.normalized()*-speed*delta)
		if animplayer.get_current_animation()!="walk":
			animplayer.play_backwards("walk")
	else:

		animplayer.play("ArmatureAction")
	if Input.is_action_pressed("left"):
		rotate_y(-0.1)
	if Input.is_action_pressed("right"):
		rotate_y(0.1)
	rotate_y(rotation/8)
	rotation=rotation-rotation/10
	#rotate_y(rot/8)
	rot=rot-rot/8
func turn():
	rotation=deg2rad(180)
	
func _input(event):
	if event.type==InputEvent.SCREEN_DRAG:
		rot=event.relative_x/float(sensitivity)
		rotate_y(rot)