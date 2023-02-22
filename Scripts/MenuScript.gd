#MenuScript
#This script handles all aspects of the main menu
#Lucas McFarlane - Samya Shah
#Comp Sci 40S FINAL ASSIGNMENT | C-Slot Mr. Scott

extends Control

func _ready(): #runs once when the scene is loaded
	$"Settings Screen/EnableTrees".pressed = Global.trees #set trees based on singleton
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #set mouse to visible for navigating menu
	$"Settings Screen/HSlider".value = Global.volume #set volume slider position based on singleton

func _on_Play_pressed(): #when play button is pressed
	$"Main Screen".hide() #hide main menu UI
	$"Level Select Screen".show() #show level select UI

func _on_Settings_pressed(): #when settings button is pressed
	$"Main Screen".hide() #hide main menu UI
	$"Settings Screen".show() #show settings UI

func _on_Controls_pressed(): #when controls button pressed
	$"Main Screen".hide() #hide main menu UI
	$"Controls Screen".show() #show controls UI

func _on_Quit_pressed(): #when quit button pressed
	get_tree().quit() #close game

func _on_ReturnFromControlScreen_pressed(): #when return button is pressed (from any sub-menu)
	#hide all sub-menu UI's
	$"Controls Screen".hide() 
	$"Settings Screen".hide()
	$"Level Select Screen".hide()
	#show main menu UI
	$"Main Screen".show()

func _input(ev): #when a key is pressed
	if Input.is_action_just_pressed("ui_cancel"): #if key is esc
		get_tree().quit() #close game

func _on_Level1_pressed(): #if level one selected
	get_tree().change_scene("res://Scenes/TrackOne.tscn") #load track one

func _on_Level2_pressed(): #if level 2 selected
	get_tree().change_scene("res://Scenes/TrackTwo.tscn") #load track two
	
func _on_Level3_pressed(): #if level three selected
	get_tree().change_scene("res://Scenes/TrackThree.tscn") #load track three

func _on_EnableTrees_pressed(): #if enable trees checkbox toggled
	Global.trees = !Global.trees #set global bool to its inverse

func _on_ToggleFullscreen_pressed(): #if fullscreen checkbox toggled
	OS.window_fullscreen = !OS.window_fullscreen #enable/disable fullscreen based on current state

func _on_HSlider_value_changed(value):#if volume slider is adjusted
	Global.volume = $"Settings Screen/HSlider".value #set global int based on slider new position
	$AudioStreamPlayer.volume_db = Global.volume #update music player volume
