extends Control

# Regroupement de bouttons
export(ButtonGroup) var groupe_clavier

#Variables
var lettre_clavier #lettre choisie
var mot #mot à trouver
var mot_separeL = [] #array avec les lettres séparées
var affichage = [] #Array avec les lettres trouvées
var affichage_ = "" #String avec les lettres trouvées

#Listes des mots
var list = [
	"apple",
	"turnip",
	"banana",
	"clock",
	"cup",
	"flower",
	"fork",
	"glasses",
	"oranage",
	"pencil",
	"spoon"
	]


func _ready():
	choix_mot()
	separation_mot()
	initialisation()
	bouttons()

#L'appuie sur un bouton envoie un signal 
func bouttons():
	for button in groupe_clavier.get_buttons():
		button.connect("pressed",self,"lettre")

#Le signal : met en mémoire la lettre (en minuscule) affiché sur le bouton et bloque le bouton qui ne peut plus etre utilisé
func lettre():
	lettre_clavier = groupe_clavier.get_pressed_button().text.to_lower()
	groupe_clavier.get_pressed_button().disabled = true
	print(lettre_clavier)
	test()
	
	
#Choix d'un mot dans une liste  : aléatoire randi(), entre %, 0 et le nombre total de mot dans la liste size()
func choix_mot():
	randomize()
	mot = list[randi()%list.size()]
	print(mot)
	

#Séparation des lettres du mot choisi : boucle for, dans la liste mot, variable lettreM, dans la liste Mot_separeL, append ajoute les lettreM 
func separation_mot():
	for lettreM in mot:
		mot_separeL.append(lettreM)
		print(mot_separeL)
		

#affichage des underscore au départ
func initialisation():
	for i in mot_separeL:
		affichage.append("_ ")
	for i in affichage:
		affichage_ += String(i)
		$Affichage.text = affichage_
		print (affichage)


#test ==> A revoir
func test():
	var position_L = mot_separeL.find(lettre_clavier)
	if position_L == -1:
		print("no")
		print (position_L)
	else :
		#attention au lettre double à revoir
		affichage_ = ""
		affichage[position_L] = lettre_clavier
		for i in affichage:
			affichage_ += String(i)
			$Affichage.text = affichage_
		print("ok")
		print (mot_separeL.find(lettre_clavier))
		print (affichage)
		
