function scr12_ItemGetVal(arg0, arg1)
{
    var _TYPE_STAT = 0;
    var _TYPE_PRICE_NORMAL = 1;
    var _TYPE_PRICE_BUY_ONLY = 2;
    var _item = arg0;
    var _type = arg1;
    
    if (_type == _TYPE_STAT)
    {
        if (_item == "a DERANGER")
            return 6;
        
        if (_item == "a PEPPRBOX")
            return 8;
        
        if (_item == "a SIDEWIND")
            return 16;
        
        if (_item == "a DRAGOON")
            return 24;
        
        if (_item == "a PEACEMKR")
            return 38;
        
        if (_item == "a HELLFANG")
            return 66;
        
        if (_item == "b COACH")
            return 18;
        
        if (_item == "b 4BARREL")
            return 30;
        
        if (_item == "b BUSTER")
            return 48;
        
        if (_item == "b NOCKER")
            return 68;
        
        if (_item == "b PUNTER")
            return 88;
        
        if (_item == "c LONGRIFL")
            return 20;
        
        if (_item == "c SCORPION")
            return 27;
        
        if (_item == "c INFANTRY")
            return 40;
        
        if (_item == "c BUFFALO")
            return 64;
        
        if (_item == "c MUSKET")
            return 111;
        
        if (_item == "c CALAMITY")
            return 200;
        
        if (_item == "d RATLING")
            return 37;
        
        if (_item == "d MITRAIL")
            return 51;
        
        if (_item == "d BLITZER")
            return 76;
        
        if (_item == "d INFERNO")
            return 100;
        
        if (_item == "e KITCHEN")
            return 8;
        
        if (_item == "e DAGGER")
            return 14;
        
        if (_item == "e BOWIE")
            return 28;
        
        if (_item == "e OBSIDIAN")
            return 49;
        
        if (_item == "e TOOTHPIK")
            return 72;
        
        if (_item == "j WOOD")
            return 12;
        
        if (_item == "j RECURVE")
            return 52;
        
        if (_item == "j EAGLE")
            return 80;
        
        if (_item == "f BANDANA")
            return 2;
        
        if (_item == "f BOLO")
            return 4;
        
        if (_item == "f CHARM")
            return 8;
        
        if (_item == "f BONE")
            return 12;
        
        if (_item == "f DIAMOND")
            return 20;
        
        if (_item == "f RESIST")
            return 6;
        
        if (_item == "f SHAMAN")
            return 10;
        
        if (_item == "f FOCUS")
            return 4;
        
        if (_item == "g LITEVEST")
            return 2;
        
        if (_item == "g WOOL")
            return 6;
        
        if (_item == "g LEATHER")
            return 12;
        
        if (_item == "g PONCHO")
            return 20;
        
        if (_item == "g DUSTER")
            return 32;
        
        if (_item == "g DEMON")
            return 48;
        
        if (_item == "h COTTON")
            return 1;
        
        if (_item == "h WOOL")
            return 2;
        
        if (_item == "h LEATHER")
            return 8;
        
        if (_item == "h SILK")
            return 16;
        
        if (_item == "h ROYAL")
            return 24;
        
        if (_item == "i WORN")
            return 2;
        
        if (_item == "i LEATHER")
            return 4;
        
        if (_item == "i SNAKE")
            return 8;
        
        if (_item == "i EELSKIN")
            return 10;
        
        if (_item == "i GATOR")
            return 12;
        
        if (_item == "i MOCASIN")
            return 16;
    }
    else if (_type == _TYPE_PRICE_BUY_ONLY && (_item == "DOGTREAT A" || _item == "DOGTREAT D" || _item == "DOGTREAT E"))
    {
        if (_item == "DOGTREAT A")
            return 50000;
        
        if (_item == "DOGTREAT D")
            return 50000;
        
        if (_item == "DOGTREAT E")
            return 50000;
    }
    else
    {
        if (_item == "a DERANGER")
            return 50;
        
        if (_item == "a PEPPRBOX")
            return 800;
        
        if (_item == "a SIDEWIND")
            return 8000;
        
        if (_item == "a DRAGOON")
            return 16000;
        
        if (_item == "a PEACEMKR")
            return 30000;
        
        if (_item == "a HELLFANG")
            return 60000;
        
        if (_item == "b COACH")
            return 400;
        
        if (_item == "b 4BARREL")
            return 6000;
        
        if (_item == "b BUSTER")
            return 25000;
        
        if (_item == "b NOCKER")
            return 35000;
        
        if (_item == "b PUNTER")
            return 45000;
        
        if (_item == "c LONGRIFL")
            return 1200;
        
        if (_item == "c SCORPION")
            return 2400;
        
        if (_item == "c INFANTRY")
            return 12000;
        
        if (_item == "c BUFFALO")
            return 24000;
        
        if (_item == "c MUSKET")
            return 32000;
        
        if (_item == "c CALAMITY")
            return 240000;
        
        if (_item == "d RATLING")
            return 10000;
        
        if (_item == "d MITRAIL")
            return 20000;
        
        if (_item == "d BLITZER")
            return 40000;
        
        if (_item == "d INFERNO")
            return 80000;
        
        if (_item == "e KITCHEN")
            return 160;
        
        if (_item == "e DAGGER")
            return 2000;
        
        if (_item == "e BOWIE")
            return 4000;
        
        if (_item == "e OBSIDIAN")
            return 16000;
        
        if (_item == "e TOOTHPIK")
            return 50000;
        
        if (_item == "j WOOD")
            return 600;
        
        if (_item == "j RECURVE")
            return 2000;
        
        if (_item == "j EAGLE")
            return 24000;
        
        if (_item == "f BANDANA")
            return 30;
        
        if (_item == "f BOLO")
            return 100;
        
        if (_item == "f CHARM")
            return 600;
        
        if (_item == "f BONE")
            return 16000;
        
        if (_item == "f DIAMOND")
            return 10000;
        
        if (_item == "f RESIST")
            return 12000;
        
        if (_item == "f SHAMAN")
            return 16000;
			
		if (_item == "f FOCUS")
            return 10000;
        
        if (_item == "g LITEVEST")
            return 30;
        
        if (_item == "g WOOL")
            return 150;
        
        if (_item == "g LEATHER")
            return 1300;
        
        if (_item == "g PONCHO")
            return 8000;
        
        if (_item == "g DUSTER")
            return 24000;
        
        if (_item == "g DEMON")
            return 60000;
        
        if (_item == "h COTTON")
            return 20;
        
        if (_item == "h WOOL")
            return 40;
        
        if (_item == "h LEATHER")
            return 1600;
        
        if (_item == "h SILK")
            return 6000;
        
        if (_item == "h ROYAL")
            return 10000;
        
        if (_item == "i WORN")
            return 25;
        
        if (_item == "i LEATHER")
            return 90;
        
        if (_item == "i SNAKE")
            return 200;
        
        if (_item == "i EELSKIN")
            return 900;
        
        if (_item == "i GATOR")
            return 5000;
        
        if (_item == "i MOCASIN")
            return 6000;
        
        if (_item == "BANDAGE")
            return 40;
        
        if (_item == "BANDHALF")
            return 20;
        
        if (_item == "HERB")
            return 40;
        
        if (_item == "HERBHALF")
            return 20;
        
        if (_item == "OINTMENT")
            return 120;
        
        if (_item == "OINTHALF")
            return 60;
        
        if (_item == "MEDKIT")
            return 600;
        
        if (_item == "MEDHALF")
            return 300;
        
        if (_item == "HOLYWATER")
            return 1200;
        
        if (_item == "ANTIDOTE")
            return 60;
        
        if (_item == "ANTIHALF")
            return 30;
        
        if (_item == "LASSO")
            return 60;
        
        if (_item == "BEDROLLS")
            return 200;
        
        if (_item == "FEATHER")
            return 800;
        
        if (_item == "SALT")
            return 200;
        
        if (_item == "ROOTBEER")
            return 120;
        
        if (_item == "COFFEE")
            return 1000;
        
        if (_item == "MINTLEAF")
            return 240;
        
        if (_item == "P.PEAR")
            return 240;
        
        if (_item == "DOGTREAT A")
            return 10000;
        
        if (_item == "DOGTREAT D")
            return 10000;
        
        if (_item == "DOGTREAT E")
            return 10000;
        
        if (_item == "ABYSSIDIAN")
            return 100000;
        
        if (_item == "DIAMOND")
            return 20000;
        
        if (_item == "RUBY")
            return 6000;
        
        if (_item == "EMERALD")
            return 2400;
        
        if (_item == "TOPAZ")
            return 1200;
        
        if (_item == "GOLD")
            return 800;
        
        if (_item == "SILVER")
            return 400;
        
        if (_item == "IRON ORE")
            return 200;
        
        if (_item == "k MINE")
            return 8000;
        
        if (_item == "k FOCUS")
            return 5000;
			
		if (_item == "APITEM")
            return o12__Game.area * o12__Game.area;
    }
    
    return 0;
}
