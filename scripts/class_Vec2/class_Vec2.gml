/// @func vec2
/// @arg x
/// @arg y
class Vec2(_x, _y) constructor {
	x = _x;
	y = _y;
	static add = function( _vec2 ) {
		x += _vec2.x;
		y += _vec2.y;
	}
	static subt = function( _vec2 ) {
		x -= _vec2.x;
		y -= _vec2.y;
	}
	static divide = function( _vec2 ) {
		x /= _vec2.x;
		y /= _vec2.y;
	}
	static mult = function( _vec2 ) {
		x *= _vec2.x;
		y *= _vec2.y;
	}
}
