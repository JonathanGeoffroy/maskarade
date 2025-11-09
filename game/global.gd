extends Node

signal on_selection_change(piece: Piece)

var score := 0
var fsm := GameFSM.new()
var selected_piece: Piece


func initialize() -> void:
	score = 0
	fsm.initialize()


func set_selected_piece(piece: Piece):
	if piece != selected_piece:
		selected_piece = piece
		on_selection_change.emit(piece)
