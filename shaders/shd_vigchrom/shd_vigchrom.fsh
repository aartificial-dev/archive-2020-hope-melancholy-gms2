//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 res;

uniform float vig_size;
uniform float abb_size;

void main(){
  vec2 cord = v_vTexcoord;
	
  /*vec4 col = texture2D( gm_BaseTexture, cord);
	//vec4 bloom = texture2D( gm_BaseTexture, cord);
  
	//bloom = max(vec4(bloom.rgb-0.4, 1), 0.);
  
	//abberaton
  col.r += texture2D( gm_BaseTexture, cord + clamp(vec2(1., 5.), cord, res) ).r/2.;
  col.b += texture2D( gm_BaseTexture, cord - clamp(vec2(1., 5.), cord, res) ).b/2.;
  */
  
  vec2 uv = cord;
  uv *= 1.0 - uv.xy;
  
  float vig = uv.x*uv.y * 7.0;
    
  vig = pow(abs(vig), 0.125 * vig_size);
  
  
  
  vec4 newCol = (v_vColour/**col*/);
  
  float dis = distance(v_vTexcoord , vec2(0.5)) * abb_size;
    
  newCol.r = texture2D(gm_BaseTexture,cord + (dis*0.005)).r;
  newCol.g = texture2D(gm_BaseTexture,cord).g;
  newCol.b = texture2D(gm_BaseTexture,cord - (dis*0.005)).b;
  
  gl_FragColor = (newCol/* + bloom*/) * vec4(vig, vig, vig, 1.0);
}