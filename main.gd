extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# $Sprite2Dは現在のノードから子ノードの情報を得るためのコード
	position = Vector2(500,500) 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# 二次元ベクトルを利用することで,一気に左上移動が可能になってくる.
	
	# ==================条件変数===================== #
	var player_hp = 100
	var speed = 200
	var direction = Vector2(0,0)
	
	
	# ============方向キーが押されたかどうか============ #
	var is_right= Input.is_action_pressed("ui_right")
	var is_left	= Input.is_action_pressed("ui_left")
	var is_up	= Input.is_action_pressed("ui_up")
	var is_down	= Input.is_action_pressed("ui_down")
	
	# =================ダッシュ条件================== #
	var is_dash = Input.is_action_pressed("dash")
	
	# ============================================= 
	
	velocity.y += 980 * delta
	
	if is_dash:
		speed = speed * 5
	
	if is_right:
		direction.x += 1.0 
		
	if is_left:
		direction.x += -1.0 
	
	velocity.x = speed * direction.x	
		
	# 重力
	if not is_on_floor():
		velocity.y += 980.0 * delta

	# ジャンプ
	if is_up and is_on_floor():
		velocity.y = -1000.0
				
					
	move_and_slide()
	
	
		
	position.x = clamp(position.x,0,800)
	
	
