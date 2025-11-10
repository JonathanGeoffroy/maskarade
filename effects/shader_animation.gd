class_name ShaderAnimation
extends Node

@export var animation_name := "effect"
@export var progress := 0.0;


		
func _process(delta: float) -> void:
	get_parent().material.set_shader_parameter("progress", progress);

func enable() -> void :
	$AnimationPlayer.play(animation_name)
	$AnimationPlayer.speed_scale = -1.0
	
	
func disable() -> void :
	$AnimationPlayer.play(animation_name);
	$AnimationPlayer.speed_scale = 1.0
