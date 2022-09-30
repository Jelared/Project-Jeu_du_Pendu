extends Node

var time = 0 #Début du timer
var ScoreValeur = 0
var FrameValeur = 0

#Chronomètre
func chronodepart(delta):
	
	$Chrono_canva.visible = true
	$Score_canva.visible = true
	
	time += delta
	var secs = fmod(time,60)
	var mins = fmod (time,60*60)/60
	
	var timed = "%02d : %02d" % [mins,secs]
	$Chrono_canva/temps.text = timed



#Score
func addpoint():
	
	ScoreValeur += 1
	print("score",ScoreValeur)
	$Score_canva/Points.text = str(ScoreValeur)


#Frame pendu
func addframe():
	FrameValeur += 1

