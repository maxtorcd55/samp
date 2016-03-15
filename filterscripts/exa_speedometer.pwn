// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>

new Text:SpeedoMeter[MAX_PLAYERS];


#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("--------------eXa Speedo--------------");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print("-------------eXa Speedo-----------");
	print("----------------------------------\n");
}

#endif

public OnPlayerConnect(playerid)
{

	SpeedoMeter[playerid] = TextDrawCreate(530.0,380.0, " ");
	TextDrawTextSize(SpeedoMeter[playerid], 620.0, 480.0);
	TextDrawLetterSize(SpeedoMeter[playerid],0.3,1.0);
	//TextDrawFont(SpeedoMeter[playerid], 1);
	//TextDrawTextSize(SpeedoMeter[playerid], 20.1, 20.1);
	TextDrawUseBox(SpeedoMeter[playerid], 1);
    TextDrawBoxColor(SpeedoMeter[playerid], 0x000000AA);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{


	return 1;
}

public OnPlayerSpawn(playerid)
{

	return 1;
}


public OnGameModeInit()
{
    SetTimer("SpeedoUpdate", 200, false);

    
    
	return 1;
}


new PlayerSpeedUpdate = 0;

forward SpeedoUpdate();
public SpeedoUpdate()
{

	if(IsPlayerConnected(PlayerSpeedUpdate))
	{
		new Float:speed_x, Float:speed_y, Float:speed_z;
  		if(GetVehicleVelocity(GetPlayerVehicleID(PlayerSpeedUpdate), speed_x, speed_y, speed_z))
  		{
			new speedstring[128];
			new PlayerSpeed = floatround(floatsqroot(((speed_x * speed_x) + (speed_y * speed_y)) + (speed_z * speed_z)) * 158.179, floatround_round);
			format(speedstring, sizeof(speedstring), "Speed: %3d km/h~n~",PlayerSpeed);
 		   	TextDrawSetString(SpeedoMeter[PlayerSpeedUpdate], speedstring);
			TextDrawShowForPlayer(PlayerSpeedUpdate, SpeedoMeter[PlayerSpeedUpdate]);
		}
		else
		{
  			TextDrawHideForPlayer(PlayerSpeedUpdate, SpeedoMeter[PlayerSpeedUpdate]);
		}

    }

    
    SetTimer("SpeedoUpdate", 100, false);
    return 1;
}



GetPlayersOnServer() {
	new count;
	for(new x=0; x< MAX_PLAYERS; x++) { //x = MAX_PLAYERS
	  if(IsPlayerConnected(x))) {
			count++;
		}
	}
	return count;
}



public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/leegcommando", cmdtext, true, 10) == 0)
	{

		return 1;
	}

	
	return 0;
}



