#import "cube.h"

const GLKVector4 Cube_Material_ambient = {1.000000, 1.000000, 1.000000, 1.000000};
const GLKVector4 Cube_Material_diffuse = {0.640000, 0.640000, 0.640000, 1.000000};
const GLKVector4 Cube_Material_specular = {0.500000, 0.500000, 0.500000, 1.000000};
const float Cube_Material_shininess = 96.078430;

const MyVertex Cube_Material_Vertices[36] = {
    {{1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.255400, 0.765954}, {0.000000, -1.000000, 0.000000}},
    {{-1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.255400, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{-1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.000000, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {1.000000, 0.661511}, {0.000000, 1.000000, 0.000000}},
    {{-1.000000, 1.000000, 1.000000}, {1, 1, 1, 1}, {0.764377, 0.726059}, {0.000000, 1.000000, 0.000000}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.675653, 0.515872}, {0.000000, 1.000000, 0.000000}},
    {{1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.675653, 0.069911}, {0.815900, -0.408800, 0.408800}},
    {{3.930940, 3.435953, -2.413386}, {1, 1, 1, 1}, {0.675653, 0.709051}, {0.815900, -0.408800, 0.408800}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.343267, 0.199436}, {0.815900, -0.408800, 0.408800}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.343267, 0.709051}, {-0.000000, 0.000000, 1.000000}},
    {{-1.000000, 1.000000, 1.000000}, {1, 1, 1, 1}, {0.598667, 0.709051}, {-0.000000, 0.000000, 1.000000}},
    {{-1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.598667, 0.943097}, {-0.000000, 0.000000, 1.000000}},
    {{-1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.931053, 0.960105}, {-1.000000, -0.000000, -0.000000}},
    {{-1.000000, 1.000000, 1.000000}, {1, 1, 1, 1}, {0.675653, 0.960105}, {-1.000000, -0.000000, -0.000000}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {0.675653, 0.726059}, {-1.000000, -0.000000, -0.000000}},
    {{1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.000000, 0.205306}, {0.000000, 0.000000, -1.000000}},
    {{-1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.116687, 0.000000}, {0.000000, 0.000000, -1.000000}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {0.343267, 0.102333}, {0.000000, 0.000000, -1.000000}},
    {{1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.000000, 0.765954}, {0.000000, -1.000000, 0.000000}},
    {{1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.255400, 0.765954}, {0.000000, -1.000000, 0.000000}},
    {{-1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.000000, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{3.930940, 3.435953, -2.413386}, {1, 1, 1, 1}, {1.000000, 0.000000}, {-0.337400, 0.878800, 0.337400}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {1.000000, 0.661511}, {-0.337400, 0.878800, 0.337400}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.675653, 0.515872}, {-0.337400, 0.878800, 0.337400}},
    {{1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.446967, 0.000000}, {1.000000, 0.000000, 0.000000}},
    {{1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.675653, 0.069911}, {1.000000, 0.000000, 0.000000}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.343267, 0.199436}, {1.000000, 0.000000, 0.000000}},
    {{1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.343267, 0.943097}, {-0.000000, 0.000000, 1.000000}},
    {{0.999999, 1.000000, 1.000001}, {1, 1, 1, 1}, {0.343267, 0.709051}, {-0.000000, 0.000000, 1.000000}},
    {{-1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.598667, 0.943097}, {-0.000000, 0.000000, 1.000000}},
    {{-1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.931053, 0.726059}, {-1.000000, -0.000000, -0.000000}},
    {{-1.000000, -1.000000, 1.000000}, {1, 1, 1, 1}, {0.931053, 0.960105}, {-1.000000, -0.000000, -0.000000}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {0.675653, 0.726059}, {-1.000000, -0.000000, -0.000000}},
    {{3.930940, 3.435953, -2.413386}, {1, 1, 1, 1}, {0.343267, 0.765954}, {-0.185200, -0.185200, -0.965100}},
    {{1.000000, -1.000000, -1.000000}, {1, 1, 1, 1}, {0.000000, 0.205306}, {-0.185200, -0.185200, -0.965100}},
    {{-1.000000, 1.000000, -1.000000}, {1, 1, 1, 1}, {0.343267, 0.102333}, {-0.185200, -0.185200, -0.965100}},
};

