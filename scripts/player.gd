class_name Player
extends CharacterBody3D

const WALK_SPEED = 5.0

@onready var mesh = $BodyMesh as MeshInstance3D

var idle_state = preload("res://scripts/states/idle_state.gd").new()
var walking_state = preload("res://scripts/states/walking_state.gd").new()
var flying_state = preload("res://scripts/states/flying_state.gd").new()
var decelerating_state = preload("res://scripts/states/decelerating_state.gd").new()
var dash_state = preload("res://scripts/states/dash_state.gd").new()

var _current_state: State = idle_state

var current_state: State:
    get: return _current_state
    set(value):
        _current_state = value
        if _current_state:
            _current_state.enter(self)

func _physics_process(delta: float) -> void:
    var realDelta = TimeManager.timeMultiplier * delta
    if Input.is_action_just_pressed("launch") && get_input().length() > 0:
        current_state = dash_state
    current_state.process(self, realDelta)
    
    if current_state.should_colide():
        var collision = move_and_collide(velocity * realDelta)
        if collision:
            if collision.get_collider() is Interactable:
                if (collision.get_collider() as Interactable).interact(self):
                    return
            velocity = velocity.bounce(collision.get_normal())
            velocity.y = 0
            look_at(global_position + Vector3.DOWN, velocity)

    else:
        # If not colliding, just move the player
        velocity = TimeManager.timeMultiplier * velocity
        move_and_slide()


func get_input() -> Vector3:
    var input_dir = Input.get_vector("left", "right", "up", "down")
    return Vector3(input_dir.x, 0, input_dir.y).normalized()