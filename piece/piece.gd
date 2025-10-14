class_name Piece 
extends Node2D

signal piece_selected(piece: Piece) 

func _on_piece_clicked(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("piece_selected", self)
