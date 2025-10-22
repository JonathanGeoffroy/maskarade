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


func exchange_pieces(first: Piece, second: Piece, duration := 0.2):
	first.z_index = 10
	second.z_index = 10

	var parent_first := first.get_parent()
	var parent_second := second.get_parent()

	var local_first := first.position
	var local_second := second.position

	var global_first := first.global_position
	var global_second := second.global_position

	parent_first.remove_child(first)
	parent_second.remove_child(second)
	parent_first.add_child(second)
	parent_second.add_child(first)

	first.global_position = global_first
	second.global_position = global_second

	var target_first: Vector2 = parent_second.to_global(local_second)
	var target_second: Vector2 = parent_first.to_global(local_first)

	var tween := create_tween()
	tween.tween_property(first, "global_position", target_first, duration)
	tween.parallel().tween_property(second, "global_position", target_second, duration)
	tween.finished.connect(
		func():
			first.z_index = 0
			second.z_index = 0
	)

	deselect()
