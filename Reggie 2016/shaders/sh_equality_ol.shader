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

uniform float pixelW;
uniform float pixelH;

float sqr(float f) {

  return f*f;

  }

void main() {

  float delta_e, grad;
  vec4  base, gmbase;
  vec4  white, black, gray;
  bool  blacken;
  
  white = vec4(1.0);
  
  black = vec4(0.0);
  black.a = 1.0;

  grad = 1.0;
  
  // -------------------------------------------------
  
  vec2 offsetx;
  offsetx.x = pixelW;
  
  vec2 offsety;
  offsety.y = pixelH;
  
  // -------------------------------------------------
  
  /*base = texture2D( baseSampler, v_vTexcoord + offsetx.x );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord + offsetx.x );
    gmbase.a = 1.0;
  
  blacken = blacken || (base != gmbase);
  
  delta_e = sqrt(sqr(base.r - gmbase.r) + sqr(base.g - gmbase.g) + sqr(base.b - gmbase.b)) / sqrt(3.0);
  
  grad = max(grad, 1.0 - delta_e);
  
  // *
  
  base = texture2D( baseSampler, v_vTexcoord - offsetx.x );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord - offsetx.x );
    gmbase.a = 1.0;
  
  blacken = blacken || (base != gmbase);
  
  delta_e = sqrt(sqr(base.r - gmbase.r) + sqr(base.g - gmbase.g) + sqr(base.b - gmbase.b)) / sqrt(3.0);
  
  grad = max(grad, 1.0 - delta_e);
  
  // *
  
  base = texture2D( baseSampler, v_vTexcoord + offsety.y );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord + offsety.y );
    gmbase.a = 1.0;
  
  blacken = blacken || (base != gmbase);
  
  delta_e = sqrt(sqr(base.r - gmbase.r) + sqr(base.g - gmbase.g) + sqr(base.b - gmbase.b)) / sqrt(3.0);
  
  grad = max(grad, 1.0 - delta_e);
  
  // *
  
  base = texture2D( baseSampler, v_vTexcoord - offsety.y );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord - offsety.y );
    gmbase.a = 1.0;
  
  blacken = blacken || (base != gmbase);
  
  delta_e = sqrt(sqr(base.r - gmbase.r) + sqr(base.g - gmbase.g) + sqr(base.b - gmbase.b)) / sqrt(3.0);
  
  grad = max(grad, 1.0 - delta_e);*/
  
  // *
  
  base = texture2D( baseSampler, v_vTexcoord );
    base.a = 1.0;
  
  gmbase = texture2D( gm_BaseTexture, v_vTexcoord );
    gmbase.a = 1.0;
  
  blacken = (base != gmbase);
  
  grad = (base != gmbase) ? 0.0 : grad;
  
  //delta_e = sqrt(sqr(base.r - gmbase.r) + sqr(base.g - gmbase.g) + sqr(base.b - gmbase.b)) / sqrt(3.0);
  
  //grad = max(grad, 1.0 - delta_e);
  
  // -------------------------------------------------
  
  gray   = vec4(grad);
  gray.a = 1.0;
    
  gl_FragColor   = blacken ? black : white;
  
  //gl_FragColor.a = alpha;
    
  }
  

