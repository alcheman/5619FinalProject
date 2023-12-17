extends XROrigin3D

# Reference to XROrigin3D
var xr_origin: XROrigin3D = null

# Array to hold references to XRToolsPickable objects
var pickable_objects: Array = []

# The maximum distance for triggering the movement
var max_distance_threshold: float = 10.0

# The percentage by which to shorten the distance
var shorten_percentage: float = 0.5

# Called every frame
func _process(_delta):
	# Check the distance between XROrigin3D and each pickable object
	for pickable in pickable_objects:
		if pickable.is_instance_valid() and xr_origin.is_instance_valid():
			var distance = xr_origin.global_transform.origin.distance_to(pickable.global_transform.origin)
			print("distance " + str(distance))
			# If the distance exceeds the threshold, move XROrigin3D
			if distance < max_distance_threshold:
				shorten_distance(pickable)

# Move XROrigin3D to shorten the distance
func shorten_distance(pickable: XRToolsPickable) -> void:
	var current_distance = xr_origin.global_transform.origin.distance_to(pickable.global_transform.origin)
	var target_distance = current_distance * (1.0 - shorten_percentage)

	# Calculate the new position towards the pickable object
	var direction = (pickable.global_transform.origin - xr_origin.global_transform.origin).normalized()
	var new_position = xr_origin.global_transform.origin + direction * target_distance

	# Set the new position for XROrigin3D
	xr_origin.global_transform.origin = new_position
