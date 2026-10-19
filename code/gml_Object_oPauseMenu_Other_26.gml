SUB_INIT = 0;
SUB_NAV = 1;
SUB_RESET = 2;

if (substate == SUB_INIT)
{
    drawMenu = true;
    scrMenuCreate("AP SETTINGS", 0);
    OP_RELEASE = scrMenuItem(TYPE_DUAL_INT, "RELEASE MODE", global.release_mode, 0, 2);    
    for (var i = 0; i < 9; i++)
        scrMenuSpacer(MENU_MEDIUM_SPACER);
    
    OP_BACK = scrMenuItem(TYPE_SINGLE, scrString("menu_item_back_to_settings"));
    scrSwitchSub(SUB_NAV);
}
else if (substate == SUB_NAV)
{
    var choice = scrMenuNavigation();
    
    if (choice == -2)
    {
        scrSfxLibrary(soundSubExit[currentSoundSet]);
        scrSwitchState(statePrev);
        scrOpenConfig();
        scrWriteConfig("release_mode", global.release_mode);
        scrCloseConfig();
        exit;
    }
    
    if (pressStart)
    {
        scrSwitchState(STATE_UNPAUSE);
        scrOpenConfig();
        scrWriteConfig("release_mode", global.release_mode);
        scrCloseConfig();
        exit;
    }
    
    if (choice >= 0)
    {
        switch (menuSel)
        {
            case OP_RELEASE:
                scrSfxLibrary(soundToggle[currentSoundSet]);
                global.release_mode = choice;
                break;
            
            case OP_BACK:
                scrSfxLibrary(soundSubExit[currentSoundSet]);
                scrSwitchState(statePrev);
                scrOpenConfig();
                scrWriteConfig("release_mode", global.release_mode);
                scrCloseConfig();
                break;
            
            
        }
    }
}