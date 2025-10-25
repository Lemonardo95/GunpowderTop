class_name Player
extends CharacterBody3D

const WALK_SPEED = 5.0

@onready var normalCollider = $NormalCol as CollisionShape3D
@onready var flyingCollider = $FlyingCol as CollisionShape3D
@onready var mesh = $BodyMesh as MeshInstance3D
@onready var explosionCol = $ExplosionCol as Area3D

var idle_state = preload("res://scripts/states/idle_state.gd").new()
var walking_state = preload("res://scripts/states/walking_state.gd").new()
var flying_state = preload("res://scripts/states/flying_state.gd").new()
var decelerating_state = preload("res://scripts/states/decelerating_state.gd").new()

var explosionMaterial = preload("res://mat/explosion.tres")

var _current_state: State = idle_state
var launchTimer: Timer = Timer.new()

var overlappingBodies = {}

func _ready() -> void:
    add_child(launchTimer)
    launchTimer.wait_time = 0.5
    launchTimer.timeout.connect(explosionFinish)
    launchTimer.one_shot = false

var current_state: State:
    get: return _current_state
    set(value):
        _current_state = value
        if _current_state:
            _current_state.enter(self)

func _physics_process(delta: float) -> void:
    var realDelta = TimeManager.timeMultiplier * delta

    current_state.process(self, realDelta)

    if Input.is_action_just_pressed("launch") && launchTimer.is_stopped():
        launchTimer.start()
        mesh.material_override = explosionMaterial

    if !launchTimer.is_stopped() && !overlappingBodies.is_empty():
        for p in overlappingBodies:
            var body: Interactable = overlappingBodies[p]
            if body.interact(self):
                overlappingBodies.erase(p)
        
    
    if current_state.should_colide():
        var collision = move_and_collide(velocity * realDelta)
        if collision:
            velocity = velocity.bounce(collision.get_normal())
            velocity.y = 0
            look_at(global_position + Vector3.DOWN, velocity)

    else:
        # If not colliding, just move the player
        velocity = TimeManager.timeMultiplier * velocity
        move_and_slide()


func explosionFinish():
    launchTimer.stop()
    mesh.material_override = null


func _on_explosion_col_body_entered(body: Node3D) -> void:
    if body is Interactable:
        overlappingBodies.set(body.get_path() , body as Interactable)


func _on_explosion_col_body_exited(body: Node3D) -> void:
    if body is Interactable:
        var expl = body as Interactable
        if expl.get_path() in overlappingBodies:
            overlappingBodies.erase(expl.get_path())
