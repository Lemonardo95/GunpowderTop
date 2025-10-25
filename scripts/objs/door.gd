class_name Door
extends StaticBody3D

var finalPos

func _ready() -> void:
    finalPos = position - Vector3(0, 2.5, 0)

func open():
    var tween = create_tween()
    tween.tween_property(self, "position", finalPos, 0.5)