class_name Selector
extends Node2D

@onready var game: Game = get_tree().current_scene


func _process(delta):
	queue_redraw()


func _draw() -> void:
	var piece := game.selected_piece

	if piece != null:
		draw_rect(Rect2(piece.global_position, piece.get_size() / 2), Color.BLACK, false, 4.0)
