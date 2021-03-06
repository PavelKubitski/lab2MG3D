#import "sandSkyModel.h"

const GLKVector4 Plane_None_ambient = {0.000000, 0.000000, 0.000000, 1.000000};
const GLKVector4 Plane_None_diffuse = {0.800000, 0.800000, 0.800000, 1.000000};
const GLKVector4 Plane_None_specular = {0.800000, 0.800000, 0.800000, 1.000000};
const float Plane_None_shininess = 0.000000;

const MyVertex Plane_None_Vertices[6] = {
    {{-0.000001, -17.811522, 11.180339}, {1, 1, 1, 1}, {0.002600, 0.011223}, {1.000000, -0.000000, 0.000000}},
    {{-0.000001, -17.811522, -11.180339}, {1, 1, 1, 1}, {1.002600, 0.011222}, {1.000000, -0.000000, 0.000000}},
    {{0.000001, 17.811522, -11.180339}, {1, 1, 1, 1}, {1.002600, 0.998250}, {1.000000, -0.000000, 0.000000}},
    {{0.000001, 17.811522, 11.180339}, {1, 1, 1, 1}, {0.002601, 0.998250}, {1.000000, -0.000000, 0.000000}},
    {{-0.000001, -17.811522, 11.180339}, {1, 1, 1, 1}, {0.002600, 0.011223}, {1.000000, -0.000000, 0.000000}},
    {{0.000001, 17.811522, -11.180339}, {1, 1, 1, 1}, {1.002600, 0.998250}, {1.000000, -0.000000, 0.000000}},
};

