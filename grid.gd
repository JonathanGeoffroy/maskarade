class_name Grid
extends Node2D

const ROWS := 3
const COLS := 3
const SIZE := 600.0

@export var mask_scene: PackedScene = preload("res://mask.tscn")

var grid: Array = []


func _ready():
	_init_grid()
	set_process_input(true)


func _init_grid():
	var width = SIZE / COLS
	var height = SIZE / ROWS

	var mask: Mask

	grid.clear()
	for r in range(ROWS):
		var row_arr = []
		for c in range(COLS):
			mask = mask_scene.instantiate()
			mask.scale = Vector2(width / Mask.SIZE, height / Mask.SIZE)

			mask.position = Vector2(c * width, r * height)
			add_child(mask)
			row_arr.append(mask)
		grid.append(row_arr)


func _draw():
	var cell_w = SIZE / COLS
	var cell_h = SIZE / ROWS

	for r in range(ROWS):
		var color = Color(1, 0, 0, 0.3) if (r < 2) else Color(0, 0, 1, 0.3)
		for c in range(COLS):
			var rect = Rect2(Vector2(c * cell_w, r * cell_h), Vector2(cell_w, cell_h))
			draw_rect(rect, color, true)

	var line_color = Color.BLACK
	for i in range(COLS + 1):
		var x = i * cell_w
		draw_line(Vector2(x, 0), Vector2(x, SIZE), line_color, 2)
	for j in range(ROWS + 1):
		var y = j * cell_h
		draw_line(Vector2(0, y), Vector2(SIZE, y), line_color, 2)
