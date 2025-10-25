extends State

func process(player, _delta):
    var input_dir = Input.get_vector("left", "right", "up", "down")
    var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
    if direction:
        player.current_state = player.walking_state
    else:
        player.velocity = player.velocity.move_toward(Vector3.ZERO, player.WALK_SPEED)
