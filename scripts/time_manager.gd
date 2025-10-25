extends Node 

var timeMultiplier: float = 1.0
const DEFAULT_TIME_MULTIPLIER: float = 1.0
const SLOW_TIME_MULTIPLIER: float = 0.1

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("slow_time"):
        slowTime()


func slowTime():
    var tween = create_tween()
    tween.tween_property(self, "timeMultiplier", SLOW_TIME_MULTIPLIER, 0.1).from(timeMultiplier)
    tween.tween_property(self, "timeMultiplier", DEFAULT_TIME_MULTIPLIER, 0.5).set_delay(1)