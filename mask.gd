class_name Mask
extends Node2D

signal mask_selected(mask: Mask)

static var SIZE := 400.0


func set_piece(current: Piece, next: Piece) -> void:
	for child in get_children():
		print("child ", child)
		if child == current:
			child.replace_by(next)
