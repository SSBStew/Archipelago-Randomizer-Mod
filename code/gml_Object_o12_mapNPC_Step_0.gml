if (!instance_exists(oGame))
    exit;

if (!global.textboxExists)
{
    if (startBattle)
    {
        scr12_StartBattle();
        alarm[1] = 60;
        startBattle = false;
    }
    else if (startWarp)
    {
        scr12_MuteBGM();
        
        with (o12__Game)
            scrSfx(soundWarp, 80);
        
        oGame.fadeOut = true;
        o12__Game.state = o12__Game.GAMESTATE_WARP;
        startWarp = false;
    }
    else if (activate)
    {
        if (canTurn)
        {
            if (activator.x < x)
                dir = 2;
            else if (activator.x > x)
                dir = 3;
            else if (activator.y < y)
                dir = 0;
            else if (activator.y > y)
                dir = 1;
        }
        
        if (replace_string)
        {
            var _string, _name;
            
            switch (new_string_index)
            {
                case 0:
                    _string = "npc_special_01";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
                
                case 1:
                    _string = "npc_special_02";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
                
                case 2:
                    _string = "npc_special_03";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
                
                case 3:
                    _string = "npc_special_03";
                    _name = o12__Game.party[abs(partyCheckFor) - 1].name;
                    break;
                
                case 4:
                    _string = "npc_special_04";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
                
                case 5:
                    _string = "npc_special_05";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
                
                case 6:
                    _string = "npc_hotel_07";
                    _name = o12__Game.party[abs(partyCheckFor) - 1].name;
                    break;
                
                case 7:
                    _string = "npc_hotel_08";
                    _name = o12__Game.party[partyCheckFor].name;
                    break;
            }
            
            str1 = scrStringVal(_string, _name);
        }
        
        if (convoID == 1)
        {
            if (convo == 0)
                scrDrawTextBoxSplit(scrString("npc_zad_01"));
            else if (convo == 1)
                scrDrawTextBoxOpenedSplit(scrString("npc_zad_02"));
            else if (convo == 2)
                scrDrawTextBoxOpenedSplit(scrString("npc_zad_03"));
            else if (convo == 3)
                scrDrawTextBoxOpenedSplit(scrString("npc_zad_04"));
            else if (convo == 4)
                scrDrawTextBoxOpenedSplit(scrString("npc_zad_05"));
            
            if (convo < 4)
            {
                convo++;
            }
            else
            {
                convo = 0;
                activate = false;
                o12__Game.state = o12__Game.GAMESTATE_ENTER_NAME;
            }
        }
        else if (convoID == 2)
        {
            if (scr12_InvRemove("TOOLBOX"))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_worker_01"));
                fadeOut = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_worker_02"));
            }
            
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 3)
        {
            if (convo == 0)
                scrDrawTextBoxSplit(scrString("npc_leo_01"));
            else if (convo == 1)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo_02"));
            else if (convo == 2)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo_03"));
            else if (convo == 3)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo_04"));
            else if (convo == 4)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo_05"));
            else if (convo == 5)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo_06"));
            
            if (convo < 5)
            {
                convo++;
            }
            else
            {
                convo = 0;
                activate = false;
				if (o12__Game.story < 3)
                    o12__Game.story = 3;
                kill = true;
            }
        }
        else if (convoID == 4)
        {
            if (!has_item(101))
            {
                scrDrawTextBoxSplit(scrString("npc_guard_01"));
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_guard_02"));
                scr12_InvRemove("PASS");
                if (y >= 128)
                    moveDir = 0;
            }
            
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 5)
        {
            if (!has_item(101))
            {
                scrDrawTextBoxSplit(scrString("npc_guard2_01"));
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_guard2_02"));
                scr12_InvRemove("PASS");
                if (y <= 144)
                    moveDir = 1;
            }
            
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 6)
        {
            if (convo == 0)
                scrDrawTextBoxSplit(scrString("npc_leo2_01"));
            else if (convo == 1)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo2_02"));
            else if (convo == 2)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo2_03"));
            else if (convo == 3)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo2_04"));
            else if (convo == 4)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo2_05"));
            
            if (convo < 4)
            {
                convo++;
            }
            else
            {
                convo = 0;
                activate = false;
                o12__Game.storyFort = 2;
                kill = true;
            }
        }
        else if (convoID == 7)
        {
            if (is_location_collected(300))
            {
                scrDrawTextBoxSplit(scrString("npc_mirror_01"));
                convo = 0;
                activate = false;
                exit;
            }
            else if (o12__Game.storyBetty == 2)
            {
                scrDrawTextBoxSplit(scrString("npc_mirror_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else if (o12__Game.storyBetty == 1)
            {
                scrDrawTextBoxSplit(scrString("npc_mirror_03"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                with (o12__Game)
                    scrSfx(soundInteractVendor, 50);
                
                scrDrawTextBoxSplit(scrString("npc_mirror_04"));
                scr12_SetTextBoxYesNo(id, false);
                dispTeeth = true;
            }
        }
        else if (convoID == 8)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_SNIPER);
            
            if (o12__Game.storyBetty >= 2)
            {
                with (o12__Game)
                    scrSfx(soundInteractVendor, 50);
                
                scrDrawTextBoxSplit(scrString("npc_badbetty_01"));
                scr12_SetTextBoxYesNo(id, false);
                dispTeeth = true;
            }
            else if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit("\"" + scrStringVal("npc_badbetty_02", o12__Game.party[partyCheckFor].name) + "\"");
                }
                else if (convo == 1)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_badbetty_03") + "\"");
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_badbetty_04") + "\"");
                }
                else if (convo == 4)
                {
                    with (o12__Game)
                        scrSfx(soundInteractVendor, 50);
                    
                    scrDrawTextBoxSplit(scrString("npc_badbetty_05"));
                    scr12_SetTextBoxYesNo(id, false);
                    dispTeeth = true;
                }
                
                if (convo < 4)
                    convo++;
                else
                    convo = 0;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_badbetty_06"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 9)
        {
            if (convo == 0)
            {
                if (scr12_InvCheckFor("M. MIRROR"))
                {
                    scrDrawTextBoxSplit(scrString("npc_shapeshift_01"));
                    
                    with (o12_mapRubble)
                        visible = true;
                    
                    if (o12__Game.story < 8)
						o12__Game.story = 8;
                    convo++;
                }
                else
                {
                    scrDrawTextBoxSplit(scrString("npc_shapeshift_02"));
                    convo = 0;
                    activate = false;
                    exit;
                }
            }
            else if (convo == 1)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_shapeshift_03"));
                o12__Game.battleType = 5;
                startBattle = true;
                o12_Player.canCheck = false;
                activate = false;
                exit;
            }
        }
        else if (convoID == 10)
        {
            if (o12__Game.story >= 16)
                scrDrawTextBoxSplit(scrString("npc_shaman_07"));
            else
                scrDrawTextBoxSplit(scrString("npc_shaman_01"));
            
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convoID == 11)
        {
            scrDrawTextBoxSplit(scrString("npc_shaman_02"));
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convoID == 12)
        {
            if (o12__Game.story >= 23)
            {
                scrDrawTextBoxSplit(scrString("npc_southmonk_01"));
                convo = 0;
                activate = false;
                exit;
            }
            else
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit(scrString("npc_southmonk_02"));
                }
                else if (convo == 1)
                {
                    collect_location(302);
                    
                    if (false)
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_southmonk_03"));
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_southmonk_04"));
						if (o12__Game.story < 23)
							o12__Game.story = 23;
                    }
                }
                
                if (convo < 1)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
        }
        else if (convoID == 13)
        {
            if (o12__Game.storyHornHead == 1)
            {
                scrDrawTextBoxSplit(scrString("npc_xafan_01"));
                
                if (x >= 224)
                    moveDir = 2;
                
                scrDrawTextBoxSplit(str1);
                convo = 0;
                activate = false;
                exit;
            }
            else if (scr12_InvCheckFor("P.PEAR"))
            {
                scrDrawTextBoxSplit(scrString("npc_xafan_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_xafan_03"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 14)
        {
            if (convo == 0)
            {
                scrDrawTextBoxSplit(scrString("npc_conductor_01"));
                
                with (oTextBox)
                    height = 48;
                
                convo++;
            }
            else if (convo == 1)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_conductor_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 15)
        {
            with (o12__Game)
                scrSfx(soundInteractVendor, 50);
            
            scrDrawTextBoxSplit(scrString("npc_scammer_01"));
            scr12_SetTextBoxYesNo(id, false);
            dispTeeth = true;
        }
        else if (convoID == 16)
        {
            numDead = 0;
            
            for (i = 0; i < o12__Game.numPlayers; i++)
            {
                if (o12__Game.party[i].hp < 1)
                {
                    numDead += 1;
                    
                    if (o12__Game.party[i].type == 8)
                        cost += (5 * o12__Game.party[i].level);
                    else
                        cost += (10 * o12__Game.party[i].level);
                }
            }
            
            if (numDead > 0)
            {
                with (o12__Game)
                    scrSfx(soundInteractVendor, 50);
                
                scrDrawTextBoxSplit(scrString("npc_revive_01"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_revive_02"));
            }
            
            activate = false;
        }
        else if (convoID == 17)
        {
            if (o12__Game.storyZad > 1)
            {
                scrDrawTextBoxSplit(scrString("npc_zad2_01"));
                convo = 0;
                activate = false;
            }
            else
            {
                if (convo == 0)
                    scrDrawTextBoxSplit(scrString("npc_zad2_02"));
                else if (convo == 1)
                    scrDrawTextBoxOpenedSplit(scrString("npc_zad2_03"));
                else if (convo == 2)
                    scrDrawTextBoxOpenedSplit(scrString("npc_zad2_04"));
                else if (convo == 3)
                    scrDrawTextBoxOpenedSplit(scrString("npc_zad2_05"));
                else if (convo == 4)
                    scrDrawTextBoxOpenedSplit(scrString("npc_zad2_06"));
                
                if (convo < 4)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                    o12__Game.storyZad = 2;
                }
            }
        }
        else if (convoID == 18)
        {
            var _offerSleep = scr12_PartyRest(0);
            
            if (_offerSleep)
            {
                with (o12__Game)
                    scrSfx(soundInteractVendor, 50);
                
                scrDrawTextBoxSplit(scrString("npc_priest_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_priest_01"));
            }
            
            activate = false;
        }
        else if (convoID == 19)
        {
            scrDrawTextBoxOpenedSplit(scrString("npc_demon_01"));
            o12__Game.battleType = 16;
            startBattle = true;
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 20)
        {
            scrDrawTextBoxOpenedSplit(scrString("npc_robber_01"));
            o12__Game.battleType = 17;
            startBattle = true;
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 21)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOG);
            
            if (!is_location_collected(301))
            {
                if (convo == 0)
                {
                    if (scr12_PartyCheckForDead(partyCheckFor))
                        scrDrawTextBoxSplit(scrStringVal("npc_hermit_01", o12__Game.party[abs(partyCheckFor) - 1].name));
                    else if (scr12_PartyCheckForAlive(partyCheckFor))
                        scrDrawTextBoxSplit(scrStringVal("npc_hermit_03", o12__Game.party[partyCheckFor].name));
                    else
                        scrDrawTextBoxSplit(scrString("npc_hermit_02"));
                }
                else if (convo == 1)
                {
                    if (scr12_PartyCheckForAlive(partyCheckFor))
                        scrDrawTextBoxOpenedSplit(scrStringVal("npc_hermit_05", o12__Game.party[partyCheckFor].name));
                    else
                        scrDrawTextBoxOpenedSplit(scrString("npc_hermit_04"));
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_hermit_06"));
                }
                else if (convo == 3)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_hermit_07"));
                }
                else if (convo == 4)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_hermit_08"));
                }
                else if (convo == 5)
                {
                    collect_location(301);
                    
                    if (false)
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_hermit_09"));
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_hermit_10"));
						if (o12__Game.story < 14)
							o12__Game.story = 14;
                    }
                }
                
                if (convo < 5)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
            else if (partyCheckFor > -1)
            {
                scrDrawTextBoxSplit(scrStringVal("npc_hermit_11", o12__Game.party[partyCheckFor].name, o12__Game.party[partyCheckFor].name));
                convo = 0;
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_hermit_12"));
                convo = 0;
                activate = false;
            }
            
            exit;
        }
        else if (convoID == 22)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_SHAMAN);
            
            if (scr12_PartyCheckForNone(partyCheckFor))
            {
                if (o12__Game.storySmoke == 0)
                {
                    if (convo == 0)
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_elder_01"));
                    }
                    else if (convo == 1)
                    {
                        var _gotItem = scr12_InvAdd("MEDKIT", SOUND_ITEM_GET);
                        
                        if (!_gotItem)
                        {
                            scrDrawTextBoxOpenedSplit(scrString("npc_elder_02"));
                        }
                        else
                        {
                            scrDrawTextBoxOpenedSplit(scrString("npc_elder_03"));
                            o12__Game.storySmoke = 1;
                        }
                    }
                    
                    if (convo < 1)
                    {
                        convo++;
                    }
                    else
                    {
                        convo = 0;
                        activate = false;
                    }
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_elder_04"));
                    activate = false;
                }
            }
            else if (scr12_PartyCheckForDead(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_elder_04"));
                activate = false;
            }
            else if (o12__Game.storySmoke == 0)
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit(scrStringVal("npc_elder_05", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 1)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrStringVal("npc_elder_06", o12__Game.party[partyCheckFor].name) + "\"");
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_elder_07", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 3)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_elder_08") + "\"");
                }
                else if (convo == 4)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_elder_09") + "\"");
                }
                else if (convo == 5)
                {
                    var _gotItem = scr12_InvAdd("f SHAMAN", SOUND_ITEM_GET);
                    
                    if (!_gotItem)
                    {
                        scrDrawTextBoxOpenedSplit("\"" + scrString("npc_elder_10") + "\"");
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_elder_11"));
                        o12__Game.storySmoke = 1;
                    }
                }
                
                if (convo < 5)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_elder_12"));
                activate = false;
            }
            
            exit;
        }
        else if (convoID == 23)
        {
            if (convo == 0)
                scrDrawTextBoxSplit(scrString("npc_sam_01"));
            else if (convo == 1)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_02"));
            else if (convo == 2)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_03"));
            else if (convo == 3)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_04"));
            else if (convo == 4)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_05"));
            else if (convo == 5)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_06"));
            else if (convo == 6)
                scrDrawTextBoxOpenedSplit(scrString("npc_sam_07"));
            
            if (convo < 6)
            {
                convo++;
            }
            else
            {
                convo = 0;
                activate = false;
                o12__Game.storySam = 1;
                kill = true;
            }
        }
        else if (convoID == 24)
        {
            if (o12__Game.storySam < 2)
                scrDrawTextBoxSplit(scrString("npc_sam_08"));
            else
                scrDrawTextBoxSplit(scrString("npc_sam_09"));
            
            convo = 0;
            activate = false;
            exit;
        }
        else if (convoID == 25)
        {
            if (convo == 0)
                scrDrawTextBoxSplit(scrString("npc_leo3_01"));
            else if (convo == 1)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_02"));
            else if (convo == 2)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_03"));
            else if (convo == 3)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_04"));
            else if (convo == 4)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_05"));
            else if (convo == 5)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_06"));
            else if (convo == 6)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_07"));
            else if (convo == 7)
                scrDrawTextBoxOpenedSplit(scrString("npc_leo3_08"));
            
            if (convo < 7)
            {
                convo++;
            }
            else
            {
                convo = 0;
                activate = false;
				if (o12__Game.story < 21)
                    o12__Game.story = 21;
                kill = true;
            }
        }
        else if (convoID == 26)
        {
            if (o12__Game.storyGunsmith >= 2)
            {
                scrDrawTextBoxSplit(scrString("npc_gunsmith_01"));
            }
            else if (scr12_InvCheckFor("ABYSSIDIAN"))
            {
                scrDrawTextBoxSplit(scrString("npc_gunsmith_02"));
                
                if (instance_exists(oTextBox))
                    scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_gunsmith_03"));
            }
            
            activate = false;
            exit;
        }
        else if (convoID == 27)
        {
            scrDrawTextBoxSplit(scrString("npc_miner_01"));
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convoID == 28)
        {
            if (o12__Game.storyThunderbird >= 2)
            {
                scrDrawTextBoxSplit(scrString("npc_sant_sheriff_01"));
            }
            else if (scr12_InvCheckFor("SCALE"))
            {
                scrDrawTextBoxSplit(scrString("npc_sant_sheriff_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_sant_sheriff_03"));
            }
            
            activate = false;
            exit;
        }
        else if (convoID == 29)
        {
            scrDrawTextBoxSplit(scrString("npc_aust_sheriff_01"));
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convoID == 30)
        {
            with (o12__Game)
                scrSfx(soundInteractVendor, 50);
            
            scrDrawTextBoxSplit(scrString("npc_lawb_sheriff_01"));
            scr12_SetTextBoxYesNo(id, false);
            dispTeeth = true;
        }
        else if (convoID == 31)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_BANKER);
            
            if (scr12_PartyCheckForDead(partyCheckFor) || scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_banker_01"));
                activate = false;
            }
            else if (o12__Game.storyPearl == 0)
            {
                if (convo == 0)
                    scrDrawTextBoxSplit(scrStringVal("npc_banker_02", o12__Game.party[partyCheckFor].name));
                else if (convo == 1)
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_03"));
                else if (convo == 2)
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_04"));
                else if (convo == 3)
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_05"));
                else if (convo == 4)
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_06"));
                
                if (convo < 4)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    o12__Game.storyPearl = 1;
                    activate = false;
                }
            }
            else if (o12__Game.storyPearl == 1)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_banker_10"));
                activate = false;
            }
            else if (o12__Game.storyPearl == 2)
            {
                if (scr12_InvRemove("LETTER"))
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_07"));
                    o12__Game.bankBalance += 3000;
                    o12__Game.storyPearl = 3;
                    activate = false;
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_banker_08"));
                    activate = false;
                }
            }
            else if (o12__Game.storyPearl >= 3)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_banker_09"));
                activate = false;
            }
            
            exit;
        }
        else if (convoID == 32)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_BANKER);
            
            if (scr12_PartyCheckForDead(partyCheckFor) || scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_pete_01"));
                activate = false;
            }
            else if (o12__Game.storyPearl < 2)
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit(scrStringVal("npc_pete_02", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 1)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_pete_03"));
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrStringVal("npc_pete_04", o12__Game.party[partyCheckFor].name) + "\"");
                }
                else if (convo == 3)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_pete_05") + "\"");
                }
                else if (convo == 4)
                {
                    var _gotItem = scr12_InvAdd("LETTER", SOUND_ITEM_GET);
                    
                    if (!_gotItem)
                    {
                        scrDrawTextBoxOpenedSplit("\"" + scrString("npc_pete_06") + "\"");
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_pete_07"));
                        o12__Game.storyPearl = 2;
                    }
                }
                
                if (convo < 4)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
            else
            {
                scrDrawTextBoxSplit(scrStringVal("npc_pete_08", o12__Game.party[partyCheckFor].name));
                activate = false;
            }
        }
        else if (convoID == 33)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DANCER);
            
            if (scr12_PartyCheckForDead(partyCheckFor) || scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_possum_01"));
                activate = false;
            }
            else
            {
                if (convo == 0)
                    scrDrawTextBoxSplit("\"" + scrStringVal("npc_possum_02", o12__Game.party[partyCheckFor].name) + "\"");
                else if (convo == 1)
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_possum_03", o12__Game.party[partyCheckFor].name));
                else if (convo == 2)
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_possum_04") + "\"");
                else if (convo == 3)
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_possum_05") + "\"");
                
                if (convo < 4)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    startBattle = true;
                    o12__Game.battleType = 19;
                    activate = false;
                }
            }
        }
        else if (convoID == 34)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DANCER);
            
            if (scr12_PartyCheckForDead(partyCheckFor) || scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_dancer_01"));
                activate = false;
            }
            else if (position_meeting(3456, 480, o12__Warp))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_dancer_02"));
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrStringVal("npc_dancer_03", o12__Game.party[partyCheckFor].name));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 35)
        {
            scrDrawTextBoxSplit(scrString("npc_well_01"));
            scr12_SetTextBoxYesNo(id, false);
        }
        else if (convoID == 36)
        {
            if (o12__Game.storyGunsmith >= 1)
            {
                scrDrawTextBoxSplit(scrString("npc_dealer_01"));
                activate = false;
            }
            else
            {
                with (o12__Game)
                    scrSfx(soundInteractVendor, 50);
                
                scrDrawTextBoxSplit(scrString("npc_dealer_02"));
                scr12_SetTextBoxYesNo(id, false);
                dispTeeth = true;
            }
        }
        else if (convoID == 37)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOG);
            
            if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                scrDrawTextBoxSplit(scrString("npc_sant_dog_01"));
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_sant_dog_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 38)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_MONK);
            
            if (scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_wife_01"));
                activate = false;
            }
            else if (scr12_PartyCheckForDead(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrStringVal("npc_wife_02", o12__Game.party[abs(partyCheckFor) - 1].name));
                activate = false;
            }
            else if (o12__Game.storyLee == 0)
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit(scrStringVal("npc_wife_03", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 1)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrStringVal("npc_wife_04", o12__Game.party[partyCheckFor].name) + "\"");
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_wife_05") + "\"");
                }
                else if (convo == 3)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_wife_06", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 4)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_wife_07") + "\"");
                }
                else if (convo == 5)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_wife_08") + "\"");
                }
                else if (convo == 6)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_wife_09", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 7)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_wife_10", o12__Game.party[partyCheckFor].name));
                    o12__Game.party[partyCheckFor].perkSURVIVE = 1;
                    o12__Game.storyLee = 1;
                }
                
                if (convo < 7)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_wife_11"));
                activate = false;
            }
            
            exit;
        }
        else if (convoID == 39)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOCTOR);
            
            if (o12__Game.storyDoc > 0)
            {
                scrDrawTextBoxSplit(scrString("npc_wounded_01"));
                activate = false;
            }
            else if (scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_wounded_02"));
                activate = false;
            }
            else if (scr12_PartyCheckForDead(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_wounded_03"));
                activate = false;
            }
            else if (scr12_InvCheckFor("MEDKIT") || scr12_InvCheckFor("MEDHALF"))
            {
                scrDrawTextBoxSplit(scrStringVal("npc_wounded_04", o12__Game.party[partyCheckFor].name));
                scr12_SetTextBoxYesNo(id, false);
            }
            else
            {
                scrDrawTextBoxSplit(scrStringVal("npc_wounded_05", o12__Game.party[partyCheckFor].name));
                activate = false;
            }
        }
        else if (convoID == 40)
        {
            with (o12__Game)
                scrSfx(soundInteractVendor, 50);
            
            scrDrawTextBoxSplit(scrString("npc_medkit_01"));
            scr12_SetTextBoxYesNo(id, false);
            dispTeeth = true;
        }
        else if (convoID == 41)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOG);
            
            if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                scrDrawTextBoxSplit(scrString("npc_riov_dog_01"));
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_riov_dog_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 42)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOG);
            
            if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                scrDrawTextBoxSplit(scrString("npc_elpa_dog_01"));
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_elpa_dog_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 43)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_COWBOY);
            
            if (scr12_PartyCheckForDead(partyCheckFor) || scr12_PartyCheckForNone(partyCheckFor))
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_bull_01"));
                activate = false;
            }
            else if (o12__Game.storyBull == 0)
            {
                if (convo == 0)
                {
                    scrDrawTextBoxSplit("\"" + scrStringVal("npc_bull_02", o12__Game.party[partyCheckFor].name) + "\"");
                }
                else if (convo == 1)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_bull_03", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 2)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_bull_04") + "\"");
                }
                else if (convo == 3)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_bull_05", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 4)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_bull_06") + "\"");
                }
                else if (convo == 5)
                {
                    scrDrawTextBoxOpenedSplit("\"" + scrString("npc_bull_07") + "\"");
                }
                else if (convo == 6)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_bull_08", o12__Game.party[partyCheckFor].name));
                }
                else if (convo == 7)
                {
                    scrDrawTextBoxOpenedSplit(scrStringVal("npc_bull_09", o12__Game.party[partyCheckFor].name));
                    scr12_SkillAdd("PROTECT", partyCheckFor, true);
                    o12__Game.storyBull = 1;
                }
                
                if (convo < 7)
                {
                    convo++;
                }
                else
                {
                    convo = 0;
                    activate = false;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_bull_10"));
                activate = false;
            }
            
            exit;
        }
        else if (convoID == 44)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_DOG);
            
            if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                scrDrawTextBoxSplit(scrString("npc_lawb_dog_01"));
                activate = false;
            }
            else
            {
                scrDrawTextBox(scrString("npc_lawb_dog_02"));
                scr12_SetTextBoxYesNo(id, false);
            }
        }
        else if (convoID == 45)
        {
            if (!is_location_collected(304))
            {
                if (false)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_nun_01"));
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_nun_02"));
					collect_location(304);
					if (o12__Game.story < 10)
                        o12__Game.story = 10;
                }
                
                activate = false;
            }
            else
            {
                scrDrawTextBoxSplit(scrString("npc_nun_03"));
                activate = false;
            }
        }
        else if (singleString)
        {
            scrDrawTextBoxSplit(str1);
            convo = 0;
            activate = false;
        }
        else
        {
            scrDrawTextBox(str1, str2, str3);
            convo = 0;
            activate = false;
        }
    }
    else if (kill)
    {
        if (!instance_exists(oTextBox))
        {
            with (o12__Game)
                scrSfx(soundNPCDisappear, 50);
            
            if (convoID == 3)
            {
                var chest = instance_create(x, y, o12_mapChest);
                chest.item = "FEATHER";
                chest.chestID = 212;
            }
            
            instance_create(x + 8, y + 8, o12_BattleFXPuff);
            instance_destroy();
        }
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
        else if (moveDir == 2)
        {
            moveTimer = 16;
            deltaX = -1;
            deltaY = 0;
        }
        else if (moveDir == 3)
        {
            moveTimer = 16;
            deltaX = 1;
            deltaY = 0;
        }
        
        moveDir = -1;
    }
    
    if (yesNoWaiting && yesNo != -1)
    {
        dispTeeth = false;
        
        if (convoID == 7)
        {
            if (yesNo == 0)
            {
                if (o12__Game.storyBetty >= 1)
                {
                    collect_location(300);
                    
                    if (false)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_mirror_05"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_mirror_06"));
                        
                        with (oTextBox)
                            height = 48;
                        if (o12__Game.story < 5)
							o12__Game.story = 5;
                    }
                }
                else if (o12__Game.teeth >= 10000)
                {
                    collect_location(300);
                    
                    if (false)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_mirror_07"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpenedSplit(scrString("npc_mirror_08"));
                        
                        with (oTextBox)
                            height = 48;
                        
                        if (o12__Game.story < 5)
							o12__Game.story = 5;
                        o12__Game.teeth -= 10000;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_mirror_09"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else if (o12__Game.storyBetty == 1)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_mirror_10"));
                
                with (oTextBox)
                    height = 48;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_mirror_11"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 8)
        {
            partyCheckFor = scr12_PartyCheckFor(o12__Game.PTYPE_SNIPER);
            
            if (o12__Game.storyBetty >= 2)
            {
                if (yesNo == 0)
                {
                    if (o12__Game.teeth >= 1000)
                    {
                        var _gotItem = scr12_InvAdd("COFFEE", SOUND_ITEM_BUY);
                        
                        if (!_gotItem)
                        {
                            with (o12__Game)
                                scrSfx(soundMenuNope, 50);
                            
                            scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_07"));
                            
                            with (oTextBox)
                                height = 48;
                        }
                        else
                        {
                            scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_08"));
                            
                            with (oTextBox)
                                height = 48;
                            
                            o12__Game.teeth -= 1000;
                        }
                    }
                    else
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_09"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_10"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else if (scr12_PartyCheckForAlive(partyCheckFor))
            {
                if (yesNo == 0)
                {
                    if (o12__Game.teeth >= 4000)
                    {
                        with (o12__Game)
                            scrSfx(soundShopBuy, 60);
                        
                        scrDrawTextBoxOpenedSplit(scrStringVal("npc_badbetty_11", o12__Game.party[partyCheckFor].name));
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 4000;
                        o12__Game.storyBetty = 2;
                    }
                    else
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_12"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_13"));
                    
                    with (oTextBox)
                        height = 48;
                    
                    o12__Game.battleType = 4;
                    startBattle = true;
                    o12_Player.canCheck = false;
                }
            }
            else
            {
                if (yesNo == 0)
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_14"));
                    
                    with (oTextBox)
                        height = 48;
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_badbetty_15"));
                    
                    with (oTextBox)
                        height = 48;
                }
                
                o12__Game.battleType = 4;
                startBattle = true;
                o12_Player.canCheck = false;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 10)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundDrinkElixir, 80);
                
                if (o12__Game.story >= 16)
                    scrDrawTextBoxOpenedSplit(scrString("npc_shaman_08"));
                else
                    scrDrawTextBoxOpenedSplit(scrString("npc_shaman_03"));
                
                with (oTextBox)
                    height = 48;
                
                o12__Game.warpX = 1;
                o12__Game.warpY = 1;
                deltaX = 0;
                deltaY = 0;
                startWarp = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_shaman_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 11)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_shaman_05"));
                
                with (oTextBox)
                    height = 48;
                
                o12__Game.warpX = 1;
                o12__Game.warpY = 1;
                deltaX = 0;
                deltaY = 0;
                startWarp = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_shaman_06"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 13)
        {
            if (yesNo == 0)
            {
                if (scr12_InvCheckFor("P.PEAR"))
                {
                    with (o12__Game)
                        scrSfx(soundGiveItem, 60);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_xafan_04"));
                    scr12_InvRemove("P.PEAR");
                    o12__Game.storyHornHead = 1;
                    kill = true;
                }
                else
                {
                    scrDrawTextBoxOpenedSplit(scrString("npc_xafan_05"));
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_xafan_06"));
                o12__Game.battleType = 15;
                startBattle = true;
            }
            
            with (oTextBox)
                height = 48;
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 14)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_conductor_03"));
                
                with (oTextBox)
                    height = 48;
                
                o12__Game.warpX = 432;
                o12__Game.warpY = 784;
                deltaX = 0;
                deltaY = 0;
                startWarp = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_conductor_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 15)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 1000)
                {
                    with (o12__Game)
                        scrSfx(soundShopBuy, 60);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_scammer_02"));
                    
                    with (oTextBox)
                        height = 48;
                    
                    o12__Game.teeth -= 1000;
                    o12__Game.storyHorse = 1;
                    kill = true;
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_scammer_03"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_scammer_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 16)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundRevive, 60);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_revive_03"));
                
                with (oTextBox)
                    height = 48;
                
                for (i = 0; i < o12__Game.numPlayers; i++)
                {
                    if (o12__Game.party[i].hp < 1)
                        o12__Game.party[i].hp = 1;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_revive_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 18)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundMenuConfirm, 60);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_priest_03"));
                
                with (oTextBox)
                    height = 48;
                
                fadeOut = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_priest_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 26)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundGiveItem, 60);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_gunsmith_04"));
                
                with (oTextBox)
                    height = 48;
                
                fadeOut = true;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_gunsmith_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 27)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 8000)
                {
                    var _gotItem = scr12_InvAdd("k MINE", SOUND_ITEM_BUY);
                    
                    if (!_gotItem)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_miner_02"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpened(scrString("npc_miner_03a"), scrString("npc_miner_03b"), "");
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 8000;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_miner_04"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_miner_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 28)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_sant_sheriff_04"));
                
                with (oTextBox)
                    height = 48;
                
                scr12_InvRemove("SCALE");
                collect_location(305);
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_sant_sheriff_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 29)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 5000)
                {
                    var _gotItem = scr12_InvAdd("k FOCUS", SOUND_ITEM_BUY);
                    
                    if (!_gotItem)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_aust_sheriff_02"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpened(scrString("npc_aust_sheriff_03a"), scrString("npc_aust_sheriff_03b"), "");
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 5000;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_aust_sheriff_04"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_aust_sheriff_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 30)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 500)
                {
                    var _gotItem = scr12_InvAdd("FEATHER", SOUND_ITEM_BUY);
                    
                    if (!_gotItem)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_lawb_sheriff_02"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpened(scrString("npc_lawb_sheriff_03a"), scrString("npc_lawb_sheriff_03b"), "");
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 500;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_lawb_sheriff_04"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_lawb_sheriff_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 34)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundMenuConfirm, 60);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_dancer_04"));
                
                with (oTextBox)
                    height = 48;
                
                if (!position_meeting(3456, 480, o12__Warp))
                {
                    with (instance_create(3456, 480, o12_mapWarp))
                        killOnWarp = true;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_dancer_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 35)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_well_02"));
                
                with (oTextBox)
                    height = 48;
                
                if (!position_meeting(o12__Game.party[0].x, o12__Game.party[0].y, o12__Warp))
                {
                    with (o12__Game.party[0])
                        warpText = true;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_well_03"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 36)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 100000)
                {
                    var _gotItem = scr12_InvAdd("ABYSSIDIAN", SOUND_ITEM_BUY);
                    
                    if (!_gotItem)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_dealer_03"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpened(scrString("npc_dealer_04a"), scrString("npc_dealer_04b"), "");
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 100000;
                        o12__Game.storyGunsmith = 1;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_dealer_05"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_dealer_06"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 37)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundGoodBoy, 50);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_sant_dog_03"));
                
                with (oTextBox)
                    height = 48;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_sant_dog_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 39)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrStringVal("npc_wounded_06", o12__Game.party[partyCheckFor].name));
                
                with (oTextBox)
                    height = 48;
                
                if (scr12_InvCheckFor("MEDKIT"))
                    scr12_InvRemove("MEDKIT");
                else
                    scr12_InvRemove("MEDHALF");
                
                scr12_SkillAdd("REVIVE", partyCheckFor, true);
                o12__Game.storyDoc = 1;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrStringVal("npc_wounded_07", o12__Game.party[partyCheckFor].name));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 40)
        {
            if (yesNo == 0)
            {
                if (o12__Game.teeth >= 8000)
                {
                    var _gotItem = scr12_InvAdd("MEDKIT", SOUND_ITEM_BUY);
                    
                    if (!_gotItem)
                    {
                        with (o12__Game)
                            scrSfx(soundMenuNope, 50);
                        
                        scrDrawTextBoxOpenedSplit(scrString("npc_medkit_02"));
                        
                        with (oTextBox)
                            height = 48;
                    }
                    else
                    {
                        scrDrawTextBoxOpened(scrString("npc_medkit_03a"), scrString("npc_medkit_03b"), "");
                        
                        with (oTextBox)
                            height = 48;
                        
                        o12__Game.teeth -= 8000;
                    }
                }
                else
                {
                    with (o12__Game)
                        scrSfx(soundMenuNope, 50);
                    
                    scrDrawTextBoxOpenedSplit(scrString("npc_medkit_04"));
                    
                    with (oTextBox)
                        height = 48;
                }
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_medkit_05"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 41)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundGoodBoy, 50);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_riov_dog_03"));
                
                with (oTextBox)
                    height = 48;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_riov_dog_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 42)
        {
            if (yesNo == 0)
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_elpa_dog_03"));
                
                with (oTextBox)
                    height = 48;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_elpa_dog_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
        else if (convoID == 44)
        {
            if (yesNo == 0)
            {
                with (o12__Game)
                    scrSfx(soundGoodBoy, 50);
                
                scrDrawTextBoxOpenedSplit(scrString("npc_lawb_dog_03"));
                
                with (oTextBox)
                    height = 48;
            }
            else
            {
                scrDrawTextBoxOpenedSplit(scrString("npc_lawb_dog_04"));
                
                with (oTextBox)
                    height = 48;
            }
            
            yesNoWaiting = false;
            yesNo = -1;
            exit;
        }
    }
    
    if (fadeOut)
    {
        fadeOut = false;
        oGame.fadeOut = true;
        
        if (convoID == 18)
        {
            with (o12__Game)
            {
                scrSfx(soundSleep, 80);
                scr12_PartyRest(1);
                state = GAMESTATE_FRANCESCO_SLEEP;
            }
        }
        else if (convoID == 26)
        {
            with (o12__Game)
            {
                scrSfx(soundSleep, 80);
                scr12_PartyRest(1);
                state = GAMESTATE_GUNSMITH_FINISH;
            }
        }
        else
        {
            with (o12__Game)
            {
                scrSfx(soundConstruction, 80);
                story = 2;
                state = GAMESTATE_BRIDGE_FIXED_1;
            }
        }
    }
}

if (moveTimer > 0)
{
    if (sprite_index == s12_mapEnemySmoke)
        sprite_index = s12_mapEnemy;
    
    moveTimer -= 1;
    x += deltaX;
    y += deltaY;
}
else
{
}
