#define HOLED_WALL_HOLE 2
#define HOLED_WALL_DAMAGED 1
#define HOLED_WALL_INITIAL 0

/**
 * Component(which is child of /datum/component/torn_wall) applied to a wall to make a hole in it.
 * If component is applied to something which already has it, stage increases.
 * Wall will get the hole on third application.
 * Can be fixed using a welder
 */
