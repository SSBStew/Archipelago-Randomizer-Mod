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
else
{
    image_blend = -1;
}