class_name GameFSM
extends Node

signal on_state_change(state: State)

enum State {
	START,
	FIRST_PLAY,
	FIRST_ATTACK,
	SECOND_PLAY,
	SECOND_ATTACK,
	END,
}

var current_state: State = State.START


func initialize() -> void:
	set_current_state(State.START)


func set_current_state(state: State) -> void:
	current_state = state
	on_state_change.emit(state)


func next() -> void:
	var next_state: State
	match current_state:
		State.START:
			next_state = State.FIRST_PLAY
		State.FIRST_PLAY:
			next_state = State.FIRST_ATTACK
		State.SECOND_PLAY:
			next_state = State.SECOND_PLAY
		State.SECOND_ATTACK:
			next_state = State.FIRST_PLAY
		_:
			assert(false, "Can't excute next step from current_state")
			return

	set_current_state(next_state)
