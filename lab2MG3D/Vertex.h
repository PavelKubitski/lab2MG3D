typedef enum {
    VertexAttribPosition = 0,
    VertexAttribColor,
    VertexAttribTexCoord
} VertexAttributes;

typedef struct {
    float Position[3];
    float Color[4];
    float TexCoord[2];
} MyVertex;