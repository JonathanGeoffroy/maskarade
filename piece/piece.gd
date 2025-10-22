class_name Piece
extends Node2D

signal piece_clicked(piece: Piece)


func _on_piece_clicked(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("piece_clicked", self)


func get_size() -> Vector2:
	var sprite = %Sprite2D
	var texture = sprite.texture
	return texture.get_size() * sprite.scale


func get_mask() -> Mask:
	return get_parent()


func accept_exchange(piece: Piece) -> bool:
	return piece.get_groups() == get_groups()
