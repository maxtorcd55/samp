// This is a comment
// uncomment the line below if you want to write a filterscript


#include <a_samp>
#include <sscanf>
#include <a_http>
#include <exa>

forward GetPlayerLoc(index, response_code, data[]);

#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

new Float:Speedlimit;


main()
{
	printf("eXa Main - 2016/03/12");
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
    
    
   	new url[64];
	format(url,sizeof(url),"formexa.comxa.com/loc.php?ip=%s",plrIP);
    HTTP(playerid, HTTP_GET, url, "", "GetPlayerLoc");
    
    new string[64];
	format(string,sizeof(string),"%s (%d) has joined the server. [%s]",GetPlyName(playerid),playerid,plrIP);
    //SendClientMessage(playerid, 0x00FFFFAA, string);
    
    SendDeathMessage(-1, playerid, 200);
	return 1;
}


public GetPlayerLoc(index, response_code, data[])
{
    new string[128];
    if(response_code == 200) //Did the request succeed?
    {
        
		format(string,sizeof(string),"%s (%d) has joined the server. [%s]",GetPlyName(index),index,data);
    	
    }
    else
    {
        format(string,sizeof(string),"%s (%d) has joined the server.",GetPlyName(index),index);
    }
    
    SendClientMessageToAll(0x00FFFFAA, string);
}


public OnPlayerDisconnect(playerid, reason)
{
    SendDeathMessage(-1, playerid, 201);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SendDeathMessage(killerid, playerid, reason);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
    DestroyVehicle(vehicleid);
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
			if(GetPlayerVehicleSeat(playerid) == 0){DestroyVehicle(GetPlayerVehicleID(playerid));}
			new Veh = AddStaticVehicleEx(VehModel, x ,y ,z , Angle, VehColor[0], VehColor[1], 60);
			if(GetPlayerInterior(playerid)) LinkVehicleToInterior(Veh,GetPlayerInterior(playerid));
			SetVehicleVirtualWorld(Veh,GetPlayerVirtualWorld(playerid));
			PutPlayerInVehicle(playerid,Veh,0);
			SetVehicleHealth(Veh, 9999999999);
			
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
	

	
	if(!strcmp("/getvelocity", cmd, true))
	{
		new Float:vx,Float:vy,Float:vz;
 		GetVehicleVelocity(GetPlayerVehicleID(playerid),vx,vy,vz);
 		
 		new string[64];
		format(string,sizeof(string),"x: %.2f, y: %.2f, Z: %.2f",vx,vy,vz);
		SendClientMessage(playerid, 0x00FF00AA, string); //toon player velocity
		return 1;
	}
	
	
	if(!strcmp("/getvehicleid", cmd, true))
	{
 		new string[64];
		format(string,sizeof(string),"Vehicle id: %d",GetPlayerVehicleID(playerid));
		SendClientMessage(playerid, 0x00FF00AA, string); //toon player vehid
		return 1;
	}
	
	if(!strcmp("/restart", cmd, true))
	{
	    SendClientMessageToAll(0xFF00FFAA, "Server restarting");
		new string[2500];
		for(new i = 0; i < 200; i++)
		{
		    format(string,sizeof(string),"%sAAAAAAAAAAA",string);
		}
		
		printf(string);
		return 1;
	}
	
	if(!strcmp("/kill", cmd, true))
	{
	    new ply;
	    if(!strlen(params)){SetPlayerHealth(playerid,0.0);}
		else if(!sscanf(params, "u" ,ply))
		{
		    if(IsPlayerConnected(ply))
		    {
				SetPlayerHealth(ply,0.0);
				new string[64];
				format(string,sizeof(string),"Player %s (%d) is killed",GetPlyName(ply),ply);
				SendClientMessage(playerid, 0x00FF00AA, string);
			}
			else
			{
			    SendClientMessage(playerid, 0xFF0000AA, "Player is not connected!");
			}
  		}
  		else
  		{
  		    SendClientMessage(playerid, 0xFF0000AA, "/kill <name/id>");
  		}
		return 1;
	}
	
	
	if(!strcmp("/changeveh", cmd, true))
	{
	    new veh;
	    new ply;
		if(!sscanf(params, "ud" ,ply,veh))
		{
 			new Float:vx, Float:vy, Float:vz;
		 	GetVehicleVelocity(GetPlayerVehicleID(ply), vx, vy, vz);
			new Float:x, Float:y, Float:z, Float: Angle;
	 		GetVehiclePos(GetPlayerVehicleID(ply), x, y, z);
			GetVehicleZAngle(GetPlayerVehicleID(ply), Angle);
			DestroyVehicle(GetPlayerVehicleID(ply));
			new Veh = AddStaticVehicleEx(veh, x ,y ,z+1 , Angle, -1, -1, 60*5);
			if(GetPlayerInterior(ply)) LinkVehicleToInterior(Veh,GetPlayerInterior(ply));
			SetVehicleVirtualWorld(Veh,GetPlayerVirtualWorld(ply));
			PutPlayerInVehicle(ply,Veh,0);
			PutPlayerInVehicle(playerid,Veh,1);
			SetVehicleVelocity(Veh, vx, vy, vz);
  		}
		return 1;
	}
	
	
	if(!strcmp("/goto", cmd, true))
	{
	    new ply;
	    if(!sscanf(params, "u" ,ply))
		{
		    if(IsPlayerConnected(ply))
		    {
				new Float:x, Float:y, Float:z;
	 			GetPlayerPos(ply, x, y, z);
	 			SetPlayerPos(playerid, x, y, z);
			}
			else
			{
			    SendClientMessage(playerid, 0xFF0000AA, "Player is not connected!");
			}
  		}
  		else
  		{
  		    SendClientMessage(playerid, 0xFF0000AA, "/goto <name/id>");
  		}
		return 1;
	}
	
	
	if(!strcmp("/speedlimit", cmd, true))
	{
	    new Float:speed;
	    if(!sscanf(params, "f" ,speed) && (speed >= 0 && speed <= 5))
		{
            Speedlimit = speed;
            
            new string[64];
            if(floatround(Speedlimit, floatround_ceil) != 0)
			{
			
				format(string,sizeof(string),"Vehicle speedlimit is set to: %.3f",Speedlimit);
			}
			else
			{
			    string = "Vehicle speedlimit is off";
			}
            SendClientMessage(playerid, 0x00FF00AA, string);
  		}
  		else
  		{
  		    SendClientMessage(playerid, 0xFF0000AA, "/speedlimit <0.0-5.0>");
  		}
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
	
	
	
	if(floatround(Speedlimit, floatround_ceil) != 0)
	{
	 	static s_iVehicle;

		if(GetPlayerState( playerid ) == PLAYER_STATE_DRIVER )
		{
			s_iVehicle = GetPlayerVehicleID( playerid );

			if ( s_iVehicle )
			{
				static
					Float:s_fX,
					Float:s_fY,
					Float:s_fZ,
					Float:s_fVX,
					Float:s_fVY,
					Float:s_fVZ
				;

				GetVehiclePos( s_iVehicle, s_fX, s_fY, s_fZ );
				GetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );

				if ( !IsPlayerInRangeOfPoint( playerid, Speedlimit+0.05, s_fX + s_fVX, s_fY + s_fVY, s_fZ + s_fVZ ) )
				{
					static Float:s_fLength;

					s_fLength = floatsqroot( ( s_fVX * s_fVX ) + ( s_fVY * s_fVY ) + ( s_fVZ * s_fVZ ) );

					s_fVX = ( s_fVX / s_fLength ) * Speedlimit;
					s_fVY = ( s_fVY / s_fLength ) * Speedlimit;
					s_fVZ = ( s_fVZ / s_fLength ) * Speedlimit;

					if ( s_iVehicle )
						SetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );
					else
						SetPlayerVelocity( playerid, s_fVX, s_fVY, s_fVZ );
				}
			}
		}
	}
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
