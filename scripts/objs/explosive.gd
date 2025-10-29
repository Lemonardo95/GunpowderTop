class_name Explosive
extends Interactable

func interact(player: Player) -> bool:
    player.current_state = player.flying_state

    var direction = (player.global_position - global_position).normalized()

    player.aVelocity = direction * (50 + player.aVelocity.length()) 

    queue_free()
    TimeManager.slowTime()
    return true