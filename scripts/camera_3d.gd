extends Camera3D

@export var targetPlayer: Player

var offset: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    offset = global_transform.origin - targetPlayer.global_transform.origin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
    var targetPosition := targetPlayer.global_transform.origin + offset
    global_transform.origin = global_transform.origin.lerp(targetPosition, 0.1)
