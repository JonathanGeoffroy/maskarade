class_name Game
extends Node2D

var selected_piece: Piece


func _enter_tree():
	get_tree().connect("node_added", Callable(self, "_on_node_added"))


func _on_node_added(child: Node):
	if child.is_in_group("Piece"):
		child.connect("piece_clicked", _on_piece_clicked)


func _on_piece_clicked(piece: Piece):
	if selected_piece == null:
		selected_piece = piece
	elif piece == selected_piece:
		selected_piece = null
	elif piece.accept_exchange(selected_piece):
		exchange_pieces(piece, selected_piece)


func deselect():
	selected_piece = null


func exchange_pieces(first: Piece, second: Piece):
	var first_parent := first.get_parent()
	var second_parent := second.get_parent()

	var first_local := first.position
	var second_local := second.position

	first_parent.remove_child(first)
	second_parent.remove_child(second)

	first_parent.add_child(second)
	second_parent.add_child(first)

	second.position = first_local
	first.position = second_local

	deselect()
