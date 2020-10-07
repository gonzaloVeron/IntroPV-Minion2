extends KinematicBody2D

var run_speed = 200
var jump_speed = -65
onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var targets = []
var index = 0

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if Input.is_action_just_pressed("ui_accept"):
		var target = targets[index]
		var vec = target.position - global_position
		var dir = vec.normalized()
		target.disable()
		target.apply_impulse(Vector2(40, 0), dir * 100)
	
	if Input.is_action_just_pressed("testE"):
		targets[index].levitate()
		

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				index = (index + 1) % targets.size()
				print("Seleccionada la caja " + str(index))
			elif event.button_index == BUTTON_WHEEL_DOWN:
				index = 2 if index == 0 else (index - 1) % 3
				print("Seleccionada la caja " + str(index))
