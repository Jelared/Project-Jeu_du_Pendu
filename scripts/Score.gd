extends Node


var ScoreValeur = 0

func addpoint():
	ScoreValeur += 1
	$Points.text = str("ScoreValeur")
	print("point")
