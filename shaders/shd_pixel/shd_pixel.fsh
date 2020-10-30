//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 resolution;

void main() {
  float dx = resolution.z / 2.0 * (1.0 / resolution.x);
  float dy = resolution.z / 2.0 * (1.0 / resolution.y);
  vec2 Coord = vec2(dx * floor(v_vTexcoord.x / dx),
                    dy * floor(v_vTexcoord.y / dy));
   gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord );
}
