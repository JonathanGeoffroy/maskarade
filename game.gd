class_name Game
extends Node2D

var selected_piece: Piece


func _enter_tree():
	get_tree().connect("node_added", Callable(self, "_on_node_added"))


func _on_node_added(child: Node):
	if child.is_in_group("Piece"):
		child.connect("piece_selected", _on_piece_selected)


func _on_piece_selected(piece: Piece):
	selected_piece = piece
