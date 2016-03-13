// This is a comment
// uncomment the line below if you want to write a filterscript


#include <a_samp>
#include <sscanf>
#include <a_http>
#include <exa>

forward GetPlayerCountry(index, response_code, data[]);



//#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

new ScriptVersion[12] = "2016/03/12";



main()
{
	printf("eXa Main - %s", ScriptVersion);
}


public OnGameModeInit()
{
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new plrIP[16];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
    SetPVarString(playerid,"ip",plrIP);
    
    new string[64];
	format(string,sizeof(string),"%s (%d) has joined the server. [%s]",GetPlyName(playerid),playerid,plrIP);
    SendClientMessage(playerid, 0x00FFFFAA, string);
	return 1;
}




public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}



public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[30], params[64];
	sscanf(cmdtext, "ss", cmd, params); //spits commando en parameters
	
	
	if((!strcmp("/v", cmd, true))||(!strcmp("/veh", cmd, true,3))) //vehicle spawnen cmd
	{
		new VehModel;
		new VehModelName[16];
		new VehColor[2] = {-1,-1};

		if(!sscanf(params, "sdd" ,VehModelName,VehColor[0],VehColor[1]) || !sscanf(params, "s" ,VehModelName))
		{
			new Modelid = strval(VehModelName);
			if(Modelid)
			{
                if((Modelid >= 400)&&(Modelid <= 611)){VehModel = Modelid;} //valid model ids
			}
			else
			{
				for(new i = 0; i < 211; i++)
				{
			 		if(strfind(VehName[i], VehModelName, true) != -1) //zoek vehicle naam in lijst
			 		{
						VehModel = i+400;
			 		}
				}
			}
		}
		else
		{
            SendClientMessage(playerid, 0xFF0000AA, "/veh <model>");
            return 1;
		}
		
		
		if(VehModel)
		{
		    //Spawn vehicle en put speler in voertuig
		 	new Float:x, Float:y, Float:z, Float: Angle;
	 		GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, Angle);
			new Veh = AddStaticVehicleEx(VehModel, x ,y ,z , Angle, VehColor[0], VehColor[1], 60*5);
			if(GetPlayerInterior(playerid)) LinkVehicleToInterior(Veh,GetPlayerInterior(playerid));
			SetVehicleVirtualWorld(Veh,GetPlayerVirtualWorld(playerid));
			PutPlayerInVehicle(playerid,Veh,0);
			
			new string[64];
			format(string,sizeof(string),"Vehicle spawned [%s]",VehName[VehModel-400]);
			SendClientMessage(playerid, 0x00FF00AA, string);
		}
		else
		{
		    SendClientMessage(playerid, 0xFF0000AA, "Vehicle not found!");
		}

		return 1;
	}
	
	
	if((!strcmp("/gametext", cmd, true)))
	{

		new ply, String[30], time, style;
		if(!sscanf(params, "usdd" ,ply,String,time,style))
		{

			GameTextForPlayer(ply, String, time, style); //toon gametext aan spayer
		}


		return 1;
	}
	
	
	if(!strcmp("/getvelocity", cmd, true))
	{
		new Float:vx,Float:vy,Float:vz;
 		GetVehicleVelocity(GetPlayerVehicleID(playerid),vx,vy,vz);
 		
 		new string[64];
		format(string,sizeof(string),"%.2f %.2f %.2f",vx,vy,vz);
		SendClientMessage(playerid, 0x00FF00AA, string); //toon player velocity
		return 1;
	}
	
	
	if(!strcmp("/restart", cmd, true))
	{
		printf("%h");
		return 1;
	}
	
	
	return 0;
}






public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if((oldstate == PLAYER_STATE_ONFOOT) && newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)//Player enter vehicle
    {
        new string[64];
		format(string,sizeof(string),"~n~~n~~n~~n~~n~~n~~n~~n~%s",VehName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
        GameTextForPlayer(playerid, string, 2000, 5);
    }

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)//is player rijder van voertuig
	{
		if(newkeys & KEY_FIRE) //LMB
		{
		    new Float:vx, Float:vy, Float:vz;
		    GetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, vz);

		    if (floatabs(vx) < 10 && floatabs(vy) < 10 && floatabs(vz) < 10)
		    {
		    	SetVehicleVelocity(GetPlayerVehicleID(playerid), vx * 1.2, vy * 1.2, vz * 1.2);
		    }
		    return 1;
		}
		else if (newkeys & KEY_CROUCH) //HORN
		{
		    new Float:vx, Float:vy, Float:vz;
		    GetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, vz);

		    if (floatabs(vx) < 10 && floatabs(vy) < 10 && floatabs(vz) < 10)
		    {
		    	SetVehicleVelocity(GetPlayerVehicleID(playerid), vx * 1.5, vy * 1.5, vz * 1.5);
		    }
		    return 1;
		}
	}

	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	/*
	//Maak dots op .html file
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	y = y*-1;
	y += 3000;
	x += 3000;
	new File:handle = fopen("point.html", io_write);
   	new string[512];
	format(string,sizeof(string),"<meta http-equiv=\"refresh\" content=\"5\" > <a href=\"#\" title=\"%s(%d)\"> <img src=\"dot.png\" style=\"position: absolute; top: %fpx; left: %fpx;\"> </a>",GetPlyName(playerid),playerid,(y/6000)*800-6,(x/6000)*800-6);
	fwrite(handle, string);
 	fclose(handle);
	*/


	new Float:vx,Float:vy,Float:vz;
 	GetVehicleVelocity(GetPlayerVehicleID(playerid),vx,vy,vz);


	SetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, vz * 1.2);



	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

stock GetPlyName(playerid)
{
	//return players name
	new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
	return name;
}
