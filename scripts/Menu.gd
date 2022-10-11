extends Control



#func _ready() -> void:
#	$MarginContainer/HBoxContainer/classique.grab_focus()


func _on_classique_button_up() -> void:
	get_tree().change_scene("res://scenes/Main.tscn")
	

func _on_points_button_up() -> void:
	get_tree().change_scene("res://scenes/Main2.tscn")
	

func _on_Credit_button_up() -> void:
	get_tree().change_scene("res://scenes/Credit.tscn")
