depth = -5;
isFlying = false;
image_speed = 0.2;
z = 0;
alarm[0] = 1;
destroyed = 0;
parCount = 5;
parSub = 0;
active = false;
done = false;
data[0] = "..";
data[1] = "...";
data[2] = "....";
myActivator = -4;
if (x == 2200 && y == 2088)
    location = 1;
if (x == 624 && y == 2464)
    location = 2;
if (x == 1464 && y == 984)
    location = 3;
if (x == 1120 && y == 664)
    location = 4;
if (x == 3128 && y == 136)
    location = 5;
if (x == 2896 && y == 944)
    location = 6;
if (x == 3688 && y == 1960)
    location = 7;
if (x == 1672 && y == 3144)
    location = 8;
if (x == 2776 && y == 2872)
    location = 9;
if (x == 1848 && y == 1320)
    location = 10;
scout_location(location + 20);