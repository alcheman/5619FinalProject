extends Area3D

var echus: AudioStreamPlayer
var axolotl: AudioStreamPlayer
var secunda: AudioStreamPlayer
var curSong = 0
var dayEnv = preload("res://scenes/day_environment.tres")
var nightEnv = preload("res://scenes/night_environment.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	echus = $Echus
	axolotl = $Axolotl
	secunda = $Secunda
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	self.look_at($%XROrigin3D.position, Vector3.UP)
#	self.rotation.x = 200
	#self.rotation.z = 180
	pass

# Plays to the next song
func _on_next_song_pressed():
	print("Next song button pressed")
	if (curSong == 0):
		secunda.stop()
		axolotl.stop()
		echus.play()
		curSong += 1
	elif (curSong == 1):
		echus.stop()
		secunda.stop()
		axolotl.play()
		curSong += 1
	elif (curSong == 2):
		axolotl.stop()
		echus.stop()
		secunda.play()
		curSong = 0

# Plays the previous song
func _on_prev_song_pressed():
	print("Prev song button pressed")
	if (curSong == 0):
		secunda.stop()
		axolotl.stop()
		echus.play()
		curSong = 2
	elif (curSong == 1):
		echus.stop()
		secunda.stop()
		axolotl.play()
		curSong -= 1
	elif (curSong == 2):
		axolotl.stop()
		echus.stop()
		secunda.play()
		curSong -= 1

# Sets it to day
func _on_day_pressed():
	print("Day button pressed")
	$%DirectionalLight3D.light_color = Color(1, 1, 0.73, 1)
	$%WorldEnvironment.environment = dayEnv

# Sets it to day
func _on_night_pressed():
	print("Night button pressed")
	$%DirectionalLight3D.light_color = Color(0.2, 0.2, 0.2, 1)
	$%WorldEnvironment.environment = nightEnv
