/// @description Insert description here
// You can write your code in this editor

if (signal_get(signal)) { 
	opened = 1;
} else {
	opened = 0;
}

if (image_index != 2) {
	image_index = !opened;
}