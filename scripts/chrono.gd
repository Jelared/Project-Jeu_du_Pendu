extends Node



var ScoreValeur = 0
var FrameValeur = 0

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
	$Score_canva.visible = false
	$Score_canva/Points.text = "0"
	FrameValeur = 0
	
	
	
	
func affichage_game_value():
	$Score_canva.visible = true
