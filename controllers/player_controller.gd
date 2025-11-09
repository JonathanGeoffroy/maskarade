class_name PlayerController
extends Node

@export var is_enabled := false


func _enter_tree():
	get_tree().connect("node_added", Callable(self, "_on_node_added"))


func _ready():
	for piece in get_tree().get_nodes_in_group("Piece"):
		_connect_to_piece(piece)

	get_tree().connect("node_added", _on_node_added)


func _on_node_added(child: Node):
	if child.is_in_group("Piece"):
		child.connect("piece_clicked", _on_piece_clicked)


func _connect_to_piece(piece):
	if not piece.is_connected("piece_clicked", _on_piece_clicked):
		piece.connect("piece_clicked", _on_piece_clicked)


func _on_piece_clicked(piece: Piece):
	if !is_enabled:
		return

	var selected_piece = Global.selected_piece
	if selected_piece == null:
		Global.set_selected_piece(piece)
	elif piece == selected_piece:
		deselect()
	elif piece.accept_exchange(selected_piece):
		deselect()
		Global.exchange(piece, selected_piece)


func deselect():
	Global.set_selected_piece(null)


func enable():
	is_enabled = true


func disable():
	is_enabled = false
	deselect()
