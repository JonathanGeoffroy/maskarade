class_name Game
extends Node2D


var selected_card: Card;
var selected_mask: Mask;


func _enter_tree():
	get_tree().connect("node_added", Callable(self, "_on_node_added"));

func _on_node_added(child: Node):
	if child.is_in_group("Mask"):
		child.connect("mask_selected", _on_mask_selected);
	elif child.is_in_group("Card"):
		child.connect("card_selected", Callable(self, "_on_card_selected"));


func _on_mask_selected(mask: Mask):
	selected_mask = mask;


func _on_card_selected(card: Card):
	selected_card = card;
