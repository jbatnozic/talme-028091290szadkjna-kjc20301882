//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D baseSampler;

void main() {

  vec4 colour;
  vec4 base, gmbase;

  vec4 white, black;
  
  white.r = 1.0;
  white.g = 1.0;
  white.b = 1.0;
  white.a = 1.0;
  
  black.r = 0.0;
  black.g = 0.0;
  black.b = 0.0;
  black.a = 1.0;

  base = texture2D( baseSampler, v_vTexcoord );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord );
    gmbase.a = 1.0;
  
  colour = (base == gmbase) ? white : black;
  
  //colour = base;
  
  gl_FragColor = colour;
    
  }
  

