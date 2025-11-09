class_name Piece
extends Node2D

signal piece_clicked(piece: Piece)

var gray_animation = "gray"

enum Style { NORMAL, AVAILABLE, UNAVAILABLE }

var style: Style
@export var gray_shader_progress := 0.0


func _ready() -> void:
	Global.connect("on_selection_change", on_selection_change)


func _process(delta: float) -> void:
	%Sprite2D.material.set_shader_parameter("progress", gray_shader_progress)


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


func on_selection_change(selected_piece: Piece):
	if selected_piece == null:
		style = Style.NORMAL
	else:
		var is_accepted = accept_exchange(selected_piece)
		style = Style.AVAILABLE if is_accepted else Style.UNAVAILABLE

	if style == Style.NORMAL or style == Style.AVAILABLE:
		enable()
	else:
		disable()


func enable() -> void:
	$AnimationPlayer.play(gray_animation)
	if gray_shader_progress == 1.0:
		$AnimationPlayer.seek($AnimationPlayer.get_animation(gray_animation).length, true)
	$AnimationPlayer.speed_scale = -1.0


func disable() -> void:
	$AnimationPlayer.play(gray_animation)
	$AnimationPlayer.speed_scale = 1.0
