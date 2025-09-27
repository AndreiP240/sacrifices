extends Area2D
var PlatformScene = preload("res://red_platform.tscn")
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
func _on_body_entered(body):
	if body.is_in_group("player"):
		var location = body.position
		body.velocity = Vector2.ZERO
		body.global_position = Vector2(0,0)
		var platform = PlatformScene.instantiate()
		var offset = Vector2(0, 32)
		platform.position = location + offset
		get_tree().current_scene.add_child(platform)
