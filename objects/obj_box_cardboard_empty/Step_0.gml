/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (!instance_place(x, y + 0.5, par_collision) && !instance_place(x, y + 0.5, par_furniture)) {
	y += 0.5;	
}