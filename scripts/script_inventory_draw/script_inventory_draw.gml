
/// @func inv_draw
function inv_draw() {
	if (inv_height == 0) exit;
	let _my = inv_height - inv_mheight - hud_offset;
	draw_sprite(spr_inventory, 0, 0, _my);
	let _x = weap_select ? 59 : 2;
	let _y = 12;
	draw_sprite(spr_inventory, 1, _x, _y + _my);
	
	__inv_chip_draw();
	
	__inv_act_draw(inv_items, 117, 2);
	__inv_act_draw(inv_weap1, 3, 13);
	__inv_act_draw(inv_weap2, 60, 13);
	
	__inv_draw_text(inv_items, 117, 2);
	__inv_draw_text(inv_weap1, 3, 13);
	__inv_draw_text(inv_weap2, 60, 13);
	__inv_chip_text();
	
	
}

/// @func __inv_act_draw
function __inv_act_draw(inv, _x, _y) {
	let _my = inv_height - inv_mheight - hud_offset;
	let scell = 11; // size of one cell w & h
	let l = ds_list_size(inv);
	for (let i = 0; i < l; i ++) {
		let cell = inv[| i];
		let x_off = sprite_get_xoffset(cell.sprite);
		let y_off = sprite_get_yoffset(cell.sprite);
		draw_sprite(cell.sprite, 0, _x + cell.x * scell + x_off, _y + cell.y * scell + y_off + _my);
		draw_sprite_ext(cell.sprite, 0, _x + cell.x * scell + x_off + 1, _y + cell.y * scell + y_off + 1 + _my, 1.1, 1.1, 0, c_black, 0.3);
	}
}

function __inv_draw_text(inv, inv_x, inv_y) {
	if (inv_hand) return;
	let scell = 11; // size of one cell w & h
	let mousex = floor( (gui_mouse_x - inv_x) / scell + 0.0);
	let mousey = floor( (gui_mouse_y - inv_y) / scell + 0.0);
	let coll = __inv_coll(inv, mousex, mousey, 1000, 1000);
	if (coll >= 0) {
		let cell = inv[| coll];
		let item = cell.item;
		draw_set_font_ext(fnt_pixel, fa_left, fa_top);
		let _w = string_width(item.name) + 10;
		let _h = string_height(item.name);
		let _x = inv_x + (cell.x * scell) + (cell.w * 0.75 * scell);
		let _y = inv_y + (cell.y * scell) + (cell.h * 0.5 * scell);
		_x = clamp(_x, 0, view_w - _w);
		_y = clamp(_y, 0, view_h - _h);
		let subimg = a_handler.get(spr_hud_hand);
		draw_rect_f(_x, _y, _x + _w, _y + _h, c_black, 0, 0.6);
		draw_sprite(spr_hud_hand, subimg, _x + 1, _y + 2);
		draw_text(_x + 11, _y + 4, item.name);
	}
}

function __inv_chip_draw() {
	// inv_chips
	let _my = inv_height - inv_mheight - hud_offset;
	let coords = [251, 2, 285, 2, 251, 19, 285, 19];
	for (let i = 0; i < 8; i += 2) {
		if (inv_chips[i / 2] == noone) continue;
		let chip = inv_chips[i / 2];
		draw_sprite(spr_slot_chip, 0, coords[i], coords[i + 1] + _my);
		draw_sprite_ext(spr_slot_chip, 1, coords[i], coords[i + 1] + _my, 1, 1, 0, chip.modif, 1);
	}
	// blue - $FFE8CC
	// red - $A4A4CD
	// green - $A7D1B2
}

function __inv_chip_text() {
	if (inv_hand) return;
	let pass = [];
	pass[0] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 251, 2, 251 + 32, 2 + 16);		/// 251 2
	pass[1] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 285, 2, 285 + 32, 2 + 16);		/// 285 2
	pass[2] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 251, 19, 251 + 32, 19 + 16);		/// 251 19
	pass[3] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 285, 19, 285 + 32, 19 + 16);		/// 285 
	let coords = [251, 2, 285, 2, 251, 19, 285, 19];
	for (let i = 0; i < 4; i ++) {
		if (pass[i]) {
			let item = inv_chips[i];
			if (item == noone) break;
			draw_set_font_ext(fnt_pixel, fa_left, fa_top);
			let _w = string_width(item.name) + 10;
			let _h = string_height(item.name);
			let _x = coords[i * 2] + 24;
			let _y = coords[i * 2 + 1] + 8;
			_x = clamp(_x, 0, view_w - _w);
			_y = clamp(_y, 0, view_h - _h);
			let subimg = a_handler.get(spr_hud_hand);
			draw_rect_f(_x, _y, _x + _w, _y + _h, c_black, 0, 0.6);
			draw_sprite(spr_hud_hand, subimg, _x + 1, _y + 2);
			draw_text(_x + 11, _y + 4, item.name);
			break;
		}
	}
}

/// @func inv_draw_hand
function inv_draw_hand() {
	if (inv_hand) {
		draw_sprite_ext(inv_hand.sprite, 0, gui_mouse_x, gui_mouse_y, 1.1, 1.1, 0, c_white, 1);
		draw_sprite_ext(inv_hand.sprite, 0, gui_mouse_x + 1, gui_mouse_y + 1, 1.1, 1.1, 0, c_black, 0.3);
	}
}