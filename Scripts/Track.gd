#Track
#This script controls the track UI, lap count/timer, and volume.
#Lucas McFarlane - Samya Shah
#Comp Sci 40S FINAL ASSIGNMENT | C-Slot Mr. Scott

extends Spatial
onready var time = 0.0 #float value to store lap times
onready var lapCount = 0 #int value to store lap count
onready var bestTime = 1000000.0 #float value to store best laptime

func _ready(): #runs once when scene is loaded
	$Trees.visible = Global.trees #enable or disable trees based on global
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) #hide mouse cursor
	$AudioStreamPlayer.volume_db = Global.volume #adjust volume based on global

func _input(ev): #when a key is pressed
	if Input.is_action_just_pressed("ui_cancel"): #if key is esc
		get_tree().change_scene("res://Scenes/MainMenu.tscn") #return to main menu

func _physics_process(delta): #runs once every frame
	time = time + delta #add time since last frame to laptime
	if $"Finish Line/FinishRayCast".get_collider() == $VehicleBody: #if car is crossing the finish line
		if time < bestTime and time > 0.1: #if car has left the finish line, and was faster than last lap
			bestTime = time #update best lap time
		if time > 0.1: #if car has left the finish line
			lapCount += 1 #add a lap
			$Control/Label3.set_text("Lap " + str(lapCount)) #update lap UI
		time = 0

	$Control/Label.set_text(str(time)) #update time UI
	if bestTime != 1000000.0: #if player finished first lap
	  $Control/Label2.set_text("Best Time: " + str(bestTime)) #update best time UI
