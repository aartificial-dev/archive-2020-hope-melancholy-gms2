/// @description Animations & Variables
// You can write your code in this editor

event_inherited();

let _obj = collision_point_depth(mouse_x, mouse_y, par_interactive, 0, 0);
let _dist = (distance_to_object(_obj) < hand_length);
interact = _dist ? _obj : noone;

a_handler.step();

// can move if NOT a dialog or note or transition
can_move = !( instances_exists([obj_dialog, obj_note, obj_puzzle, obj_gui_keypad, obj_gui_note_pc, obj_horror], false) || global.r_trans_state > 0 || obj_cam.menu_opened);


let _item_held = weap_select ? inv_weap2 : inv_weap1;

if (!ds_list_empty(_item_held)) {
	let cell = ds_list_find_value(_item_held, 0);
	weap_current = cell.item.name;
} else {
	weap_current = "noone";
}
