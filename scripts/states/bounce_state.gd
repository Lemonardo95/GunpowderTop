extends State

var enterVelocity: Vector3
var timer = 0.0

const CHOICE_TIME = 1.0

func enter(player: Player):
    enterVelocity = player.velocity
    timer = CHOICE_TIME
    player.velocity = Vector3()

func process(player, delta):
    timer -= delta
    if timer <= 0.0:
        player.velocity = enterVelocity
        player.current_state = player.flying_state
