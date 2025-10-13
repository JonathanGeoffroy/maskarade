class_name Mask
extends Node2D

signal mask_selected(card: Card);

static var SIZE := 400.0


func _on_mask_clicked(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("mask_selected", self)
