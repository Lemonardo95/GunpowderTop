extends State

const DECELERATION_RATE = 50

func should_colide() -> bool:
    return true


func process(player, delta):
    player.velocity = player.velocity.move_toward(Vector3.ZERO, DECELERATION_RATE * delta)
    if player.velocity.length() < 0.1:
        player.rotation_degrees = Vector3(0, player.rotation_degrees.y, 0)
        player.current_state = player.idle_state
        player.normalCollider.disabled = false
        player.flyingCollider.disabled = true