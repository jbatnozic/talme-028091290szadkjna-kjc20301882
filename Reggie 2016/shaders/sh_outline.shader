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

uniform float pixelW;
uniform float pixelH;

uniform vec4  newCol;

void main() {

  bool flag = false;
  
  vec2 xoff;
  xoff.x = pixelW / 2.0;
  xoff.y = 0.0;
  vec2 yoff;
  yoff.y = pixelH / 2.0;
  yoff.x = 0.0;
  
  flag = flag || (texture2D( gm_BaseTexture, v_vTexcoord + xoff.x ).a > 0.0);
  flag = flag || (texture2D( gm_BaseTexture, v_vTexcoord - xoff.x ).a > 0.0);
  flag = flag || (texture2D( gm_BaseTexture, v_vTexcoord + yoff.y ).a > 0.0);
  flag = flag || (texture2D( gm_BaseTexture, v_vTexcoord - yoff.y ).a > 0.0);

  flag = flag && (texture2D( gm_BaseTexture, v_vTexcoord ).a == 0.0);
  
  gl_FragColor = v_vColour * (flag ? newCol : texture2D( gm_BaseTexture, v_vTexcoord ));
  
  }

