#CarController
#Basic script to control car movement
#Lucas McFarlane - Samya Shah
#Comp Sci 40S FINAL ASSIGNMENT | C-Slot Mr. Scott

#Sources:
# https://www.youtube.com/watch?v=zXLpitpFC6E

extends VehicleBody

func _physics_process(delta): #Runs once every frame
	#determine steering angle of the car
	steering = lerp(steering, Input.get_axis("TurnRight", "TurnLeft") * 0.4, 1*delta)
	#determine the speed of the car
	engine_force = Input.get_axis("Accelerate", "Brake") * 100
