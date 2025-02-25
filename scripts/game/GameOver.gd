extends Node

enum DeathState {START, LOOP, END, QUIT}

@export var hud_path: NodePath
@export var camera_path: NodePath
@export var player_character_path: NodePath
@export var fade_screen_path: NodePath
@export var loss_sfx_path: NodePath
@export var end_sfx_path: NodePath
@export var cancel_sfx_path: NodePath

@export var death_music: AudioStream = preload("res://assets/music/gameOver.ogg")
@export var death_music_bpm: float = 100

@onready var hud = get_node(hud_path)
@onready var camera = get_node(camera_path)
@onready var player_character = get_node(player_character_path)
@onready var fade_screen = get_node(fade_screen_path)
@onready var loss_sfx = get_node(loss_sfx_path)
@onready var end_sfx = get_node(end_sfx_path)
@onready var cancel_sfx = get_node(cancel_sfx_path)

var cam_pos_from_level = Vector2(770, 450)
var zoom_from_level = Vector2(1 / 0.7, 1 / 0.7)
var player_pos_from_level = Vector2(770, 450)
var player_scale_from_level = Vector2.ONE

var returning_to_level = false

func _ready():
	call_deferred("advance_death_state", DeathState.START)

func advance_death_state(state):
	match state:
		DeathState.START:
			player_character.position = player_pos_from_level
			player_character.scale = player_scale_from_level
			
			camera.follow_point = player_character.camera_follow_point
			camera.reset_position(cam_pos_from_level)
			hud.follow_viewport_scale = zoom_from_level.x
			camera.zoom = zoom_from_level
			
			player_character.play_anim("Death_Start")
			player_character.anim_player.connect("animation_finished", Callable(self, "_advance_after_start").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
			
			loss_sfx.play()
			
		DeathState.LOOP:
			Conductor.play_music(death_music, death_music_bpm)
		
		DeathState.END:
			loss_sfx.stop()
			end_sfx.play()
			
			if player_character.anim_player.is_connected("animation_finished", Callable(self, "_advance_after_start")):
				player_character.anim_player.disconnect("animation_finished", Callable(self, "_advance_after_start"))
			
			player_character.play_anim("Death_Confirm")
			Conductor.stop_song()
			
			get_tree().create_timer(0.7).connect("timeout", Callable(fade_screen.get_node("AnimationPlayer"), "play").bind("Fade"), CONNECT_ONE_SHOT)
			get_tree().create_timer(2.7).connect("timeout", Callable(TransitionSystem, "start_transition").bind("Instant_Fade_Out"), CONNECT_ONE_SHOT)
			get_tree().create_timer(2.7).connect("timeout", Callable(get_parent(), "restart").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
		
		DeathState.QUIT:
			loss_sfx.stop()
			cancel_sfx.play()
			
			if player_character.anim_player.is_connected("animation_finished", Callable(self, "_advance_after_start")):
				player_character.anim_player.disconnect("animation_finished", Callable(self, "_advance_after_start"))
			
			Conductor.stop_song()
			
			TransitionSystem.connect("transition_finished", Callable(self, "_quit").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
			TransitionSystem.play_transition(TransitionSystem.Transitions.BASIC_FADE_OUT)

func _advance_after_start(_anim_name):
	advance_death_state(DeathState.LOOP)

func _process(_delta):
	on_update()

func on_update():
	var action_pressed = GodotX.xor(Input.is_action_just_pressed("ui_accept"), Input.is_action_just_pressed("ui_cancel"))
	
	if action_pressed:
		if player_character.anim_player.is_connected("animation_finished", Callable(self, "_advance_after_start")):
			player_character.anim_player.disconnect("animation_finished", Callable(self, "_advance_after_start"))
		
		camera.reset_position()
		
		if Input.is_action_just_pressed("ui_accept"):
			advance_death_state(DeathState.END)
		else:
			advance_death_state(DeathState.QUIT)
		
		set_process(false)
		return
	
	camera.on_update()

func _quit(_trans_name):
	get_parent().quit_to_menu()
