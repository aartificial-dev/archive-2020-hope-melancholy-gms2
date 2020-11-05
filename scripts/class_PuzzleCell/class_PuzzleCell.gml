/// @arg type
/// @arg out_power
/// @arg max_power
/// @arg signal
/// @arg signal_over
class PuzzleCell(_type, _pow_out, _pow_max, _signal, _signal_ov) constructor {
	type = _type;
	out_power = _pow_out;
	max_power = _pow_max;
	signal = _signal;
	signal_overload = _signal_ov;
	connect = noone;
	connect_def = noone;
	cur_power = 0;
	active = 1;
}