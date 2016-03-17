// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>

new Text:SpeedoMeter[MAX_PLAYERS];

new PlayerOnlineID[MAX_PLAYERS];
new PlayersOnline;

new PlayerOldSpeed[MAX_PLAYERS];

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
    
    PlayersOnline++;
   	new count;
	for(new x=0; x< MAX_PLAYERS; x++)
	{
		if(IsPlayerConnected(x))
		{
			if(!IsPlayerNPC(x))
    		{
	        	PlayerOnlineID[count] = x;
				count++;
			}
		}
	}
    
	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
    PlayersOnline--;
   	new count;
	for(new x=0; x< MAX_PLAYERS; x++)
	{
		if(IsPlayerConnected(x))
		{
			if(!IsPlayerNPC(x))
    		{
	        	PlayerOnlineID[count] = x;
				count++;
			}
		}
	}

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


forward SpeedoUpdate();
public SpeedoUpdate()
{
	for(new i; i<MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i))
		{

            new Float:speed_x, Float:speed_y, Float:speed_z;
            if(IsPlayerInAnyVehicle(i))
            {
            	GetVehicleVelocity(GetPlayerVehicleID(i), speed_x, speed_y, speed_z);
			    new speedstring[128];
			    new Float:cor_x, Float:cor_y, Float:cor_z;
				GetPlayerPos(i,cor_x, cor_y, cor_z);
				new PlayerSpeed = floatround(floatsqroot(((speed_x * speed_x) + (speed_y * speed_y)) + (speed_z * speed_z)) * 158.179, floatround_round);
	  			format(speedstring, sizeof(speedstring), "Speed: %3d km/h~n~Height: %.2f",PlayerSpeed,cor_z);
	    		TextDrawSetString(SpeedoMeter[i], speedstring);
	    		TextDrawShowForPlayer(i, SpeedoMeter[i]);
	    		
	    		

				if(PlayerOldSpeed[i] >= PlayerSpeed+75)
				{
				 	new Float:health;
	   			 	GetPlayerHealth(i,health);
				    SetPlayerHealth(i, health-(PlayerSpeed));
				}
				PlayerOldSpeed[i] = PlayerSpeed;

				}
				else
				{
				    TextDrawHideForPlayer(i, SpeedoMeter[i]);
				}



		}
    }



    SetTimer("SpeedoUpdate", floatround(200+(PlayersOnline*70), floatround_round), false);

    return 1;
}





public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/leegcommando", cmdtext, true, 10) == 0)
	{

		return 1;
	}

	
	return 0;
}



