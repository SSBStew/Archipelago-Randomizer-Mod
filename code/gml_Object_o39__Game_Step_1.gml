if (state == STATE_NORMAL)
{
    if (newItemBlinkTimer > 0)
    {
        newItemBlinkTimer -= 1;
    }
    else
    {
        newItemBlinkToggle = false;
        alarm[0] = -1;
    }
}
if (loadGame)
{
    scrLoadGame();
    loadGame = false;
    receivedItems = [];
    for (i = 0; i < 70; i++)
    {
        name = night_manor_item_to_name(i);
        receivedItems[i] = false;
        for (j = 0; j < invSizeMax; j++)
        {
            if (name == inv[j])
            {
                receivedItems[i] = true;
                break;
            }
        }
        for (j = 0; j < invNumJournalEntries; j++)
        {
            if (name == invJournal[j])
            {
                receivedItems[i] = true;
                break;
            }
        }
    }
    if (!has_item(3))
    {
        currRoom = ROOM_WARNING;
        state = STATE_WARNING;
        substate = 0;
        miscCount = 60;
        __view_set(UnknownEnum.Value_0, 0, 1152);
        __view_set(UnknownEnum.Value_1, 0, 1344);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
