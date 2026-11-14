if (is_location_collected(location + 20))
    instance_destroy();

data[0] = o06__Game.parBotData[location][0];
data[1] = o06__Game.parBotData[location][1];
data[2] = o06__Game.parBotData[location][2];

myActivator = instance_place(x, y, o06_ParBotActivate);
