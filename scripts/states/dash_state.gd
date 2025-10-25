extends FlyingState

const DASH_DISTANCE = 3.0

var currentDistance = 0.0
var lastPos: Vector3

func enter(player: Player):
    super.enter(player)
    var input_dir = Input.get_vector("left", "right", "up", "down")
    var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()

    player.velocity += direction * 10
    player.look_at(player.global_position + Vector3.DOWN, player.velocity)
    currentDistance = 0.0
    lastPos = player.global_position

func process(player: Player, _delta):
    currentDistance += (player.global_position - lastPos).length() 
    if currentDistance >= DASH_DISTANCE:
        player.current_state = player.decelerating_state
