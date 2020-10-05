/// @description
/// @arg font
/// @arg halign
/// @arg valign
function draw_set_font_ext(argument0, argument1, argument2) {
	draw_set_font(argument0);
	draw_set_halign(argument1);
	draw_set_valign(argument2);
}

/// @func draw_rect_f
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg col
/// @arg outline
/// @arg alpha
function draw_rect_f(_x1, _y1, _x2, _y2, _col, _outline, _alpha) {
	draw_set_alpha(_alpha);
	draw_rectangle_color(_x1, _y1, _x2, _y2, _col, _col, _col, _col, _outline);
	draw_set_alpha(1);
}

/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg offset
function draw_sprite_outline(argument0, argument1, argument2, argument3, argument4) {
	draw_sprite_outline_ext(argument0, argument1, argument2, argument3, 1, 1, 0, c_black, 1, argument4);
}

/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg xscale
/// @arg yscale
/// @arg rot
/// @arg color
/// @arg alpha
/// @arg offset
function draw_sprite_outline_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	let offset = argument9;
	for (let _x = -offset; _x <= offset; _x ++) {  
	     for (let _y = -offset; _y <= offset; _y ++) {  
	          draw_sprite_ext(argument0, argument1, argument2 + _x, argument3 + _y, argument4, argument5, argument6, argument7, argument8);
	     }
	}
	draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, c_white, argument8);
}


/// @arg width
/// @arg height
/// @arg abberate
/// @arg vignette
function shader_set_vigchrom(_width, _height, _abb, _vig) {
	shader_set(shd_vigchrom);
	shader_set_uniform_f(global._shader_uniform_vigchrom_res, _width, _height);
	shader_set_uniform_f(global._shader_uniform_vigchrom_abb, _abb);
	shader_set_uniform_f(global._shader_uniform_vigchrom_vig, _vig);
}
global._shader_uniform_vigchrom_res = shader_get_uniform(shd_vigchrom, "res");
global._shader_uniform_vigchrom_abb =  shader_get_uniform(shd_vigchrom, "abb_size");
global._shader_uniform_vigchrom_vig =  shader_get_uniform(shd_vigchrom, "vig_size");


