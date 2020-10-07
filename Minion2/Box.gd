extends RigidBody2D

var isLevitating = false
var vecUp = Vector2.UP

func enable():
	apply_central_impulse(vecUp * 15)
	gravity_scale = 0
	print("Activado")

func disable():
	gravity_scale = 1
	print("Desactivado")

func levitate():
	isLevitating = !isLevitating
	if(isLevitating):
		enable()
	else:
		disable()
