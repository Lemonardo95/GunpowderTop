extends Node

var ray: RayCast3D
var cam: Camera3D
var mousePos: Vector3

func setRoot(root: Node3D) -> void:
    cam = root.get_node("Camera3D")
    ray = root.get_node("RayCast3D")

    
func _physics_process(_delta: float) -> void:
    var mouseScreenPos = get_viewport().get_mouse_position()
    ray.global_position = cam.project_ray_origin(mouseScreenPos)
    ray.target_position = ray.global_position + cam.project_ray_normal(mouseScreenPos) * 1000
    ray.force_raycast_update()

    if ray.is_colliding():
        mousePos = ray.get_collision_point()

func getMousePosition() -> Vector3:
    return mousePos
