/// @func ICell
/// @arg x
/// @arg y
/// @arg item
class ICell(_x, _y, _item) constructor {
	x = _x;
	y = _y;
	w = _item.w;
	h = _item.h;
	item = _item;
	sprite = _item.sprite;
}