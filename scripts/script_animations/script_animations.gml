/*enum AnimState {
	idle, walk, hit, die, custom, fall
}

/// @arg idle
/// @arg idlespd
/// @arg walk
/// @arg walkspd
/// @arg fall
/// @arg fallspd
/// @arg hit
/// @arg hitspd
/// @arg die
/// @arg diespd
function entity_sprites_init(_i, _is, _w, _ws, _f, _fs, _h, _hs, _d, _ds) {
	s_anim_idle = _i;
	s_anim_walk = _w;
	s_anim_hit = _h;
	s_anim_die = _d;
	s_anim_fall = _f;
	s_anim_idle_spd = _is;
	s_anim_walk_spd = _ws;
	s_anim_hit_spd = _hs;
	s_anim_die_spd = _ds;
	s_anim_fall_spd = _fs;
	anim_state = AnimState.idle;
	anim_image = s_anim_idle;
	anim_index = 0;
	anim_speed = s_anim_idle_spd;
}