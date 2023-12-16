extends RigidBody3D

var speed = 10.0
var raycast_length = 10.0
var raycast_result_position: Vector3 = Vector3.ZERO

var line_drawer : ImmediateGeometry

# Called every physics frame. 'delta' is the elapsed time since the previous physics frame.
func _ready():
	# Create an ImmediateGeometry node for line drawing
	line_drawer = ImmediateGeometry.new()
	add_child(line_drawer)

func _integrate_forces(state):
	# Perform raycast
	var from_position = global_transform.origin
	var to_position = from_position + global_transform.basis.z * raycast_length

	var raycast_result = $RayCast.ray_cast(from_position, to_position)

	# Update raycast result position
	raycast_result_position = raycast_result.position if raycast_result else to_position

	# Apply movement forces based on input
	var move_direction = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		move_direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		move_direction.z += 1
	if Input.is_action_pressed("ui_left"):
		move_direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		move_direction.x += 1

	move_direction = move_direction.normalized()  # Normalize to ensure consistent speed in all directions
	apply_central_impulse(move_direction * speed)

	# Update line position
	line_drawer.clear()
	line_drawer.begin(Mesh.PRIMITIVE_LINES)
	line_drawer.add_vertex(from_position)
	line_drawer.add_vertex(raycast_result_position)
	line_drawer.end()

