extends RayCast3D

var should_cast : bool = false
var collider : Object
var staff : RigidBody3D


func _ready():
	staff = get_parent().get_parent()
	print("Staff node is " + str(staff))

func _process(delta):
	collider = get_collider()
	
	if collider != null:
		should_cast = is_castable_node()
		# If the staff is picked up, move the collider to the end of the ray
		if staff.is_picked_up() and should_cast:
			# Move the collider to the end of the ray
			move_collider_to_ray_end(collider, global_transform.origin, get_target_position())
		else:
			return
func is_castable_node() -> bool:
	var c = collider.name.find("bounceable") != -1
	return c

func move_collider_to_ray_end(collider, ray_origin, ray_direction):
	# Ensure that the collider is not null before moving it
	if collider != null:
		var ray_end = ray_origin + ray_direction
		# Move the collider to the end of the ray
		collider.global_transform.origin = ray_end
