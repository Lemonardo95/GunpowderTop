extends State

const DECELERATION_RATE = 50

func should_collide() -> bool:
    return true


func process(player, delta):
    player.aVelocity = player.aVelocity.move_toward(Vector3.ZERO, DECELERATION_RATE * delta)
    if player.aVelocity.length() < 0.1:
        player.rotation_degrees = Vector3(0, player.rotation_degrees.y, 0)
        player.current_state = player.idle_state
        player.mesh.material_override = null

