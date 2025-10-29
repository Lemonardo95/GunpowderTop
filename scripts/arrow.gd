class_name Arrow
extends Node3D


func _process(_delta):
    look_at(MouseWorldPos.getMousePosition(), MouseWorldPos.cam.global_position - global_position)
    rotation_degrees.z = 0
    rotation_degrees.x = 0
