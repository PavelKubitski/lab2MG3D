#import "enemy1.h"

const GLKVector4 Cube_005_Cube_010_None_ambient = {0.000000, 0.000000, 0.000000, 1.000000};
const GLKVector4 Cube_005_Cube_010_None_diffuse = {0.800000, 0.800000, 0.800000, 1.000000};
const GLKVector4 Cube_005_Cube_010_None_specular = {0.800000, 0.800000, 0.800000, 1.000000};
const float Cube_005_Cube_010_None_shininess = 0.000000;

const MyVertex Cube_005_Cube_010_None_Vertices[216] = {
    {{-0.749017, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.209317}, {-1.000000, 0.000000, 0.000000}},
    {{-0.749017, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.209317}, {-1.000000, 0.000000, 0.000000}},
    {{-0.749017, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.313976}, {-1.000000, 0.000000, 0.000000}},
    {{-0.121828, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.494216, 0.862933}, {0.000000, 0.000000, -1.000000}},
    {{-0.121828, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.601262, 0.862933}, {0.000000, 0.000000, -1.000000}},
    {{-0.749017, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.601262, 0.967592}, {0.000000, 0.000000, -1.000000}},
    {{-0.121828, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.313976}, {1.000000, 0.000000, 0.000000}},
    {{-0.121828, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.313976}, {1.000000, 0.000000, 0.000000}},
    {{-0.121828, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.418634}, {1.000000, 0.000000, 0.000000}},
    {{-0.749017, 3.431409, 0.284405}, {1, 1, 1, 1}, {1.000000, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.749017, 2.804220, 0.284405}, {1, 1, 1, 1}, {1.000000, 0.104659}, {0.000000, 0.000000, 1.000000}},
    {{-0.121828, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.104659}, {0.000000, 0.000000, 1.000000}},
    {{-0.749017, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.209317}, {0.000000, -1.000000, 0.000000}},
    {{-0.121828, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.209317}, {0.000000, -1.000000, 0.000000}},
    {{-0.121828, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.104659}, {0.000000, -1.000000, 0.000000}},
    {{-0.121828, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.418634}, {0.000000, 1.000000, 0.000000}},
    {{-0.749017, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.418634}, {0.000000, 1.000000, 0.000000}},
    {{-0.749017, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.523293}, {0.000000, 1.000000, 0.000000}},
    {{-0.336413, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{-0.336413, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.931165}, {-1.000000, 0.000000, 0.000000}},
    {{-0.336413, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.931165}, {-1.000000, 0.000000, 0.000000}},
    {{0.250725, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{0.250725, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-0.336413, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.592323, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{0.250725, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.000000, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{0.250725, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.000000, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{0.250725, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{-0.336413, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.336413, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{0.250725, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-0.336413, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.902025}, {0.000000, -1.000000, 0.000000}},
    {{0.250725, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.300215, 0.902025}, {0.000000, -1.000000, 0.000000}},
    {{0.250725, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.300215, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{0.250725, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.992748, 0.817219}, {0.000000, 1.000000, 0.000000}},
    {{-0.336413, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.817219}, {0.000000, 1.000000, 0.000000}},
    {{-0.336413, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.719244}, {0.000000, 1.000000, 0.000000}},
    {{-1.179672, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.000000}, {-1.000000, 0.000000, 0.000000}},
    {{-1.179672, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-1.179672, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-0.592534, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-0.592534, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-1.179672, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.300631, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-0.592534, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.100210, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{-0.592534, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.100210, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{-0.592534, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{-1.179672, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-1.179672, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-0.592534, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.200421, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-1.179672, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.992748, 0.915194}, {0.000000, -1.000000, 0.000000}},
    {{-0.592534, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.915194}, {0.000000, -1.000000, 0.000000}},
    {{-0.592534, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.817219}, {0.000000, -1.000000, 0.000000}},
    {{-0.592534, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.400010, 1.000000}, {0.000000, 1.000000, 0.000000}},
    {{-1.179672, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.300215, 1.000000}, {0.000000, 1.000000, 0.000000}},
    {{-1.179672, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.300215, 0.902025}, {0.000000, 1.000000, 0.000000}},
    {{-1.188122, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-1.188122, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{-1.188122, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{0.253535, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.246056, 0.000000}, {0.000000, 0.000000, -1.000000}},
    {{0.253535, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.246056, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-1.188122, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.311681}, {0.000000, 0.000000, -1.000000}},
    {{0.253535, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.932652}, {1.000000, 0.000000, 0.000000}},
    {{0.253535, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.622263}, {1.000000, 0.000000, 0.000000}},
    {{0.253535, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.792744, 0.622263}, {1.000000, 0.000000, 0.000000}},
    {{-1.188122, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-1.188122, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{0.253535, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.246056, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-1.188122, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.601262, 0.623363}, {0.000000, -1.000000, 0.000000}},
    {{0.253535, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.601262, 0.862933}, {0.000000, -1.000000, 0.000000}},
    {{0.253535, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.501052, 0.862933}, {0.000000, -1.000000, 0.000000}},
    {{0.253535, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.501052, 0.623363}, {0.000000, 1.000000, 0.000000}},
    {{-1.188122, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.501052, 0.862933}, {0.000000, 1.000000, 0.000000}},
    {{-1.188122, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.862933}, {0.000000, 1.000000, 0.000000}},
    {{-0.058043, 2.542679, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.902025}, {-0.849600, -0.527500, 0.000000}},
    {{0.927149, 0.955815, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.623363}, {-0.849600, -0.527500, 0.000000}},
    {{0.927149, 0.955815, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.623363}, {-0.849600, -0.527500, 0.000000}},
    {{0.440779, 2.852369, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{1.425971, 1.265504, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{0.927149, 0.955815, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{0.440779, 2.852369, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.902025}, {0.849600, 0.527500, 0.000000}},
    {{1.425971, 1.265504, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.623363}, {0.849600, 0.527500, 0.000000}},
    {{1.425971, 1.265504, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.623363}, {0.849600, 0.527500, 0.000000}},
    {{-0.058043, 2.542679, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{0.927149, 0.955815, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{1.425971, 1.265504, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{0.927149, 0.955815, -0.309868}, {1, 1, 1, 1}, {0.490435, 0.409657}, {0.527500, -0.849600, 0.000000}},
    {{1.425971, 1.265504, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.409657}, {0.527500, -0.849600, 0.000000}},
    {{1.425971, 1.265504, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.311682}, {0.527500, -0.849600, 0.000000}},
    {{0.440779, 2.852369, -0.309868}, {1, 1, 1, 1}, {0.490435, 0.507632}, {-0.527500, 0.849600, 0.000000}},
    {{-0.058043, 2.542679, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.507632}, {-0.527500, 0.849600, 0.000000}},
    {{-0.058043, 2.542679, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.409657}, {-0.527500, 0.849600, 0.000000}},
    {{-1.135882, 2.822975, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.622263}, {-0.007100, 1.000000, 0.000000}},
    {{-3.003652, 2.809699, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.311682}, {-0.007100, 1.000000, 0.000000}},
    {{-3.003652, 2.809699, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.311682}, {-0.007100, 1.000000, 0.000000}},
    {{-1.131708, 2.235852, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-2.999479, 2.222576, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-3.003652, 2.809699, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-1.131708, 2.235852, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.000000}, {0.007100, -1.000000, 0.000000}},
    {{-2.999479, 2.222576, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.310582}, {0.007100, -1.000000, 0.000000}},
    {{-2.999479, 2.222576, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.310582}, {0.007100, -1.000000, 0.000000}},
    {{-1.131708, 2.235852, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-1.135882, 2.822975, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-3.003652, 2.809699, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-3.003652, 2.809699, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.523293}, {-1.000000, -0.007100, 0.000000}},
    {{-2.999479, 2.222576, -0.309868}, {1, 1, 1, 1}, {0.992811, 0.523293}, {-1.000000, -0.007100, 0.000000}},
    {{-2.999479, 2.222576, 0.277270}, {1, 1, 1, 1}, {0.992811, 0.621268}, {-1.000000, -0.007100, 0.000000}},
    {{-1.131708, 2.235852, -0.309868}, {1, 1, 1, 1}, {0.992811, 0.719244}, {1.000000, 0.007100, 0.000000}},
    {{-1.135882, 2.822975, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.719244}, {1.000000, 0.007100, 0.000000}},
    {{-1.135882, 2.822975, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.621268}, {1.000000, 0.007100, 0.000000}},
    {{-0.749017, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.313976}, {-1.000000, 0.000000, 0.000000}},
    {{-0.749017, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.209317}, {-1.000000, 0.000000, 0.000000}},
    {{-0.749017, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.313976}, {-1.000000, 0.000000, 0.000000}},
    {{-0.749017, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.494216, 0.967592}, {0.000000, 0.000000, -1.000000}},
    {{-0.121828, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.494216, 0.862933}, {0.000000, 0.000000, -1.000000}},
    {{-0.749017, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.601262, 0.967592}, {0.000000, 0.000000, -1.000000}},
    {{-0.121828, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.418634}, {1.000000, 0.000000, 0.000000}},
    {{-0.121828, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.313976}, {1.000000, 0.000000, 0.000000}},
    {{-0.121828, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.418634}, {1.000000, 0.000000, 0.000000}},
    {{-0.121828, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.749017, 3.431409, 0.284405}, {1, 1, 1, 1}, {1.000000, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.121828, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.104659}, {0.000000, 0.000000, 1.000000}},
    {{-0.749017, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.104659}, {0.000000, -1.000000, 0.000000}},
    {{-0.749017, 2.804220, -0.342784}, {1, 1, 1, 1}, {0.999556, 0.209317}, {0.000000, -1.000000, 0.000000}},
    {{-0.121828, 2.804220, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.104659}, {0.000000, -1.000000, 0.000000}},
    {{-0.121828, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.892954, 0.523293}, {0.000000, 1.000000, 0.000000}},
    {{-0.121828, 3.431409, -0.342784}, {1, 1, 1, 1}, {0.892954, 0.418634}, {0.000000, 1.000000, 0.000000}},
    {{-0.749017, 3.431409, 0.284405}, {1, 1, 1, 1}, {0.999556, 0.523293}, {0.000000, 1.000000, 0.000000}},
    {{-0.336413, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{-0.336413, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{-0.336413, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.931165}, {-1.000000, 0.000000, 0.000000}},
    {{-0.336413, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.592323, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{0.250725, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-0.336413, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.592323, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{0.250725, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{0.250725, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.000000, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{0.250725, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{0.250725, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.336413, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{0.250725, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-0.336413, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.200421, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{-0.336413, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.902025}, {0.000000, -1.000000, 0.000000}},
    {{0.250725, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.300215, 1.000000}, {0.000000, -1.000000, 0.000000}},
    {{0.250725, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.992748, 0.719244}, {0.000000, 1.000000, 0.000000}},
    {{0.250725, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.992748, 0.817219}, {0.000000, 1.000000, 0.000000}},
    {{-0.336413, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.719244}, {0.000000, 1.000000, 0.000000}},
    {{-1.179672, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.000000}, {-1.000000, 0.000000, 0.000000}},
    {{-1.179672, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.000000}, {-1.000000, 0.000000, 0.000000}},
    {{-1.179672, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-1.179672, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.300631, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-0.592534, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-1.179672, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.300631, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-0.592534, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{-0.592534, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.100210, 0.933751}, {1.000000, 0.000000, 0.000000}},
    {{-0.592534, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.623363}, {1.000000, 0.000000, 0.000000}},
    {{-0.592534, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.200421, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-1.179672, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-0.592534, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.200421, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-1.179672, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.992748, 0.817219}, {0.000000, -1.000000, 0.000000}},
    {{-1.179672, -0.871778, -0.309868}, {1, 1, 1, 1}, {0.992748, 0.915194}, {0.000000, -1.000000, 0.000000}},
    {{-0.592534, -0.871778, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.817219}, {0.000000, -1.000000, 0.000000}},
    {{-0.592534, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.400010, 0.902025}, {0.000000, 1.000000, 0.000000}},
    {{-0.592534, 0.996040, -0.309868}, {1, 1, 1, 1}, {0.400010, 1.000000}, {0.000000, 1.000000, 0.000000}},
    {{-1.179672, 0.996040, 0.277270}, {1, 1, 1, 1}, {0.300215, 0.902025}, {0.000000, 1.000000, 0.000000}},
    {{-1.188122, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-1.188122, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.310388}, {-1.000000, 0.000000, 0.000000}},
    {{-1.188122, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.620776}, {-1.000000, 0.000000, 0.000000}},
    {{-1.188122, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.000000}, {0.000000, 0.000000, -1.000000}},
    {{0.253535, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.246056, 0.000000}, {0.000000, 0.000000, -1.000000}},
    {{-1.188122, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.311681}, {0.000000, 0.000000, -1.000000}},
    {{0.253535, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.792744, 0.932652}, {1.000000, 0.000000, 0.000000}},
    {{0.253535, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.692533, 0.932652}, {1.000000, 0.000000, 0.000000}},
    {{0.253535, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.792744, 0.622263}, {1.000000, 0.000000, 0.000000}},
    {{0.253535, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.246056, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-1.188122, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{0.253535, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.246056, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-1.188122, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.501052, 0.623363}, {0.000000, -1.000000, 0.000000}},
    {{-1.188122, 0.966432, -0.309868}, {1, 1, 1, 1}, {0.601262, 0.623363}, {0.000000, -1.000000, 0.000000}},
    {{0.253535, 0.966432, 0.277270}, {1, 1, 1, 1}, {0.501052, 0.862933}, {0.000000, -1.000000, 0.000000}},
    {{0.253535, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.623363}, {0.000000, 1.000000, 0.000000}},
    {{0.253535, 2.834250, -0.309868}, {1, 1, 1, 1}, {0.501052, 0.623363}, {0.000000, 1.000000, 0.000000}},
    {{-1.188122, 2.834250, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.862933}, {0.000000, 1.000000, 0.000000}},
    {{-0.058043, 2.542679, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.902025}, {-0.849600, -0.527500, 0.000000}},
    {{-0.058043, 2.542679, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.902025}, {-0.849600, -0.527500, 0.000000}},
    {{0.927149, 0.955815, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.623363}, {-0.849600, -0.527500, 0.000000}},
    {{-0.058043, 2.542679, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.311681}, {0.000000, 0.000000, -1.000000}},
    {{0.440779, 2.852369, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{0.927149, 0.955815, -0.309868}, {1, 1, 1, 1}, {0.000000, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{0.440779, 2.852369, -0.309868}, {1, 1, 1, 1}, {0.400841, 0.902025}, {0.849600, 0.527500, 0.000000}},
    {{0.440779, 2.852369, 0.277270}, {1, 1, 1, 1}, {0.300631, 0.902025}, {0.849600, 0.527500, 0.000000}},
    {{1.425971, 1.265504, -0.309868}, {1, 1, 1, 1}, {0.400842, 0.623363}, {0.849600, 0.527500, 0.000000}},
    {{0.440779, 2.852369, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{-0.058043, 2.542679, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.000000}, {0.000000, 0.000000, 1.000000}},
    {{1.425971, 1.265504, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{0.927149, 0.955815, 0.277270}, {1, 1, 1, 1}, {0.490435, 0.311682}, {0.527500, -0.849600, 0.000000}},
    {{0.927149, 0.955815, -0.309868}, {1, 1, 1, 1}, {0.490435, 0.409657}, {0.527500, -0.849600, 0.000000}},
    {{1.425971, 1.265504, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.311682}, {0.527500, -0.849600, 0.000000}},
    {{0.440779, 2.852369, 0.277270}, {1, 1, 1, 1}, {0.490435, 0.409657}, {-0.527500, 0.849600, 0.000000}},
    {{0.440779, 2.852369, -0.309868}, {1, 1, 1, 1}, {0.490435, 0.507632}, {-0.527500, 0.849600, 0.000000}},
    {{-0.058043, 2.542679, 0.277270}, {1, 1, 1, 1}, {0.400842, 0.409657}, {-0.527500, 0.849600, 0.000000}},
    {{-1.135882, 2.822975, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.622263}, {-0.007100, 1.000000, 0.000000}},
    {{-1.135882, 2.822975, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.622263}, {-0.007100, 1.000000, 0.000000}},
    {{-3.003652, 2.809699, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.311682}, {-0.007100, 1.000000, 0.000000}},
    {{-1.135882, 2.822975, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-1.131708, 2.235852, -0.309868}, {1, 1, 1, 1}, {0.200421, 0.311682}, {0.000000, 0.000000, -1.000000}},
    {{-3.003652, 2.809699, -0.309868}, {1, 1, 1, 1}, {0.100210, 0.623363}, {0.000000, 0.000000, -1.000000}},
    {{-1.131708, 2.235852, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.000000}, {0.007100, -1.000000, 0.000000}},
    {{-1.131708, 2.235852, 0.277270}, {1, 1, 1, 1}, {0.792744, 0.000000}, {0.007100, -1.000000, 0.000000}},
    {{-2.999479, 2.222576, -0.309868}, {1, 1, 1, 1}, {0.692533, 0.310582}, {0.007100, -1.000000, 0.000000}},
    {{-2.999479, 2.222576, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-1.131708, 2.235852, 0.277270}, {1, 1, 1, 1}, {0.492112, 0.311682}, {0.000000, 0.000000, 1.000000}},
    {{-3.003652, 2.809699, 0.277270}, {1, 1, 1, 1}, {0.592323, 0.623363}, {0.000000, 0.000000, 1.000000}},
    {{-3.003652, 2.809699, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.621268}, {-1.000000, -0.007100, 0.000000}},
    {{-3.003652, 2.809699, -0.309868}, {1, 1, 1, 1}, {0.892954, 0.523293}, {-1.000000, -0.007100, 0.000000}},
    {{-2.999479, 2.222576, 0.277270}, {1, 1, 1, 1}, {0.992811, 0.621268}, {-1.000000, -0.007100, 0.000000}},
    {{-1.131708, 2.235852, 0.277270}, {1, 1, 1, 1}, {0.992811, 0.621268}, {1.000000, 0.007100, 0.000000}},
    {{-1.131708, 2.235852, -0.309868}, {1, 1, 1, 1}, {0.992811, 0.719244}, {1.000000, 0.007100, 0.000000}},
    {{-1.135882, 2.822975, 0.277270}, {1, 1, 1, 1}, {0.892954, 0.621268}, {1.000000, 0.007100, 0.000000}},
};
