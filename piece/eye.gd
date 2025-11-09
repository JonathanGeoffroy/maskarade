class_name Eye
extends Piece

var attack_texture = preload("res://assets/eye_atk.png")
var defense_texture = preload("res://assets/eye_def.png")

@export var kind: EyeKind

enum EyeKind { ATTACK, DEFENSE }


func _ready() -> void:
	super()
	var kind = EyeKind.ATTACK if randi_range(0, 1) == 0 else EyeKind.DEFENSE

	%Sprite2D.texture = attack_texture if kind == EyeKind.ATTACK else defense_texture
