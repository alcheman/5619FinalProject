extends StaticBody3D

var originalPosition: Vector3
var moveAmount: float = 1
var gate_open_distance: float = 3
var movement_speed: float = 1
var gate_opened: bool = false
var gate_open_height: float = 2  

@export var player: XRCamera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	originalPosition = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for proximity to player
	if player:
		var distance = global_transform.origin.distance_to(player.global_transform.origin)
		if distance <= gate_open_distance:
			move_gate(delta)
		else:
			close_gate(delta)

# move gate up
func move_gate(delta):
	if position.y <= gate_open_height:
		position.y += moveAmount * movement_speed * delta
	else:
		gate_opened = true
# close gate when player is away
func close_gate(delta):
	if position.y >= originalPosition.y:
		position.y -= moveAmount * movement_speed * delta
	else:
		gate_opened = false
