extends State

func process(player: Player, _delta):
    var direction = player.get_input()
    if not direction:
        player.current_state = player.idle_state
    else:
        player.velocity = direction * player.WALK_SPEED
