active = false;
activeTime = 0;
image_index = 0;
image_speed = 0;
destroyTimer = 5;
destroy = false;
collected = false;
if (x == 1776 && y == 1792)
    location = 0;
if (x == 1088 && y == 2704)
    location = 1;
if (x == 2024 && y == 912)
    location = 2;
if (x == 1536 && y == 688)
    location = 3;
if (x == 720 && y == 1312)
    location = 4;
if (x == 400 && y == 616)
    location = 5;
if (x == 2880 && y == 896)
    location = 6;
if (x == 1944 && y == 2448)
    location = 7;
if (x == 1504 && y == 3088)
    location = 8;
if (x == 2928 && y == 1968)
    location = 9;

if (!has_item(100 + location) && is_location_collected(100 + location) && location != 0)
    destroy = true;
else if (is_location_collected(100 + location) || location == 0)
	collected = true;
else
    scout_location(100 + location);