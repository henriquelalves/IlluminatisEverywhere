


extends KinematicBody2D


# member variables here, example:
# var a=2
# var b="textvar"

var VELXMAX = 150
var MAXCOINS = 6
var coinscount = 0
var mortal = true

func _ready():
	# Initialization here
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	
	var posX = self.get_pos()
	
	if(Input.is_action_pressed("ui_right")):
		move(Vector2(VELXMAX*delta,0))
	if(Input.is_action_pressed("ui_left")):
		move(Vector2(-VELXMAX*delta,0))
	if(Input.is_action_pressed("ui_up")):
		move(Vector2(0,-VELXMAX*delta))
	if(Input.is_action_pressed("ui_down")):
		move(Vector2(0,VELXMAX*delta))
	
	if is_colliding():  # colliding with Static, Kinematic, Rigid
        # do something
		var coins = get_node("../Coins")
		if(coins.is_a_parent_of (get_collider())):
			get_collider().hide()
			get_collider().set_pos( Vector2(1000, -1000))
			coinscount+=1
			print(coinscount)
			if (coinscount >= MAXCOINS):
				get_node("../Ending").show()
				mortal = false
			#remove_and_delete_child(get_collider())
			
	
	pass




