class_name Jowl
extends Piece

var plus_texture = preload("res://assets/jowl_plus.png")
var minus_texture = preload("res://assets/jowl_minus.png")

@export var kind: JowlKind

enum JowlKind { PLUS, MINUS }


func _ready() -> void:
	var kind = JowlKind.PLUS if randi_range(0, 1) == 0 else JowlKind.MINUS

	%Sprite2D.texture = plus_texture if kind == JowlKind.PLUS else minus_texture
