extends Control

#regroupement de bouttons
export(ButtonGroup) var GroupeClavier

#variables
var LettreClavier
var Mot
var Mot_separeL = []
var affichage = []

#listes des mots
var list = [  "apple","turnip","banana","clock","cup","flower","fork","glasses","oranage","pencil","spoon"]


func _ready():
	choix_mot()
	separation_mot()
	initialisation()
	bouttons()

#l'appuie sur un bouton envoie un signal 
func bouttons():
	for button in GroupeClavier.get_buttons():
		button.connect("pressed",self,"lettre")

#le signal : met en mémoire la lettre (en minuscule) affiché sur le bouton et bloque le bouton qui ne peut plus etre utilisé
func lettre():
	LettreClavier = GroupeClavier.get_pressed_button().text.to_lower()
	GroupeClavier.get_pressed_button().disabled = true
	print(LettreClavier)
	test()
	
	
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
		

#affichae des underscore au départ
func initialisation():
	for i in Mot_separeL:
		affichage.append("_ ")
	for i in affichage:
		$Affichage.text += String(i)
		print (affichage)
		


#test ==> A revoir
func test():
	if Mot_separeL.find(LettreClavier) == -1:
		print("no")
		print (Mot_separeL.find(LettreClavier))
	else :
		#revoir la phase ci dessous car insert décale : il faut juste mettre la lettre à la bonne place => revir les array add position
		affichage.insert(Mot_separeL.find(LettreClavier), LettreClavier)
		$Affichage.text = str(affichage)
		print("ok")
		print (Mot_separeL.find(LettreClavier))
		print (affichage)
		
