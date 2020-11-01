//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float iTime;

void main() {
	vec2 uv = v_vTexcoord;
	vec4 color = texture2D( gm_BaseTexture, uv );
	vec4 newCol;
	
	float strength = 8.0;
  float x = (uv.x + 4.0 ) * (uv.y + 4.0 ) * (iTime * 10.0);
	vec4 grain = vec4(mod((mod(x, 13.0) + 1.0) * (mod(x, 123.0) + 1.0), 0.01)-0.005) * strength;
	
  grain = 1.0 - grain;
	newCol = color * grain;
	
  gl_FragColor = v_vColour * newCol;
}
