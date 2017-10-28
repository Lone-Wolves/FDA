extends Spatial

var p1;var p2;var p3;var p4
var bould
func _ready():
	p1=get_node("Position3D")
	p2=get_node("Position3D1")
	p3=get_node("Position3D2")
	p4=get_node("Position3D3")
	bould=load("res://bouldeer.tscn")
func genbould():
	var b=bould.instance()
	add_child(b)
	b.set_translation(point_gen())
	
func point_gen():
	var pz=rand_range(p1.get_translation().z,p2.get_translation().z)
	var px=rand_range(p1.get_translation().x,p3.get_translation().x)
	var py=0
	var ranp=Vector3(px,py,pz)
	return ranp

func _on_Timer_timeout():
	genbould()
