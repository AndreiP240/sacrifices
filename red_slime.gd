extends Sprite2D
@export var leader_path: NodePath
@export var delay_frames := 30

var leader: Node = null

func _ready():
	leader = get_node(leader_path)

func _physics_process(delta):
	if leader == null:
		return

	var history = leader.position_history
	if history.size() > delay_frames:
		global_position = history[history.size() - delay_frames]
