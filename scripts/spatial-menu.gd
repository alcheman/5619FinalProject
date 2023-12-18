extends Area3D

var echus: AudioStreamPlayer
var axolotl: AudioStreamPlayer
var secunda: AudioStreamPlayer
var curSong = 0
var music
var day = preload("res://scenes/day.tres")
var night = preload("res://scenes/night.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	echus = $Echus
	axolotl = $Axolotl
	secunda = $Secunda
	var music = [echus, axolotl, secunda]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_next_song_pressed():
	print("Next song button pressed")
	if (curSong == 2):
		curSong = 0
	else:
		curSong += 1
	
	music[curSong].play()


func _on_prev_song_pressed():
	print("Prev song button pressed")
	if (curSong == 0):
		curSong = 2
	else:
		curSong -= 1
		
	music[curSong].play()


func _on_day_pressed():
	print("Day button pressed")
	$%DirectionalLight3D.light_color = Color(1, 1, 0.73, 1)
	$%WorldEnvironment.environment.set_sky(day)


func _on_night_pressed():
	print("Night button pressed")
	$%DirectionalLight3D.light_color = Color(0.2, 0.2, 0.2, 1)
	$%WorldEnvironment.environment.set_sky(night)
