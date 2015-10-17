varying lowp vec4 frag_Color;
varying lowp vec2 frag_TexCoord;
varying lowp vec3 frag_Normal;
varying lowp vec3 frag_Position;

uniform sampler2D u_Texture;
uniform highp float u_MatSpecularIntensity;
uniform highp float u_Shininess;

void main(void) {
    gl_FragColor = frag_Color * texture2D(u_Texture, frag_TexCoord);
//    * texture2D(u_Texture, frag_TexCoord);
    
}