extends Node


var time = 0 #Début du timer
var time_stop = true
var ScoreValeur = 0
var FrameValeur = 0
var secs
var mins

func menu_reset():
	print("menu reset")
	time_stop = true
	$Score_canva/Points.text = "0"
	
#Chronomètre ecoulement
func _process(delta):
	time += delta
	var secs = fmod(time,60)
	var mins = fmod (time,60*60)/60
	var timed = "%02d : %02d" % [mins,secs]
	$Chrono_canva/temps.text = timed


func chronodepart():
	time = 0

#Score
func addpoint():
	ScoreValeur += 1
	print("score",ScoreValeur)
	$Score_canva/Points.text = str(ScoreValeur)


#Frame pendu
func addframe():
	FrameValeur += 1
	
func reset():
	print("reset")
	$Score_canva/Points.text = "0"
	
func affichage_game_value():
	$Chrono_canva.visible = true
	$Score_canva.visible = true
	
func disparition_game_value():
	$Chrono_canva.visible = false
	$Score_canva.visible = false
	
