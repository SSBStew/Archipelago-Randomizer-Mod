function scr07_MenuEquipMode()
{
    if (!instance_exists(o07_ModAppear))
    {
        scrGetInput(0);
    }
    if (modSlot[0] == 99 || modSlot[1] == 99 || modSlot[2] == 99 || modSlot[3] == 99)
    {
        with (o07__Game)
        {
            scrSfx(soundSaveStationModAppear, 80);
        }
        sel = 0;
        for (var i = 0; i < 4; i++)
        {
            if (modSlot[i] == 99)
            {
                instance_create(__view_get(UnknownEnum.Value_0, 0) + 96 + (32 * i), __view_get(UnknownEnum.Value_1, 0) + 28, o07_ModAppear);
                modSlot[i] = 1;
                sel = i;
            }
        }
    }
    else if (instance_exists(o07_ModAppear))
    {
    }
    else if (modSlot[0] == 0 && modSlot[1] == 0 && modSlot[2] == 0 && modSlot[3] == 0)
    {
        if (pressLeft || pressRight)
        {
            state = UnknownEnum.Value_3;
        }
    }
    else
    {
        prevSel = sel;
        if (pressLeft)
        {
            if (sel > 0)
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationNavMod, 50);
                }
                sel -= 1;
                while (modSlot[sel] == 0)
                {
                    if (sel == 0)
                    {
                        break;
                    }
                    else
                    {
                        sel -= 1;
                    }
                }
                if (modSlot[sel] == 0)
                {
                    with (o07__Game)
                    {
                        scrSfx(soundSaveStationNavPage, 50);
                    }
                    sel = prevSel;
                    state = UnknownEnum.Value_3;
                }
            }
            else
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationNavPage, 50);
                }
                state = UnknownEnum.Value_3;
            }
        }
        else if (pressRight)
        {
            if (sel < 3)
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationNavMod, 50);
                }
                sel += 1;
                while (modSlot[sel] == 0)
                {
                    if (sel == 3)
                    {
                        break;
                    }
                    else
                    {
                        sel += 1;
                    }
                }
                if (modSlot[sel] == 0)
                {
                    with (o07__Game)
                    {
                        scrSfx(soundSaveStationNavPage, 50);
                    }
                    sel = prevSel;
                    state = UnknownEnum.Value_3;
                }
            }
            else
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationNavPage, 50);
                }
                state = UnknownEnum.Value_3;
            }
        }
        else if (pressUp)
        {
            if (modSlot[sel] > 1)
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationSetMod, 50);
                }
                modSlot[sel]--;
            }
        }
        else if (pressDown)
        {
            if (modSlot[sel] < 4 && modSlot[sel] != 0)
            {
                with (o07__Game)
                {
                    scrSfx(soundSaveStationSetMod, 50);
                }
                modSlot[sel]++;
            }
        }
        else if (fire2pressed)
        {
            with (o07__Game)
            {
                scrSfx(soundSaveStationNavPage, 50);
            }
            state = UnknownEnum.Value_3;
        }
    }
    if (fire1pressed)
    {
        muteBGM();
        with (o07__Game)
        {
            scrSfx(soundSaveStationExit, 80);
        }
        o07__Game.mapRoom = room;
        ds_grid_destroy(o07__Game.areaGrid);
        scr07_DefineAreas(o07__Game.mapRoom);
        menuState = state;
        state = UnknownEnum.Value_0;
        sel = 0;
        for (var i = 0; i < 4; i++)
        {
            if (modSlot[i] != 0)
            {
                sel = i;
                break;
            }
        }
        var shell = instance_nearest(o07_Player.x, o07_Player.y, o07_SaveShell);
        if (verify(shell))
        {
            shell.sprite_index = s07_SaveShellOpen;
        }
        with (o07__Game)
        {
            saveAtStation = true;
            scrSaveGame(0);
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_3 = 3
}
