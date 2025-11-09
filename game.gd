class_name Game
extends Node2D


func _ready() -> void:
	GameFSM.connect("on_state_change", _on_state_change)

	GameFSM.set_current_state(GameFSM.State.FIRST_PLAY)


func _on_state_change(state: GameFSM.State):
	if state == GameFSM.State.FIRST_PLAY:
		%PlayerController.enable()
	else:
		%PlayerController.disable()
		if state == GameFSM.State.SECOND_PLAY:
			%IAController.play()
