/// @description Insert description here
// You can write your code in this editor


let cent_x = gui_w / 2;
let cent_y = gui_h / 2;

let st_x = cent_x - sprite_get_xoffset(spr_gui_keypad);
let st_y = cent_y - sprite_get_yoffset(spr_gui_keypad) + 6;

draw_sprite(spr_gui_keypad, 0, cent_x, cent_y);
if (active) {
	draw_sprite(spr_gui_keypad, 1, cent_x, cent_y);
}
draw_set_font_ext(fnt_pixel, fa_left, fa_middle);
let _col = $726E72;
draw_text_color(st_x + 10, st_y + 43, current_code, _col, _col, _col, _col, 1);

let _mb = mouse_check_button_pressed(mb_left);
if (point_in_rectangle(gui_mouse_x, gui_mouse_y, st_x + 85, st_y - 6, st_x + 85 + 6, st_y)) {
	draw_sprite(spr_gui_keypad, 3, cent_x, cent_y);
	if (_mb) {
		instance_destroy();
	}
}

///             0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  *,  #
let digits_x = [56, 42, 56, 70, 42, 56, 70, 42, 56, 70, 42, 70];
let digits_y = [49, 4,  4,  4,  19, 19, 19, 34, 34, 34, 49, 49];

for (let i = 0; i < 12; i ++) {
	let _x = st_x + digits_x[i];
	let _y = st_y + digits_y[i];
	let hit = 0;
	if (keyboard_lastkey != -1) {
   hit = (string(keyboard_lastchar) == string(i));
  }
	if ((point_in_rectangle(gui_mouse_x, gui_mouse_y, _x, _y, _x + 11, _y + 11) && _mb) || hit) {
		lastdigit = i;
		alarm[0] = 5;
		audio_play_sound(snd_keypad_click, 0, 0);
		/// add key
		if (!active) {
			let _ckey = i;
			if (i == 10) {_ckey = "*";}
			if (i == 11) {_ckey = "#";}
			current_code += string(_ckey);
			if (string_length(current_code) > 4) {
				current_code = "";
				audio_play_sound(snd_keypad_wrong, 0, 0);
			}
		}
	}
	if (lastdigit == i && alarm[0] != -1) {
		draw_sprite(spr_gui_keypad_keys, 0, _x, _y);
	} 
}
if (keyboard_lastkey != -1) {
  keyboard_lastkey = -1;
}

///           v,  x,  $
let keys_x = [4,  16, 28];
let keys_y = [49, 49, 49];

for (let i = 0; i < 3; i ++) {
	let _x = st_x + keys_x[i];
	let _y = st_y + keys_y[i];
	//lastkey = noone;
	let hit = 0;
	if (i == 0 && keyboard_check_pressed(vk_enter)) {hit = 1;}
	if (i == 1 && keyboard_check_pressed(vk_backspace)) {hit = 1;}
	if ((point_in_rectangle(gui_mouse_x, gui_mouse_y, _x, _y, _x + 11, _y + 11) && _mb) || hit) {
		lastkey = i;
		alarm[0] = 5;
		audio_play_sound(snd_keypad_click, 0, 0);
		/// add key
		if (i == 0) {
			if (current_code == keypad_key) {
				active = 1;
				keypad.active = 1;
				audio_play_sound(snd_keypad_unlock, 0, 0);
				current_code = "";
			} else if (!audio_is_playing(snd_keypad_wrong)){
				current_code = "";
				audio_play_sound(snd_keypad_wrong, 0, 0);
			}
		}
		if (i == 1) {
				current_code = "";
		}
		if (i == 2) {
			active = 0;
			keypad.active = 0;
		}
	}
	if (lastkey == i && alarm[0] != -1) {
		draw_sprite(spr_gui_keypad_keys, 0, _x, _y);
	} 
}


draw_sprite(spr_gui_keypad, 2, cent_x, cent_y);
//keypad_key
//keypad
//active