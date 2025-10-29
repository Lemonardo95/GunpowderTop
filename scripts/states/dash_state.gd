extends FlyingState

const DASH_DISTANCE = 3.0

var currentDistance = 0.0
var lastPos: Vector3

var explosionMaterial = preload("res://mat/explosion.tres")


func enter(player: Player):
    super.enter(player)
    var direction = player.get_input()

    player.aVelocity = direction * (10 + player.aVelocity.length())
    currentDistance = 0.0
    lastPos = player.global_position

    player.mesh.material_override = explosionMaterial


func process(player: Player, _delta):
    currentDistance += (player.global_position - lastPos).length() 
    if currentDistance >= DASH_DISTANCE:
        player.current_state = player.decelerating_state
