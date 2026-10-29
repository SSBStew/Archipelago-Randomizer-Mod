if (!instance_exists(oTextBox))
{
    if (activate)
    {
        if (o12__Game.storySam == 1)
        {
            scr12_TeethGet(500, true);
			collect_location(306);
            scrDrawTextBoxSplit(scrString("stash_01"));
            o12__Game.storySam = 2;
        }
        else
        {
            scrDrawTextBoxSplit(scrString("stash_02"));
        }
        
        activate = false;
    }
}
