if (destroy)
{
    image_blend = c_black;
    destroyTimer--;
    
    if (destroyTimer == 0)
        instance_destroy();
}
else if (collected == false)
{
    image_blend = c_blue;
}
else if (global.golfaria_difficulty == 4 && location != 0)
{
	destroy = true
}
else
{
    image_blend = -1;
}
