extends Node

signal on_selection_change(piece: Piece)

var score := 0
var selected_piece: Piece


func initialize() -> void:
	score = 0


func set_selected_piece(piece: Piece):
	if piece != selected_piece:
		selected_piece = piece
		on_selection_change.emit(piece)


func exchange(first: Piece, second: Piece) -> void:
	_do_exchange_pieces(first, second)
	GameFSM.next()


func _do_exchange_pieces(first: Piece, second: Piece, duration := 0.2) -> void:
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
			GameFSM.next()
	)
