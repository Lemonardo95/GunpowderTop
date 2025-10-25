class_name Interactable
extends StaticBody3D

# Return true if it override bounce physics
func interact(_player: Player) -> bool:
    return false