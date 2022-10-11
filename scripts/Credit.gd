extends Node2D


#Boutton de retour menu



func _on_Menu_button_up() -> void:
	get_tree().change_scene("res://scenes/Menu.tscn")
