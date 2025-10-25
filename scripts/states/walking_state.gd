extends State

func process(player, _delta):
    var input_dir = Input.get_vector("left", "right", "up", "down")
    var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
    if not direction:
        player.current_state = player.idle_state
    else:
        player.velocity = direction * player.WALK_SPEED
