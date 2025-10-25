class_name Explosive
extends Interactable

func interact(player: Player) -> bool:
    player.current_state = player.flying_state

    var direction = (player.global_position - global_position).normalized()

    player.velocity += direction * 50
    player.look_at(player.global_position + Vector3.DOWN, player.velocity)

    queue_free()
    TimeManager.slowTime()
    return true