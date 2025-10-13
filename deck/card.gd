class_name Card
extends Node2D

signal card_selected(card: Card);

const WIDTH := 128.0;
const BORDER := 12.0;

var text := "Add";
var text_pos := Vector2(BORDER, 128);
var font: Font = preload("res://assets/font.ttf");

func _draw():
	draw_string(font, text_pos, text, HORIZONTAL_ALIGNMENT_CENTER, WIDTH - BORDER * 2, 16, Color.BLACK) 


func _on_card_clicked(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("card_selected", self)
		
