class_name FlyingState
extends State


const FLYING_DURATION = 1.0 # seconds
var flying_time := 0.0

func should_colide() -> bool:
    return true

func enter(_player):
    flying_time = FLYING_DURATION

func process(player, delta):
    print(flying_time)
    flying_time -= delta
    if flying_time <= 0.0:
        player.current_state = player.decelerating_state
