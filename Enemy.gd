
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var VEL = 100
var angle = 0

func _ready():
	# Initialization here
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	move(Vector2(cos(angle*PI/180)*VEL*delta,sin(angle*PI/180)*VEL*delta))
	
	var player = get_node("../Player")
	var paredes = get_node("../Paredes")

	if is_colliding():  
		if (get_collider() == player):
			if(player.mortal):
				player.remove_and_skip()
			#Concertar aqui!!!!
		elif (paredes.is_a_parent_of (get_collider())):
			angle += 90
			if(angle == 360):
				angle = 0
	pass
    


