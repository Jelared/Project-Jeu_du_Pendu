extends Control

#regroupement de bouttons
export(ButtonGroup) var GroupeClavier

#variables
var LettreClavier
var Mot
var Mot_separeL = []
var affichage = "test"

#listes des mots
var list = [  "apple","turnip","banana","clock","cup","flower","fork","glasses","oranage","pencil","spoon"]


func _ready():
	bouttons()
	choix_mot()
	separation_mot()
	demarrage()

#démarrage ==> A revoir
func demarrage():
	$Affichage.text = affichage
	affichage = Mot_separeL.size()
	print(Mot_separeL.size())


#l'appuie sur un bouton envoie un signal qui met en mémoire la lettre afficher sur le bouton et bloque le bouton qui ne peut plus etre utilisé
func bouttons():
	for button in GroupeClavier.get_buttons():
		button.connect("pressed",self,"lettre")

func lettre():
	LettreClavier = GroupeClavier.get_pressed_button().text
	GroupeClavier.get_pressed_button().disabled = true
	print(LettreClavier)
	
#Choix d'un mot dans une liste  : aléatoire randi(), entre %, 0 et le nombre total de mot dans la liste size()
func choix_mot():
	randomize()
	Mot = list[randi()%list.size()]
	print(Mot)
	

#Séparation des lettres du mot choisi : boucle for, dans la liste mot, variable lettreM, dans la liste Mot_separeL, append ajoute les lettreM 
func separation_mot():
	for lettreM in Mot:
		Mot_separeL.append(lettreM)
		print(Mot_separeL)
