class_name Interactable
extends StaticBody3D

# Return true if it should be removed from collider list
func interact(player: Player) -> bool:
    return false