var itemNum = num + 100;
var locationNum = num + 90;
if (state == -1)
{
    if (spawn != -1)
        gate = instance_create(xx, yy, spawn);
}
if (is_location_collected(locationNum) && state == -1)
{
    image_index = 1;
    state = 10;
}
else if (state == -1)
{
    state = 0;
	scout_location(locationNum);
}
if (state == 1)
{
    if (instance_exists(o19_Mas))
    {
        if (o19_Mas.swimState == 0)
        {
            scrSfx(o19_Mas.soundSwitch, 50);
            
            if (spawn != -1 && num == 1)
            {
                spawn = -1;
				if (instance_exists(gate))
					with (gate)
						instance_destroy();
            }
            collect_location(locationNum);
            image_index = 1;
            state = 10;
        }
    }
}
if (spawn != -1 && has_item(itemNum))
{
	spawn = -1;
	if (instance_exists(gate))
		with (gate)
			instance_destroy();
}
