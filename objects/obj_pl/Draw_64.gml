/// @description Item hover && Inventory
// You can write your code in this editor


//if (!can_move) {exit;}

if (!can_move) {
	hud_offset = clamp(hud_offset + 3, 0, hud_offset_m);
} else {
	hud_offset = clamp(hud_offset - 3, 0, hud_offset_m);
}
if (can_move) {
	inv_step();
}

if (interact && can_move) {
	draw_set_font_ext(fnt_pixel, fa_left, fa_top);
	let _text = string(interact.name);
	let _dir = point_direction(interact.x, interact.y, x, y);
	let _dis = point_distance(interact.x, interact.y, x, y);
	_dis = clamp(_dis/10, 0, 20);
	let _x = interact.x - view_x + dcos(_dir) * _dis;
	let _y = interact.y - view_y - dsin(_dir) * _dis;
	let _w = string_width(_text) + 10;
	let _h = string_height(_text) / 2;
	_x = clamp(_x, 0, room_width - _w);
	_y = clamp(_y, 0, room_height - _h);
	
	let subimg = a_handler.get(interact.icon);
	
	draw_rect_f(_x, _y, _x + _w, _y + _h + 6, c_black, 0, 0.6);
	draw_sprite(interact.icon, subimg, _x + 1, _y + 2);
	draw_text(_x + 11, _y + 4 - _h + 2, _text);
	if (mouse_check_button_pressed(mb_right)) {
		with (interact) {
			event_user(obj_pl.inv_hand ? 1 : 0);
		}
		//event_perform_object(interact, ev_user0, 0);
	}
}

let _icon_x = gui_w - 2;
let _icon_y = gui_h - 5;
if (weap_current == "Firearm") {
	draw_sprite(spr_hud_weapon, 0, _icon_x, _icon_y + hud_offset);
	let _hbar = (gun_ammo / gun_ammo_max) * 100;
	draw_healthbar(gui_w - 18, gui_h - 4 + hud_offset, gui_w - 2, gui_h - 2 + hud_offset, _hbar, c_black, c_white, c_white, 0, 1, 1);
}
if (weap_current == "Tube") {
	draw_sprite(spr_hud_weapon, 1, _icon_x, _icon_y + hud_offset);
}

draw_sprite(spr_bars, 0, 0, gui_h - 18 + hud_offset );

draw_healthbar(18, gui_h - 16 + hud_offset, 61, gui_h - 12 + hud_offset, (hp / mhp) * 100, c_black, $a1a1ed, $a1a1ed, 0, 0, 0);
draw_healthbar(18, gui_h - 8 + hud_offset, 61, gui_h - 4 + hud_offset, (sanity / msanity) * 100, c_black, $ddb8d8, $ddb8d8, 0, 0, 0);

if (sanity >= 30) {
	draw_sprite(spr_face_calm, 0, 0, gui_h - 18 + hud_offset);
} else if (sanity >= 10 && sanity < 30) {
	draw_sprite(spr_face_nervous, image_face_index, 0, gui_h - 18 + hud_offset);
} else {
	draw_sprite(spr_face_insane, image_face_index, 0, gui_h - 18 + hud_offset);
}


inv_draw();

inv_draw_hand();

///draw_circle(gui_mouse_x, gui_mouse_y, 5, 1);