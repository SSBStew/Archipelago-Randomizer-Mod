if (!kill)
{
    if (o12__Game.animals[animalID] == 1)
    {
        if (animalID == 4)
            instance_create(x, y, o12_Horse);
        
        instance_destroy();
    }
}

if (moveTimer > 0)
{
    moveTimer -= 1;
    x += deltaX;
    y += deltaY;
}
else
{
}

if (!instance_exists(oGame))
    exit;

if (instance_exists(oTextBox))
    exit;

if (activate)
{
    shaman = scr12_PartyCheckFor(2);
    dog = scr12_PartyCheckFor(8);
    
    if (scr12_PartyCheckForAlive(shaman))
    {
        p = o12__Game.party[shaman];
        
        if (dog > -1)
            d = o12__Game.party[dog];
        
        if (convo == 0)
        {
            str1 = scrStringVal("animal_extra_01", name, p.name);
            str2 = "";
            str3 = "";
            scrDrawTextBoxSplit(str1);
            convo++;
        }
        else if (convo == 1)
        {
            str1 = s1_str1;
            str2 = s1_str2;
            str3 = s1_str3;
            scrDrawTextBoxOpenedSplit(str1);
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convo == 2)
        {
            str1 = s2_str1;
            str2 = s2_str2;
            str3 = s2_str3;
            scrDrawTextBoxOpenedSplit(str1);
            scr12_SetTextBoxYesNo(id, false);
        }
    }
    else if (scr12_PartyCheckForAlive(dog) && animalID == 2)
    {
        scrDrawTextBoxSplit(scrString("animal_extra_02"));
        activate = false;
        kill = true;
        o12__Game.animals[animalID] = 1;
    }
    else
    {
        str1 = no_str1;
        str2 = no_str2;
        str3 = no_str3;
        scrDrawTextBoxOpenedSplit(str1);
        convo = 0;
        activate = false;
    }
}
else if (kill && global.grimstoneUmbraAnimal == 0)
{
    with (o12__Game)
        scrSfx(soundNPCDisappear, 50);
    
    if (false)
    {
        var chest = instance_create(x, y, o12_mapChest);
        chest.chestID = 290;
        chest.item = "DOGTREAT E";
    }
    
    instance_create(x + 8, y + 8, o12_BattleFXPuff);
	if (global.grimstoneUmbraAnimal == 0)
		instance_destroy();
}
else if (moveDir > -1)
{
    if (moveDir == 0)
    {
        moveTimer = 16;
        deltaX = 0;
        deltaY = -1;
    }
    else if (moveDir == 1)
    {
        moveTimer = 16;
        deltaX = 0;
        deltaY = 1;
    }
    
    moveDir = -1;
}

if (yesNoWaiting && yesNo != -1)
{
    if (convo == 1)
    {
        if (yesNo == 0)
        {
            if (global.language == global.LANG_JAPANESE)
            {
                if (scr12_PartyCheckForAlive(dog) && animalID == ANIMAL_ID_COYOTE)
                    scrDrawTextBoxOpened(scrStringVal("animal_extra_03a", p.name, name, scr12_SkillGetName(skill1)), scrStringVal("animal_extra_03b", d.name), "");
                else
                    scrDrawTextBoxOpenedSplit(scrStringVal("animal_extra_04", p.name, name, scr12_SkillGetName(skill1)));
            }
            else if (scr12_PartyCheckForAlive(dog) && animalID == ANIMAL_ID_COYOTE)
            {
                scrDrawTextBoxOpened(scrStringVal("animal_extra_03a", p.name, scr12_SkillGetName(skill1), name), scrStringVal("animal_extra_03b", d.name), "");
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrStringVal("animal_extra_04", p.name, scr12_SkillGetName(skill1), name));
            }
            
            with (oTextBox)
                height = 48;
            
            scr12_SkillAdd(skill1, scr12_PartyCheckFor(2), true);
            convo = 0;
            activate = false;
            kill = true;
        }
        else
        {
            convo++;
            activate = true;
        }
    }
    else if (convo == 2)
    {
        if (yesNo == 0)
        {
            if (global.language == global.LANG_JAPANESE)
            {
                if (scr12_PartyCheckForAlive(dog) && animalID == ANIMAL_ID_COYOTE)
                    scrDrawTextBoxOpened(scrStringVal("animal_extra_03a", p.name, name, scr12_SkillGetName(skill2)), scrStringVal("animal_extra_03b", d.name), "");
                else
                    scrDrawTextBoxOpenedSplit(scrStringVal("animal_extra_04", p.name, name, scr12_SkillGetName(skill2)));
            }
            else if (scr12_PartyCheckForAlive(dog) && animalID == ANIMAL_ID_COYOTE)
            {
                scrDrawTextBoxOpened(scrStringVal("animal_extra_03a", p.name, scr12_SkillGetName(skill2), name), scrStringVal("animal_extra_03b", d.name), "");
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrStringVal("animal_extra_04", p.name, scr12_SkillGetName(skill2), name));
            }
            
            with (oTextBox)
                height = 48;
            
            scr12_SkillAdd(skill2, scr12_PartyCheckFor(2), true);
            convo = 0;
            activate = false;
            kill = true;
        }
        else
        {
            scrDrawTextBoxOpenedSplit(scrString("animal_extra_05"));
            
            with (oTextBox)
                height = 48;
            
            convo = 0;
            activate = false;
        }
    }
    
    if (kill)
    {
        if (animalID == 4)
            instance_create(x, y, o12_Horse);
        
        o12__Game.animals[animalID] = 1;
    }
    
    yesNoWaiting = false;
    yesNo = -1;
    exit;
}
