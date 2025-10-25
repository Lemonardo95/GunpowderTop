class_name PushButton
extends Interactable

@export var door: Door

func interact(player: Player) -> bool:
    door.open()
    return false