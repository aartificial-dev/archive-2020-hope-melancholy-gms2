//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
  //gl_FragColor = v_vColour + texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 tCol = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 vCol = v_vColour;
	//tCol.r = clamp(tCol.r + (vCol.r / vCol.a), 0.0, 1.0);
	//tCol.g = clamp(tCol.g + (vCol.g / vCol.a), 0.0, 1.0);
	//tCol.b = clamp(tCol.b + (vCol.b / vCol.a), 0.0, 1.0);
	//tCol.a = clamp(tCol.a + vCol.a, 0.0, 1.0);
	//tCol.a = mix(tCol.a, vCol.a, 0.5); 
	//tCol.r = clamp(mix(tCol.r, vCol.r, tCol.a), 0.0, 1.0);
	//tCol.g = clamp(mix(tCol.g, vCol.g, tCol.a), 0.0, 1.0);
	//tCol.b = clamp(mix(tCol.b, vCol.b, tCol.a), 0.0, 1.0);
	//tCol.rgb = mix(vCol.rgb, tCol.rgb, step(3.0, dot(vCol.rgb, vCol.rgb)));
	//tCol.r = mix(vCol.r, tCol.r, step(3.0, dot(vCol.rgb, vCol.rgb)));
	//tCol.g = mix(vCol.g, tCol.g, step(3.0, dot(vCol.rgb, vCol.rgb)));
	//tCol.b = mix(vCol.b, tCol.b, step(3.0, dot(vCol.rgb, vCol.rgb)));
	vec2 uv = v_vTexcoord;
	float textureResolution = 64.0;
	uv = uv*textureResolution + 0.5;
	vec2 iuv = floor( uv );
	vec2 fuv = fract( uv );
	uv = iuv + fuv*fuv*(3.0-2.0*fuv); // fuv*fuv*fuv*(fuv*(fuv*6.0-15.0)+10.0);;
	uv = (uv - 0.5)/textureResolution;
	vec3 colA = v_vColour.rgb;
	vec3 colB = texture2D( gm_BaseTexture, uv ).rgb;
	vec3 col = mix( colA, colB, 1.0 );
	gl_FragColor = vec4(col, 1.0);
}
