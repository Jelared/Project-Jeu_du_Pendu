##Main

extends Control

# Regroupement de bouttons
export(ButtonGroup) var groupe_clavier

#Variables
var lettre_clavier #lettre choisie
var mot #mot à trouver
var mot_separeL = [] #array avec les lettres séparées
var affichage = [] #Array avec les lettres trouvées
var affichage_ = "" #String avec les lettres trouvées
var perdu = 1
var gainperte


#Listes des mots
var list = get_from_json("res://liste.json")


func _ready():
#	$Menu.grab_focus()
	choix_mot()
	separation_mot()
	initialisation()
	bouttons()
	

#################################################################################################
#demarrage du jeux


##Lettres avec boutons ou clavier (grâce au raccourcie dans les bouttons) : L'appuie sur un bouton envoie un signal 
func bouttons():
	for button in groupe_clavier.get_buttons():
		button.connect("pressed",self,"lettre")


#Le signal : met en mémoire la lettre (en minuscule) affiché sur le bouton et bloque le bouton qui ne peut plus etre utilisé
func lettre():
	lettre_clavier = groupe_clavier.get_pressed_button().text.to_lower()
	groupe_clavier.get_pressed_button().disabled = true
	print(lettre_clavier)
	test()
#
	
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


##################################################################################################
#Fonction du test


#test pour la lettre choisie
func test():
	var position_L = mot_separeL.find(lettre_clavier)
	if position_L == -1:
		Musicontroler.rate()
		print("no")
		print (position_L)
		pendu()
	else :
		while position_L > -1: #boucle pour vérifier s'il existe plusieurs fois la lettre
			Musicontroler.reussi()
			affichage_ = ""
			affichage[position_L] = lettre_clavier #affichage de la lettre à la bonne position
			for i in affichage:
				affichage_ += String(i)
				$Affichage.text = affichage_
			position_L = mot_separeL.find(lettre_clavier,position_L+1) # suite la boucle qui décale la position de 1 pour vérif
			gagner()
			print("ok")
			print (mot_separeL.find(lettre_clavier))
			print (affichage)


##################################################################################################
#gagner ou perdu


#Comptage de perte/Game-Over
func pendu():
	if perdu < 7 :
		$Pendu.frame = perdu
		perdu += 1
	if perdu == 7 :
		gainperte = "PERDU"
		Brejouer()


#Affichage gagner
func gagner():
	var a = mot_separeL
	print("g")
	var b = affichage
	if a==b :
		gainperte = "GAGNER"
		Brejouer()


#Bouton de relance du jeux
func Brejouer():
	$Container.queue_free() #dispartion des boutons des lettres
	$Fin.visible = true
	var buttonR = Button.new()
	$Fin.text = "%s - Rejouer" %gainperte
	$Fin.connect("pressed", self, "rejouer")
	
#Relance du jeux
func rejouer():
	get_tree().reload_current_scene()
	

##################################################################################################
#Liste de mot
	
	
# Importation json
func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

##################################################################################################
#Bouton interface

#Boutton de retour menu
func _on_Menu_button_up() -> void:
	get_tree().change_scene("res://scenes/Menu.tscn")
