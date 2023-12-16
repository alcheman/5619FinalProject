extends RayCast3D

var max_distance = 10.0

func _process(delta):
	var collider = get_collider()
	if collider != null:
		var collision_point = get_collision_point()
		var distance_to_collider = (global_transform.origin - collision_point).length()

		if distance_to_collider <= max_distance:
			# The object is within the specified distance
			print("Object within distance:", collider.name)
		else:
			# The object is beyond the specified distance
			print("Object beyond distance:", collider.name)
