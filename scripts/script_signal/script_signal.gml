function signals_handler() {
	global.signals = ds_list_create();
}

function signals_clear() {
	ds_list_clear(global.signals);
}

/// @arg signal
function signal_get(_s) {
	if ( ds_list_find_index(global.signals, _s) != -1 ) {
		return true;
	}
	return false;
}

/// @arg signal
function signal_send(_s) {
	ds_list_add(global.signals, _s);
}