extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var shake_amount=0.05
var shaking=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	shake()
func _process(delta):
	if shaking>0:
		set_h_offset(rand_range(-1.0, 1.0) * shake_amount)
		set_v_offset(rand_range(-1.0, 1.0) * shake_amount)
		shaking-=delta
	
func shake():
	shaking=2

func _on_Timer_timeout():
	shake()
