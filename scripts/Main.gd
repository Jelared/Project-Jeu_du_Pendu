extends Control

export(ButtonGroup) var GroupeClavier


func _ready():
	
	
	
	
	
	
	for button in GroupeClavier.get_buttons():
		button.connect("pressed",self,"lettre")
	
	
func lettre():
	var LettreClavier = GroupeClavier.get_pressed_button().text
	GroupeClavier.get_pressed_button().disabled = true
	
	var TexteMy = "pendu"
	
	if LettreClavier in TexteMy:
		print ("vrai")





##Chooses a random word from the list array 
#func choose_random_word():
#	selected_word = list[randi()%list.size()]
#	print(selected_word)
#
##Creates a new array with the choosen word seperating each letter into a new part of the array
#func breakdown_random_word():
#	for letters in selected_word:
#		selected_word_breakdown.append(letters)
