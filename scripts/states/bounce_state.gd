extends State

var enterVelocity: Vector3
var timer = 0.0

const CHOICE_TIME = 1.0

var arrow: Arrow

func enter(player: Player):
    enterVelocity = player.aVelocity
    timer = CHOICE_TIME
    player.aVelocity = Vector3()
    arrow = player.get_node("Arrow")
    arrow.visible = true

func process(player: Player, delta):
    timer -= delta
    if timer <= 0.0:
        var dir = (arrow.to_global(Vector3.FORWARD) - arrow.global_position).normalized()
        dir.y = 0
        player.aVelocity = enterVelocity.length() * dir
        player.current_state = player.flying_state
        arrow.visible = false
