/// @arg effect
/// @arg x
/// @arg y
function effect_play(_eff, _x, _y) {
	layer_sequence_create(Layers.s_effect, _x, _y, _eff);
}