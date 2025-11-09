class_name IAController
extends Node


func play() -> void:
	var pieces = get_tree().get_nodes_in_group("Piece")
	var first_index = randi_range(0, pieces.size() - 1)
	var first: Piece = pieces[first_index]

	var second: Piece = null

	var second_index: int
	while second == null:
		second_index = randi_range(0, pieces.size() - 1)
		if second_index != first_index:
			var choosen_piece = pieces[second_index]
			if first.accept_exchange(choosen_piece):
				second = choosen_piece

	Global.exchange(first, second)
