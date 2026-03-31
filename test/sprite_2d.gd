extends Sprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@export var gravity = 980
var vTotal = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += Vector2(0,gravity) * delta
	
	
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	position.x += movement(direction, "x") * delta
	position.y += movement(direction, "y") * delta
	
#	move_and_slide()


func movement(direction, x_y : String):
	var vx = vTotal * sin(-rotation_degrees)
	var vy = ( vTotal * cos(-rotation_degrees) ) + gravity
	
	vTotal = sqrt( (vx * vx) + (vy * vy) )
	
	if direction:
		rotation_degrees += direction * 5
		rotation_degrees = int(rotation_degrees)
		
	if (70 > abs(vy) ):
		rotation_degrees -= 2 * sin(rotation_degrees)
		rotation_degrees = int(rotation_degrees)
	
	if (abs(vTotal) > 80):
		vTotal = vTotal * 0.9
	
	##vy *= -1
	#print("_________________")
	#print("Direction: ", direction)
	#print("Vx: ", vx)
	#print("Vy: ", vy)
	#print("VTotal: ", vTotal)
	#print("Rotation: ", -rotation_degrees)
	#print("_________________")
	
	if x_y == "x":
		return vx 
	if x_y == "y":
		return vy
