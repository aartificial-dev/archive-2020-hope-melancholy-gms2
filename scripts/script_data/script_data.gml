
#macro Layers global.__template_layers
#macro let var
#macro class function

gml_pragma("global", "game_init()");

function game_init() {
	// global code here
}

global.__template_layers = {
	b_back: "B_Back",
	
	o_back: "O_Back",
	
	t_black: "T_Black",
	t_back: "T_Back",
	t_walls: "T_Walls",
	t_decor: "T_Decoration",
	
	a_furniture: "A_Furniture",
	
	door: "L_Door",
	furniture: "L_Furniture",
	items: "L_Item",
	entity: "L_Entity",
	furniture_front: "L_Furniture_Front",
	
	s_effect: "S_Effect",
	
	effect: "L_Effect",
	light: "L_Light",
	
	t_front: "T_Front",
	
	gui: "L_Gui",
	collision: "L_Collision",
	system: "L_System"
}

#macro LOCALE_ENGLISH 0
#macro LOCALE_JAPANESE 1

global.locale = LOCALE_ENGLISH;


function seq_effect_begin() {
	gpu_set_blendmode(bm_add);
}

function seq_effect_end() {
	gpu_set_blendmode(bm_normal);
}

/// @arg str
function console_log(str) {
	show_debug_message("-----------------------------------------------");
	show_debug_message(str);
	show_debug_message("-----------------------------------------------");
}