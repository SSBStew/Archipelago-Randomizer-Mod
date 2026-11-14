event_inherited();
init = false;
destroy = false;
type = PTYPE_COWBOY;

if (x == 3408 && y == 1664)
    type = PTYPE_SHAMAN;
else if (x == 3296 && y == 1632)
    type = PTYPE_DOCTOR;
else if (x == 3552 && y == 1680)
    type = PTYPE_MONK;
else if (x == 3360 && y == 1584)
    type = PTYPE_SNIPER;
else if (x == 3328 && y == 1696)
    type = PTYPE_BANKER;
else if (x == 3600 && y == 1648)
    type = PTYPE_DANCER;
else if (x == 3568 && y == 1584)
    type = PTYPE_DOG;

image_speed = 0;
image_index = type - 1;
