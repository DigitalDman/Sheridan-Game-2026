extends RigidBody2D

# Export variables to tweak in the inspector
@export var engine_thrust: float = 100.0
@export var spin_thrust: float = 5000.0

@export var lift_coeficient : float = 500.0
@export var wing_area : float = 5.0
@export var volume : float = 2.0
@export var glider_velocity : float = 2.0
var lift_float = 0.0

func _integrate_forces(state):
	pass
	## Apply torque for rotation
	#var density = mass / volume
	#
	#var rotation_dir = 0
	#if Input.is_action_pressed("ui_left"):
		#rotation_dir -= 1
	#if Input.is_action_pressed("ui_right"):
		#rotation_dir += 1
	#
	#state.apply_torque(rotation_dir * spin_thrust) # Use state.apply_torque
	## Apply force in the body's forward direction (relative to its rotation)
	#
	#var thrust = Vector2.ZERO
	#if Input.is_action_pressed("ui_up"):
		## state.transform.x is the body's "forward" vector (right in Godot 2D)
		#thrust = state.transform.x * engine_thrust
	#
	## Use state.apply_force for continuous force
	#
	#
	#state.apply_force(thrust) 
	#
	###### LIFT STUFF #####
	#var lift = Vector2.ZERO
	#
	##if (abs(linear_velocity.x) > 500):
		##linear_velocity.x -= 50
		##
	##if (abs(linear_velocity.y) > 500):
		##if (linear_velocity.y > 0):
			##linear_velocity.y -= 50
		##else:
			##linear_velocity.y += 50
	#var rotatingXVelocity = state.linear_velocity.x * cos(rotation_degrees)
	#
	#lift_float = -lift_coeficient *( (density * (state.linear_velocity.x) * (state.linear_velocity.x)) / 1000 ) * wing_area
	##lift = state.transform.y * lift_float
	#
	##state.apply_force(Vector2(0,lift_float))
	#
	#print("___________________")
	#print("Linear Velocity: ", rotatingXVelocity)
	#print("Lift: ", lift_float)
	#print("___________________")
	#######################

func _process(delta: float) -> void:
	#linear_velocity.x = 10000 * delta
	pass

var rot: float = 0
@export var grav: int = 15
var vy:float = 0
var vx:float = 0
var vtotal:float = 0

func _physics_process(delta):
	
	
	vx = vtotal*sin(rot)
	vy = vtotal*cos(rot)+grav
	if (vtotal >= 50):
		vtotal = vtotal*0.9
	if Input.is_action_pressed("ui_left"):
		rot -= 0.05
	if Input.is_action_pressed("ui_right"):
		rot += 0.05
	
	linear_velocity = Vector2(vx, vy)
	
	vtotal = sqrt(vx*vx+vy*vy)
	
	if (10>=abs(vy)):
		rot += 0.05*sin(rot)
		#print("Slowing down")
	if (abs(vx)>=500):
		#print("ZOOM")
		if (vtotal >40):
		#	print("HI")
			rot -= (-0.07)*sin(rot)
	
	print("-----------------------------")
	print("VX: ", vx)
	print("VY: ", vy)
	print("Vtotal: ", vtotal)
	print("-----------------------------")
	
	rotation = rot
