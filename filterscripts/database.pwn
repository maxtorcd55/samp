// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>

new DB: someDB;

public OnFilterScriptInit()
{
	print("DataBase");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}


public OnGameModeInit()
{
    someDB = db_open("your.db");
	return 1;
}

public OnGameModeExit()
{
	return 1;
}


public OnPlayerConnect(playerid)
{
	new szQuery[109], szPlayerName[MAX_PLAYER_NAME];

	GetPlayerName(playerid, szPlayerName, MAX_PLAYER_NAME);
	format(szQuery, sizeof(szQuery), "update `players` set `Motto` = '%q' where `playername` = '%s'","hjh", szPlayerName);
	db_free_result(db_query(someDB, szQuery));
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}


public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/save", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

