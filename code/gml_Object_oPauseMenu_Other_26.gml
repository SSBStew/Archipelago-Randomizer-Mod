SUB_INIT = 0;
SUB_NAV = 1;
SUB_RESET = 2;

if (substate == SUB_INIT)
{
    drawMenu = true;
    scrMenuCreate("AP SETTINGS", 0);
    OP_RELEASE = scrMenuItem(TYPE_DUAL_INT, "RELEASE MODE", global.release_mode, 0, 2);
	OP_GRIMSTONEHP = scrMenuItem(TYPE_DUAL_INT, "GRIMSTONE HP", global.grimstonehp, 0, 1);
	OP_GRIMSTONESHOWCHEST = scrMenuItem(TYPE_DUAL_INT, "SHOW CHEST", global.grimstoneShowChest, 0, 1);
	OP_GRIMSTONEUMBRAANIMAL = scrMenuItem(TYPE_DUAL_INT, "UMBRA ANIMAL", global.grimstoneUmbraAnimal, 0, 1);
	OP_GRIMSTONELEESTUDY = scrMenuItem(TYPE_DUAL_INT, "LEE STUDY", global.grimstoneLeeStudy, 0, 1);
    for (var i = 0; i < 5; i++)
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
		scrWriteConfig("grimstonehp", global.grimstonehp);
		scrWriteConfig("grimstoneShowChest", global.grimstoneShowChest);
		scrWriteConfig("grimstoneUmbraAnimal", global.grimstoneUmbraAnimal);
		scrWriteConfig("grimstoneLeeStudy", global.grimstoneLeeStudy);
        scrCloseConfig();
        exit;
    }
    
    if (pressStart)
    {
        scrSwitchState(STATE_UNPAUSE);
        scrOpenConfig();
        scrWriteConfig("release_mode", global.release_mode);
		scrWriteConfig("grimstonehp", global.grimstonehp);
		scrWriteConfig("grimstoneShowChest", global.grimstoneShowChest);
		scrWriteConfig("grimstoneUmbraAnimal", global.grimstoneUmbraAnimal);
		scrWriteConfig("grimstoneLeeStudy", global.grimstoneLeeStudy);
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
            
			case OP_GRIMSTONEHP:
                scrSfxLibrary(soundToggle[currentSoundSet]);
                global.grimstonehp = choice;
                break;
				
			case OP_GRIMSTONESHOWCHEST:
                scrSfxLibrary(soundToggle[currentSoundSet]);
                global.grimstoneShowChest = choice;
                break;
			
			case OP_GRIMSTONEUMBRAANIMAL:
                scrSfxLibrary(soundToggle[currentSoundSet]);
                global.grimstoneUmbraAnimal = choice;
                break;
				
			case OP_GRIMSTONELEESTUDY:
                scrSfxLibrary(soundToggle[currentSoundSet]);
                global.grimstoneLeeStudy = choice;
                break;
				
            case OP_BACK:
                scrSfxLibrary(soundSubExit[currentSoundSet]);
                scrSwitchState(statePrev);
                scrOpenConfig();
                scrWriteConfig("release_mode", global.release_mode);
				scrWriteConfig("grimstonehp", global.grimstonehp);
				scrWriteConfig("grimstoneShowChest", global.grimstoneShowChest);
                scrCloseConfig();
                break;
            
            
        }
    }
}
