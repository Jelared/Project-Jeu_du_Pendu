extends Control

#regroupement de bouttons
export(ButtonGroup) var GroupeClavier

#variables
var LettreClavier
var Mot
var Mot_separeL = []
var affichage = ""

#listes des mots
var list = [  "apple","turnip","banana","clock","cup","flower","fork","glasses","oranage","pencil","spoon"]


func _ready():
	test()
	bouttons()
	choix_mot()
	separation_mot()

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

#démarrage ==> A revoir
func test():
	if Mot_separeL.find(LettreClavier) == -1:
		affichage = "ok"
	else :
		affichage = "no"
		
		
#	for i in Mot_separeL:
#			affichage += String(i)
#		print(i)
		$Affichage.text = affichage
			
			
	print(affichage)
