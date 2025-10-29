extends State

func process(player, _delta):
    var direction = player.get_input()
    if direction:
        player.current_state = player.walking_state
    else:
        player.aVelocity = player.aVelocity.move_toward(Vector3.ZERO, player.WALK_SPEED)
