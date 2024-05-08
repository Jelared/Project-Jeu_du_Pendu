##Main 2##


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
var score = 0 #score

#Listes des mots
var list = get_from_json("res://liste.json")


#Démarrage des fonctions
func _ready():
	$Menu.grab_focus()
	choix_mot()
	separation_mot()
	initialisation()
	bouttons()
	frame()
	affichage_scor()



#################################################################################################
#Gestion de l'autoload


#appel de la frame sauvegardé (à partir de l'autoload) => utiliser qd on passe au mot suivant lors du reload
func frame():
	var Frame = GameValue.FrameValeur
	$Pendu.frame = Frame
	
#appel du score sauvegardé (à partir de l'autoload) => utiliser qd on passe au mot suivant lors du reload
func affichage_scor() : 
	GameValue.affichage_game_value()


##################################################################################################
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
			print (mot_separeL.find(lettre_clavier))
			print (affichage)



##################################################################################################
#Si erreur


#Comptage du nombre d'erreur et affichage de la frame correspondant
func pendu():
	if perdu < 7 :
		#Mise en mémoire de la frame
		GameValue.addframe()
		var Frame = GameValue.FrameValeur
		$Pendu.frame = Frame
		perdu += 1
	if perdu == 7 :
		recommencer()


#Bouton de relance du jeux en entier
func recommencer():
	$Container.visible = false #dispartion des boutons des lettres
	$Nbdemots.visible = true
	score = GameValue.ScoreValeur
	$Nbdemots.text = "Vous avez trouvé : %s mots (cliquez ici pour rejouer ou espace)" % score
	$Nbdemots.connect("pressed", self, "rejouer")

	
#redemarrage du jeux en entier
func rejouer():
	GameValue.reset()
	get_tree().reload_current_scene()


##################################################################################################
#Si mot trouvé



#Gain de 1 point
func gagner():
	var a = mot_separeL
	var b = affichage
	if a==b :
		GameValue.addpoint()
		yield(get_tree().create_timer(1.0), "timeout")
		relance()


#mot suivant (après avaoir gagner un point de score)
func relance():
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
	GameValue.reset()
	get_tree().change_scene("res://scenes/Menu.tscn")
