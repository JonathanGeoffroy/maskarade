class_name Deck
extends Node2D

const PADDING := 12.0

var card_scene: PackedScene = preload("res://deck/card.tscn")
var cards: Array

func _init() -> void:
	var card: Card;
	
	for i in range(3): 
		card = card_scene.instantiate();
		cards.append(card);
		card.position = Vector2(i * (Card.WIDTH + PADDING), 0);
		add_child(card);
