extends Node

var time = 0 #Début du timer


#Chronomètre
func _process(delta):
	time += delta
	var secs = fmod(time,60)
	var mins = fmod (time,60*60)/60
	
	var timed = "%02d : %02d" % [mins,secs]
	$CanvasLayer/temps	.text = timed
