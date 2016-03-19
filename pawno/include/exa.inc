stock VehName[213][] =
{
        {"Landstalker"},
        {"Bravura"},
        {"Buffalo"},
        {"Linerunner"},
        {"Perrenial"},
        {"Sentinel"},
        {"Dumper"},
        {"Firetruck"},
        {"Trashmaster"},
        {"Stretch"},
        {"Manana"},
        {"Infernus"},
        {"Voodoo"},
        {"Pony"},
        {"Mule"},
        {"Cheetah"},
        {"Ambulance"},
        {"Leviathan"},
        {"Moonbeam"},
        {"Esperanto"},
        {"Taxi"},
        {"Washington"},
        {"Bobcat"},
        {"Mr Whoopee"},
        {"BF Injection"},
        {"Hunter"},
        {"Premier"},
        {"Enforcer"},
        {"Securicar"},
        {"Banshee"},
        {"Predator"},
        {"Bus"},
        {"Rhino"},
        {"Barracks"},
        {"Hotknife"},
        {"Trailer 1"},
        {"Previon"},
        {"Coach"},
        {"Cabbie"},
        {"Stallion"},
        {"Rumpo"},
        {"RC Bandit"},
        {"Romero"},
        {"Packer"},
        {"Monster"},
        {"Admiral"},
        {"Squalo"},
        {"Seasparrow"},
        {"Pizzaboy"},
        {"Tram"},
        {"Trailer 2"},
        {"Turismo"},
        {"Speeder"},
        {"Reefer"},
        {"Tropic"},
        {"Flatbed"},
        {"Yankee"},
        {"Caddy"},
        {"Solair"},
        {"Berkley's RC Van"},
        {"Skimmer"},
        {"PCJ-600"},
        {"Faggio"},
        {"Freeway"},
        {"RC Baron"},
        {"RC Raider"},
        {"Glendale"},
        {"Oceanic"},
        {"Sanchez"},
        {"Sparrow"},
        {"Patriot"},
        {"Quad"},
        {"Coastguard"},
        {"Dinghy"},
        {"Hermes"},
        {"Sabre"},
        {"Rustler"},
        {"ZR-350"},
        {"Walton"},
        {"Regina"},
        {"Comet"},
        {"BMX"},
        {"Burrito"},
        {"Camper"},
        {"Marquis"},
        {"Baggage"},
        {"Dozer"},
        {"Maverick"},
        {"News Chopper"},
        {"Rancher"},
        {"FBI Rancher"},
        {"Virgo"},
        {"Greenwood"},
        {"Jetmax"},
        {"Hotring"},
        {"Sandking"},
        {"Blista Compact"},
        {"Police Maverick"},
        {"Boxville"},
        {"Benson"},
        {"Mesa"},
        {"RC Goblin"},
        {"Hotring Racer A"},
        {"Hotring Racer B"},
        {"Bloodring Banger"},
        {"Rancher"},
        {"Super GT"},
        {"Elegant"},
        {"Journey"},
        {"Bike"},
        {"Mountain Bike"},
        {"Beagle"},
        {"Cropdust"},
        {"Stunt"},
        {"Tanker"},
        {"Roadtrain"},
        {"Nebula"},
        {"Majestic"},
        {"Buccaneer"},
        {"Shamal"},
        {"Hydra"},
        {"FCR-900"},
        {"NRG-500"},
        {"HPV1000"},
        {"Cement Truck"},
        {"Tow Truck"},
        {"Fortune"},
        {"Cadrona"},
        {"FBI Truck"},
        {"Willard"},
        {"Forklift"},
        {"Tractor"},
        {"Combine"},
        {"Feltzer"},
        {"Remington"},
        {"Slamvan"},
        {"Blade"},
        {"Freight"},
        {"Streak"},
        {"Vortex"},
        {"Vincent"},
        {"Bullet"},
        {"Clover"},
        {"Sadler"},
        {"Firetruck LA"},
        {"Hustler"},
        {"Intruder"},
        {"Primo"},
        {"Cargobob"},
        {"Tampa"},
        {"Sunrise"},
        {"Merit"},
        {"Utility"},
        {"Nevada"},
        {"Yosemite"},
        {"Windsor"},
        {"Monster A"},
        {"Monster B"},
        {"Uranus"},
        {"Jester"},
        {"Sultan"},
        {"Stratum"},
        {"Elegy"},
        {"Raindance"},
        {"RC Tiger"},
        {"Flash"},
        {"Tahoma"},
        {"Savanna"},
        {"Bandito"},
        {"Freight Flat"},
        {"Streak Carriage"},
        {"Kart"},
        {"Mower"},
        {"Duneride"},
        {"Sweeper"},
        {"Broadway"},
        {"Tornado"},
        {"AT-400"},
        {"DFT-30"},
        {"Huntley"},
        {"Stafford"},
        {"BF-400"},
        {"Newsvan"},
        {"Tug"},
        {"Trailer 3"},
        {"Emperor"},
        {"Wayfarer"},
        {"Euros"},
        {"Hotdog"},
        {"Club"},
        {"Freight Carriage"},
        {"Trailer 3"},
        {"Andromada"},
        {"Dodo"},
        {"RC Cam"},
        {"Launch"},
        {"Police Car (LSPD)"},
        {"Police Car (SFPD)"},
        {"Police Car (LVPD)"},
        {"Police Ranger"},
        {"Picador"},
        {"S.W.A.T. Van"},
        {"Alpha"},
        {"Phoenix"},
        {"Glendale"},
        {"Sadler"},
        {"Luggage Trailer A"},
        {"Luggage Trailer B"},
        {"Stair Trailer"},
        {"Boxville"},
        {"Farm Plow"},
        {"Utility Trailer"},
        {""}
};



stock decode_lights(lights, &light1, &light2, &light3, &light4)
{
    light1 = lights & 1;
    light2 = lights >> 1 & 1;
    light3 = lights >> 2 & 1;
    light4 = lights >> 3 & 1;
}
 
stock decode_panels(panels, &front_bumper, &rear_bumper)
{
    front_bumper= panels >> 20 & 15;
    rear_bumper = panels >> 24 & 15;
}
 
stock decode_doors(doors, &bonnet, &boot, &driver_door, &passenger_door)
{
    bonnet = doors & 7;
    boot = doors >> 8 & 7;
    driver_door = doors >> 16 & 7;
    passenger_door = doors >> 24 & 7;
}
 
stock decode_tires(tires, &tire1, &tire2, &tire3, &tire4)
{
    tire1 = tires & 1;
    tire2 = tires >> 1 & 1;
    tire3 = tires >> 2 & 1;
    tire4 = tires >> 3 & 1;
}
 
stock encode_tires(tire1, tire2, tire3, tire4)
{
	return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);
}
 
stock encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
    return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}
 
stock encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}
 
stock encode_lights(light1, light2, light3, light4)
{
    return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}