// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>

#define MaxPlayers 25

new PlyObjectLoaded[MaxPlayers];
new TotalPlayerCount;
new Float:LastCorObject[4];


#define Max_Objects 70000
#define Max_Int 2147483647
#define Max_Streamed_Objects 800

enum Object_Info
{
	Model,

	Float:ox,Float:oy,Float:oz,
	Float:orx,Float:ory,Float:orz,


}
new Object[Max_Objects][Object_Info];

enum Object_Player_Info
{
	ID,
	Streamed,
}
new PlyObject[MaxPlayers][Object_Player_Info][Max_Objects];
new LastObjID = 0;

new ObjectDis[Max_Objects];
new TempSortObj[Max_Objects];

new PlyObjDnsDis[MaxPlayers];

new moveobjects;





enum History_Info
{
	Float:hisx,
	Float:hisy,
	Float:hisz,
}
new History[MaxPlayers][History_Info];


#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n---------------------------------------");
	print("--------------eXa Streamer-------------");
	print("---------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{

}

#endif

stock CreateStreamObject(ModelID, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ/*, Float:Dist = 100.0*/)
{

	//MTA(SAMP) OBJECTS ID CONVERTER


    if(ModelID == 4248){ModelID=18643;}
    else if(ModelID == 4249){ModelID=18646;}
    else if((ModelID >= 4250)&&(ModelID <= 4255)){ModelID=ModelID+14397;}
    else if((ModelID >= 4261)&&(ModelID <= 4268)){ModelID=ModelID+14490;}
    else if((ModelID >= 4269)&&(ModelID <= 4274)){ModelID=ModelID+14493;}
    else if((ModelID >= 4275)&&(ModelID <= 4278)){ModelID=ModelID+14497;}
    else if((ModelID >= 4280)&&(ModelID <= 4281)){ModelID=ModelID+14496;}
    else if(ModelID == 4283){ModelID=18783;}
    else if((ModelID >= 4284)&&(ModelID <= 4341)){ModelID=ModelID+14504;}
    else if(ModelID == 4342){ModelID=18847;}
    else if((ModelID >= 4343)&&(ModelID <= 4347)){ModelID=ModelID+14508;}
    else if(ModelID == 4348){ModelID=18863;}
    else if(ModelID == 4349){ModelID=18864;}
    else if(ModelID == 4350){ModelID=18876;}
    else if((ModelID >= 4351)&&(ModelID <= 4353)){ModelID=ModelID+14531;}
    else if((ModelID >= 4354)&&(ModelID <= 4374)){ModelID=ModelID+14626;}
    else if(ModelID == 4535){ModelID=19005;}



    LastObjID++;
    Object[LastObjID][Model] = ModelID;
    Object[LastObjID][ox] = X;
    Object[LastObjID][oy] = Y;
    Object[LastObjID][oz] = Z;

    Object[LastObjID][orx] = rX;
    Object[LastObjID][ory] = rY;
    Object[LastObjID][orz] = rZ;



}

public OnPlayerRequestClass(playerid, classid)
{


	return 1;
}

public OnPlayerSpawn(playerid)
{

	return 1;
}

public OnPlayerConnect(playerid)
{

	for(new Obj; Obj<=LastObjID; Obj++)
	{
 		StreamOutObject(playerid, Obj);
	}





    PlyObjectLoaded[playerid]=0;
    TotalPlayerCount++;

	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
	TotalPlayerCount--;
	return 1;
}


public OnGameModeInit()
{
    SetTimer("Streamer", 1000, true); //ObjectStreamer Timer


	//stunts

	
    khup(LastCorObject[0],LastCorObject[1],LastCorObject[2]);
    khup1(LastCorObject[0],LastCorObject[1],LastCorObject[2]);
    khup1(LastCorObject[0],LastCorObject[1],LastCorObject[2]);
    khup2(LastCorObject[0],LastCorObject[1],LastCorObject[2]);
    khup1(LastCorObject[0],LastCorObject[1],LastCorObject[2]);
    khup2(LastCorObject[0],LastCorObject[1],LastCorObject[2]);






	//Glijbaan
   	for(new i; i<305; i++)
    {
        CreateStreamObject(18449,1800.0,1343.0+(i*69.2),15.0+(i*39.95),0.0000000,30.0000000+180,270.0000000);
	}

	//snelheidbaan
   	for(new i; i<305; i++)
    {
        CreateStreamObject(18449,-3000.0-(i*80.0),700.0,10,0.0000000,0,0);
	}

	moveobjects = CreateObject(18449,-3000.0,700.0,10,0.0000000,0,0);


	//Potjes
	//for(new i; i<100;i++){for(new j; j<100;j++){CreateStreamObject(1337,2040.0+(i*1),1320.0+(j*1),15,0,0,0);}}


	//Stad
   	for(new i; i<5; i++)
    {
   		for(new j; j<5; j++)
	    {
	        CreateCity(1958.0+(i*160),1343.0+(j*240),0.0);
		}
	}


	//Racebaan
	CreateStreamObject(4841,2007.1904000,-3143.5996000,14.1200000,0.0000000,0.0000000,0.0000000); //Object number 0
	CreateStreamObject(4841,2094.8203000,-2906.2803000,14.1100000,0.0000000,0.0000000,179.9950000); //Object number 1
	CreateStreamObject(4841,2275.8896000,-2848.8604000,14.1000000,0.0000000,0.0000000,89.9950000); //Object number 2
	CreateStreamObject(4841,2333.2998000,-3029.9297000,14.1000000,0.0000000,0.0000000,359.9950000); //Object number 3
	CreateStreamObject(4841,2208.4099000,-3232.4199000,14.1200000,0.0000000,0.0000000,179.9890000); //Object number 4
	CreateStreamObject(4841,2120.7197000,-3469.7803000,14.1200000,0.0000000,0.0000000,359.9840000); //Object number 5
	CreateStreamObject(4841,1939.5601000,-3527.1201000,14.1200000,0.0000000,0.0000000,269.9780000); //Object number 6
	CreateStreamObject(4841,1882.2600000,-3346.0801000,14.1200000,0.0000000,0.0000000,179.9780000); //Object number 7
	CreateStreamObject(1225,1823.8300000,-3438.0701000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 8
	CreateStreamObject(1225,1822.0400000,-3437.9600000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 9
	CreateStreamObject(1225,2031.0900000,-3587.1799000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 10
	CreateStreamObject(1225,2031.1000000,-3585.3601000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 11
	CreateStreamObject(1225,2180.7200000,-3378.1101000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 12
	CreateStreamObject(1225,2148.3000000,-3302.6599000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 13
	CreateStreamObject(1225,2147.9600000,-3324.3401000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 14
	CreateStreamObject(1225,2393.3899000,-2938.2600000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 15
	CreateStreamObject(1225,2178.5400000,-3378.3000000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 16
	CreateStreamObject(1225,2034.6300000,-2997.8601000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 17
	CreateStreamObject(1225,2184.4700000,-2788.6799000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 18
	CreateStreamObject(1225,2391.6001000,-2938.2400000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 19
	CreateStreamObject(1225,2184.4700000,-2790.6799000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 20
	CreateStreamObject(1225,2036.5300000,-2997.8000000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 21
	CreateStreamObject(1225,2065.3999000,-3073.6201000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 22
	CreateStreamObject(1225,2067.2600000,-3073.6201000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 23
	CreateStreamObject(17002,2196.1001000,-2805.1001000,14.6000000,0.0000000,0.0000000,180.0000000); //Object number 24
	CreateStreamObject(17002,1838.4004000,-3427.7998000,14.7000000,0.0000000,0.0000000,270.0000000); //Object number 25
	CreateStreamObject(17002,2020.7000000,-3570.8601000,14.8000000,0.0000000,0.0000000,179.9950000); //Object number 26
	CreateStreamObject(17002,2051.0100000,-3062.8999000,14.8000000,0.0000000,0.0000000,90.0000000); //Object number 27
	CreateStreamObject(17002,2164.0000000,-3390.6001000,14.4000000,0.0000000,0.0000000,270.0000000); //Object number 28
	CreateStreamObject(17002,2377.0901000,-2950.1001000,14.9000000,0.0000000,0.0000000,270.0000000); //Object number 29
	CreateStreamObject(17002,2051.0100000,-2987.1101000,14.8000000,0.0000000,0.0000000,89.9950000); //Object number 30
	CreateStreamObject(17002,2164.2200000,-3313.8000000,14.6000000,0.0000000,0.0000000,270.0000000); //Object number 31
	CreateStreamObject(3675,2179.2500000,-3351.1001000,10.0600000,270.0000000,0.0000000,270.0000000); //Object number 32
	CreateStreamObject(3675,2170.6399000,-3351.1001000,10.0600000,270.0000000,0.0000000,270.0000000); //Object number 33
	CreateStreamObject(3675,2162.0801000,-3351.1001000,10.0600000,270.0000000,0.0000000,270.0000000); //Object number 34
	CreateStreamObject(3675,2153.4600000,-3351.1001000,10.0600000,270.0000000,0.0000000,270.0000000); //Object number 35
	CreateStreamObject(1225,2149.8203000,-3302.5996000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 36
	CreateStreamObject(1225,2149.6699000,-3324.3401000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 37
	CreateStreamObject(1225,2178.5400000,-3399.9900000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 38
	CreateStreamObject(1225,2180.5400000,-3399.9900000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 39
	CreateStreamObject(1225,2009.4100000,-3585.3601000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 40
	CreateStreamObject(1225,2009.4100000,-3587.2100000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 41
	CreateStreamObject(1225,1822.0400000,-3415.8401000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 42
	CreateStreamObject(1225,1824.0400000,-3415.8401000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 43
	CreateStreamObject(1225,2067.2600000,-3051.5000000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 44
	CreateStreamObject(1225,2065.4099000,-3051.5000000,11.7400000,0.0000000,0.0000000,0.0000000); //Object number 45
	CreateStreamObject(1225,2034.6300000,-2976.1699000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 46
	CreateStreamObject(1225,2036.7700000,-2976.1699000,11.7000000,0.0000000,0.0000000,0.0000000); //Object number 47
	CreateStreamObject(1245,2036.6200000,-3003.3601000,12.7600000,0.0000000,0.0000000,270.0000000); //Object number 48
	CreateStreamObject(1245,2034.6201000,-2971.9600000,12.7600000,0.0000000,0.0000000,90.0000000); //Object number 49
	CreateStreamObject(1245,2065.3101000,-3047.3201000,12.7600000,0.0000000,0.0000000,90.0000000); //Object number 50
	CreateStreamObject(1245,2067.4500000,-3077.5801000,12.7600000,0.0000000,0.0000000,270.0000000); //Object number 51
	CreateStreamObject(16110,2259.8000000,-2778.6001000,10.9000000,0.0000000,0.0000000,264.0000000); //Object number 52
	CreateStreamObject(16113,2362.6001000,-2804.3000000,5.4000000,0.0000000,0.0000000,178.0000000); //Object number 53
	CreateStreamObject(16114,2395.8999000,-2841.7000000,0.0000000,0.0000000,0.0000000,236.0000000); //Object number 54
	CreateStreamObject(16115,2334.4700000,-2871.1001000,14.0000000,0.0000000,0.0000000,123.9970000); //Object number 55
	CreateStreamObject(16116,2327.3999000,-2784.1001000,4.6000000,0.0000000,0.0000000,190.0000000); //Object number 56
	CreateStreamObject(16118,2402.8000000,-2879.7000000,6.3000000,0.0000000,0.0000000,188.0000000); //Object number 57
	CreateStreamObject(16120,2407.3000000,-2943.3000000,2.1000000,0.0000000,0.0000000,146.0000000); //Object number 58
	CreateStreamObject(16121,2403.3999000,-2985.3000000,8.5000000,0.0000000,0.0000000,340.0000000); //Object number 59
	CreateStreamObject(16122,2310.2000000,-3082.3999000,-0.5000000,0.0000000,0.0000000,336.0000000); //Object number 60
	CreateStreamObject(16114,2243.3000000,-2776.0000000,2.3000000,0.0000000,0.0000000,277.9970000); //Object number 61
	CreateStreamObject(16120,2202.2000000,-2777.5000000,1.8000000,0.0000000,0.0000000,227.9970000); //Object number 62
	CreateStreamObject(16121,2351.1006000,-3013.5000000,8.5000000,0.0000000,0.0000000,159.9940000); //Object number 63
	CreateStreamObject(16118,2351.3000000,-2959.5000000,6.3000000,0.0000000,0.0000000,357.9980000); //Object number 64
	CreateStreamObject(16114,2347.8999000,-2911.3000000,0.0000000,0.0000000,0.0000000,17.9970000); //Object number 65
	CreateStreamObject(16116,2410.6001000,-3043.1001000,4.6000000,0.0000000,0.0000000,131.9980000); //Object number 66
	CreateStreamObject(16118,2395.5000000,-3070.8999000,6.3000000,0.0000000,0.0000000,155.9980000); //Object number 67
	CreateStreamObject(16110,2304.8999000,-3096.0000000,10.9000000,0.0000000,0.0000000,293.9960000); //Object number 68
	CreateStreamObject(16110,2373.4004000,-3108.5996000,10.9000000,0.0000000,0.0000000,133.9890000); //Object number 69
	CreateStreamObject(16114,2193.1001000,-3321.5000000,2.6800000,0.0000000,0.0000000,187.9960000); //Object number 70
	CreateStreamObject(16116,2280.6006000,-3164.7002000,4.6000000,0.0000000,0.0000000,47.9940000); //Object number 71
	CreateStreamObject(16116,2412.3999000,-2868.1001000,4.6000000,0.0000000,0.0000000,189.9980000); //Object number 72
	CreateStreamObject(16110,2263.1001000,-2832.3999000,10.9000000,0.0000000,0.0000000,79.9960000); //Object number 73
	CreateStreamObject(16120,2199.5000000,-2832.1001000,1.8000000,0.0000000,0.0000000,47.9940000); //Object number 74
	CreateStreamObject(16113,2153.8999000,-2840.3999000,5.4000000,0.0000000,0.0000000,45.9950000); //Object number 75
	CreateStreamObject(16113,2157.1001000,-2777.3999000,2.7000000,0.0000000,0.0000000,215.9950000); //Object number 76
	CreateStreamObject(16120,2407.3000000,-2913.5000000,2.1000000,0.0000000,0.0000000,145.9970000); //Object number 77
	CreateStreamObject(16116,2112.8000000,-2780.8000000,4.6000000,0.0000000,0.0000000,239.9980000); //Object number 78
	CreateStreamObject(16120,2079.0000000,-2804.0000000,1.8000000,0.0000000,0.0000000,265.9940000); //Object number 79
	CreateStreamObject(16110,2129.0000000,-2837.3999000,10.9000000,0.0000000,0.0000000,111.9910000); //Object number 80
	CreateStreamObject(16120,2047.2000000,-2836.0000000,1.8000000,0.0000000,0.0000000,289.9940000); //Object number 81
	CreateStreamObject(16116,2026.1000000,-2868.1001000,4.6000000,0.0000000,0.0000000,291.9960000); //Object number 82
	CreateStreamObject(16120,2086.8999000,-2880.0000000,1.8000000,0.0000000,0.0000000,111.9880000); //Object number 83
	CreateStreamObject(16113,2085.9004000,-2926.2998000,5.4000000,0.0000000,0.0000000,133.9890000); //Object number 84
	CreateStreamObject(16120,2077.8899000,-2974.8000000,1.8000000,0.0000000,0.0000000,137.9830000); //Object number 85
	CreateStreamObject(16113,2017.1200000,-2910.8999000,5.4000000,0.0000000,0.0000000,309.9850000); //Object number 86
	CreateStreamObject(16113,2016.7000000,-2955.0000000,5.4000000,0.0000000,0.0000000,309.9850000); //Object number 87
	CreateStreamObject(16116,2022.6000000,-2995.7000000,4.6000000,0.0000000,0.0000000,293.9950000); //Object number 88
	CreateStreamObject(16110,2076.8501000,-3002.8999000,10.9000000,0.0000000,0.0000000,175.9900000); //Object number 89
	CreateStreamObject(16115,2219.7002000,-3182.2998000,14.0000000,0.0000000,0.0000000,223.9950000); //Object number 90
	CreateStreamObject(16115,1994.7000000,-3193.3000000,13.5000000,0.0000000,0.0000000,43.9950000); //Object number 91
	CreateStreamObject(16113,2016.9000000,-3042.8000000,5.4000000,0.0000000,0.0000000,311.9850000); //Object number 92
	CreateStreamObject(16116,2018.7900000,-3088.2000000,4.6000000,0.0000000,0.0000000,307.9910000); //Object number 93
	CreateStreamObject(16114,2275.7000000,-3102.3999000,0.0000000,0.0000000,0.0000000,287.9960000); //Object number 94
	CreateStreamObject(16118,2220.3101000,-3114.8799000,6.3000000,0.0000000,0.0000000,293.9900000); //Object number 95
	CreateStreamObject(16114,2185.2002000,-3135.7998000,0.0000000,0.0000000,0.0000000,319.9930000); //Object number 96
	CreateStreamObject(16118,2150.4004000,-3183.5000000,6.3000000,0.0000000,0.0000000,327.9860000); //Object number 97
	CreateStreamObject(16120,2077.8999000,-3064.2000000,1.8000000,0.0000000,0.0000000,137.9830000); //Object number 98
	CreateStreamObject(16110,2076.9600000,-3096.3000000,10.9000000,0.0000000,0.0000000,175.9900000); //Object number 99
	CreateStreamObject(16113,2083.2002000,-3161.0996000,5.4000000,0.0000000,0.0000000,125.9860000); //Object number 100
	CreateStreamObject(16120,2060.1001000,-3203.2000000,1.8000000,0.0000000,0.0000000,109.9830000); //Object number 101
	CreateStreamObject(16118,2032.4301000,-3237.5100000,6.3000000,0.0000000,0.0000000,129.9840000); //Object number 102
	CreateStreamObject(16120,1985.5000000,-3268.3000000,1.8000000,0.0000000,0.0000000,79.9790000); //Object number 103
	CreateStreamObject(16120,1958.0000000,-3216.1001000,1.8000000,0.0000000,0.0000000,67.9750000); //Object number 104
	CreateStreamObject(16120,1911.7000000,-3221.6001000,1.8000000,0.0000000,0.0000000,53.9720000); //Object number 105
	CreateStreamObject(16118,1946.7000000,-3271.1001000,6.3000000,0.0000000,0.0000000,91.9840000); //Object number 106
	CreateStreamObject(16118,1902.1000000,-3285.6001000,6.3000000,0.0000000,0.0000000,121.9830000); //Object number 107
	CreateStreamObject(16120,1870.4004000,-3328.3994000,1.8000000,0.0000000,0.0000000,117.9710000); //Object number 108
	CreateStreamObject(16120,1871.7000000,-3240.1001000,1.8000000,0.0000000,0.0000000,77.9720000); //Object number 109
	CreateStreamObject(16116,1839.0000000,-3261.5000000,4.6000000,0.0000000,0.0000000,263.9910000); //Object number 110
	CreateStreamObject(16116,1816.0996000,-3297.5000000,4.6000000,0.0000000,0.0000000,275.9880000); //Object number 111
	CreateStreamObject(16118,1865.0000000,-3361.3999000,6.3000000,0.0000000,0.0000000,173.9810000); //Object number 112
	CreateStreamObject(16118,1865.0000000,-3411.8999000,6.3000000,0.0000000,0.0000000,173.9790000); //Object number 113
	CreateStreamObject(16118,1812.2002000,-3359.5996000,6.3000000,0.0000000,0.0000000,357.9790000); //Object number 114
	CreateStreamObject(1225,2393.3899000,-2960.3799000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 115
	CreateStreamObject(1225,2391.5400000,-2960.3799000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 116
	CreateStreamObject(16120,1866.9000000,-3471.2000000,1.8000000,0.0000000,0.0000000,141.9710000); //Object number 117
	CreateStreamObject(16118,2137.1299000,-3234.4500000,6.3000000,0.0000000,0.0000000,353.9860000); //Object number 118
	CreateStreamObject(16118,1812.2000000,-3405.6001000,6.3000000,0.0000000,0.0000000,357.9790000); //Object number 119
	CreateStreamObject(16116,1809.6000000,-3437.5000000,4.6000000,0.0000000,0.0000000,297.9880000); //Object number 120
	CreateStreamObject(16114,2135.9500000,-3275.2300000,0.0000000,0.0000000,0.0000000,3.9930000); //Object number 121
	CreateStreamObject(16113,1887.7000000,-3507.3000000,5.4000000,0.0000000,0.0000000,163.9860000); //Object number 122
	CreateStreamObject(16121,2138.1499000,-3376.1699000,8.5000000,0.0000000,0.0000000,161.9940000); //Object number 123
	CreateStreamObject(16114,2135.9500000,-3319.9099000,0.0000000,0.0000000,0.0000000,3.9880000); //Object number 124
	CreateStreamObject(16120,1923.4000000,-3539.1001000,1.8000000,0.0000000,0.0000000,209.9710000); //Object number 125
	CreateStreamObject(16113,1806.7000000,-3484.8999000,5.4000000,0.0000000,0.0000000,321.9820000); //Object number 126
	CreateStreamObject(16118,2137.1299000,-3429.7000000,6.3000000,0.0000000,0.0000000,353.9850000); //Object number 127
	CreateStreamObject(16115,2106.9500000,-3521.9900000,11.7200000,0.0000000,0.0000000,45.9950000); //Object number 128
	CreateStreamObject(16118,1830.2000000,-3530.2000000,6.3000000,0.0000000,0.0000000,25.9790000); //Object number 129
	CreateStreamObject(16118,1860.1000000,-3567.0000000,6.3000000,0.0000000,0.0000000,43.9770000); //Object number 130
	CreateStreamObject(16116,1890.7000000,-3591.6001000,4.6000000,0.0000000,0.0000000,17.9820000); //Object number 131
	CreateStreamObject(16118,1949.0000000,-3596.8999000,6.3000000,0.0000000,0.0000000,87.9730000); //Object number 132
	CreateStreamObject(16113,1982.4000000,-3605.3000000,5.4000000,0.0000000,0.0000000,41.9820000); //Object number 133
	CreateStreamObject(16113,2028.4000000,-3602.2000000,5.4000000,0.0000000,0.0000000,31.9790000); //Object number 134
	CreateStreamObject(16118,2086.8999000,-3593.6001000,6.3000000,0.0000000,0.0000000,99.9680000); //Object number 135
	CreateStreamObject(16113,2126.3000000,-3588.3000000,5.4000000,0.0000000,0.0000000,61.9760000); //Object number 136
	CreateStreamObject(16121,2042.9600000,-3541.1599000,8.5000000,0.0000000,0.0000000,69.9930000); //Object number 137
	CreateStreamObject(16113,2161.3999000,-3560.3999000,5.4000000,0.0000000,0.0000000,91.9740000); //Object number 138
	CreateStreamObject(16118,2183.0000000,-3508.7000000,6.3000000,0.0000000,0.0000000,157.9650000); //Object number 139
	CreateStreamObject(16118,2007.2500000,-3534.6101000,6.3000000,0.0000000,0.0000000,87.9850000); //Object number 140
	CreateStreamObject(16118,1957.1500000,-3541.3201000,6.3000000,0.0000000,0.0000000,269.9840000); //Object number 141
	CreateStreamObject(16116,2197.0000000,-3275.3000000,4.6000000,0.0000000,0.0000000,125.9940000); //Object number 142
	CreateStreamObject(16114,2196.4700000,-3461.7700000,2.8500000,0.0000000,0.0000000,13.9880000); //Object number 143
	CreateStreamObject(16114,2327.2002000,-3147.0000000,0.0000000,0.0000000,0.0000000,127.9960000); //Object number 144
	CreateStreamObject(16114,2200.0400000,-3426.0801000,2.8500000,0.0000000,0.0000000,179.9880000); //Object number 145
	CreateStreamObject(16114,2193.9600000,-3378.0000000,3.2000000,0.0000000,0.0000000,187.9930000); //Object number 146
	CreateStreamObject(16114,2197.3999000,-3337.3000000,0.0000000,0.0000000,0.0000000,3.9880000); //Object number 147
	CreateStreamObject(650,2184.7000000,-3370.8999000,10.9000000,0.0000000,0.0000000,350.0000000); //Object number 148
	CreateStreamObject(7916,2221.2300000,-3117.2100000,12.4600000,14.0000000,0.0000000,12.0000000); //Object number 149
	CreateStreamObject(650,2183.0000000,-3478.7000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 150
	CreateStreamObject(650,2055.7000000,-3595.2000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 151
	CreateStreamObject(650,1885.2000000,-3575.5000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 152
	CreateStreamObject(650,1818.3000000,-3444.6001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 153
	CreateStreamObject(650,1851.0000000,-3264.0000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 154
	CreateStreamObject(650,1984.0000000,-3215.8000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 155
	CreateStreamObject(650,2029.8000000,-3120.3999000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 156
	CreateStreamObject(650,2031.2000000,-2947.3000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 157
	CreateStreamObject(650,2131.8000000,-2786.5000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 158
	CreateStreamObject(650,2330.8999000,-2800.2000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 159
	CreateStreamObject(650,2398.2000000,-2917.3000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 160
	CreateStreamObject(650,2379.5000000,-3090.1001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 161
	CreateStreamObject(650,2258.1001000,-3154.1001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 162
	CreateStreamObject(650,2184.3999000,-3255.1001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 163
	CreateStreamObject(16118,2213.8899000,-3118.7400000,-8.6900000,0.0000000,0.0000000,275.9890000); //Object number 164
	CreateStreamObject(650,2068.5000000,-3159.8000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 165
	CreateStreamObject(650,2070.8999000,-3016.1001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 166
	CreateStreamObject(650,2071.8000000,-2900.6001000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 167
	CreateStreamObject(650,2229.0000000,-2825.2000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 168
	CreateStreamObject(650,2341.5000000,-2861.8999000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 169
	CreateStreamObject(650,2355.1001000,-3040.8000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 170
	CreateStreamObject(650,2268.8000000,-3111.7000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 171
	CreateStreamObject(650,2161.2000000,-3176.8999000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 172
	CreateStreamObject(650,2145.3000000,-3440.8999000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 173
	CreateStreamObject(650,2079.1001000,-3548.5000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 174
	CreateStreamObject(650,1878.7000000,-3517.8000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 175
	CreateStreamObject(650,1858.0000000,-3373.2000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 176
	CreateStreamObject(650,1914.5000000,-3270.0000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 177
	CreateStreamObject(650,2050.1001000,-3208.5000000,10.9000000,0.0000000,0.0000000,349.9970000); //Object number 178
	CreateStreamObject(621,2091.3899000,-2982.4399000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 179
	CreateStreamObject(621,2003.5000000,-2982.3999000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 180
	CreateStreamObject(621,2003.5000000,-2889.0000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 181
	CreateStreamObject(621,2079.2000000,-2791.6001000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 182
	CreateStreamObject(621,2187.0000000,-2768.0000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 183
	CreateStreamObject(621,2298.0000000,-2761.0000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 184
	CreateStreamObject(621,2174.7400000,-2848.2800000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 185
	CreateStreamObject(621,2406.8999000,-2839.6001000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 186
	CreateStreamObject(621,2328.1699000,-2949.8999000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 187
	CreateStreamObject(621,2416.0000000,-2962.2000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 188
	CreateStreamObject(621,2404.2000000,-3069.3000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 189
	CreateStreamObject(621,2307.7600000,-3055.0901000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 190
	CreateStreamObject(621,2316.6001000,-3164.6001000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 191
	CreateStreamObject(621,2172.6001000,-3129.5901000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 192
	CreateStreamObject(621,2205.6001000,-3214.2000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 193
	CreateStreamObject(621,2203.8000000,-3386.2000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 194
	CreateStreamObject(621,2121.9299000,-3347.8201000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 195
	CreateStreamObject(621,2193.8000000,-3520.1001000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 196
	CreateStreamObject(621,2071.1201000,-3509.2500000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 197
	CreateStreamObject(621,2085.5000000,-3606.5000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 198
	CreateStreamObject(621,1920.4000000,-3512.5300000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 199
	CreateStreamObject(621,1944.0000000,-3611.3000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 200
	CreateStreamObject(621,1879.5800000,-3423.0400000,4.5200000,0.0000000,0.0000000,0.0000000); //Object number 201
	CreateStreamObject(621,1831.2000000,-3554.5000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 202
	CreateStreamObject(621,1799.1000000,-3429.8999000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 203
	CreateStreamObject(621,1918.2600000,-3302.8601000,7.8000000,0.0000000,0.0000000,0.0000000); //Object number 204
	CreateStreamObject(621,1813.5000000,-3287.8000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 205
	CreateStreamObject(621,1867.1000000,-3223.7000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 206
	CreateStreamObject(621,1980.1000000,-3186.5000000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 207
	CreateStreamObject(621,2010.5000000,-3122.3999000,4.5000000,0.0000000,0.0000000,0.0000000); //Object number 208
	CreateStreamObject(621,2067.5500000,-3229.9299000,8.9400000,0.0000000,0.0000000,0.0000000); //Object number 209
	CreateStreamObject(621,2104.5100000,-3126.1699000,8.9400000,0.0000000,0.0000000,0.0000000); //Object number 210
	CreateStreamObject(3920,1844.4000000,-3413.6001000,17.8000000,0.0000000,0.0000000,358.2500000); //Object number 211
	CreateStreamObject(3920,1832.2000000,-3413.5000000,17.8000000,0.0000000,0.0000000,358.2480000); //Object number 212
	CreateStreamObject(3920,1832.2000000,-3441.8999000,17.8000000,0.0000000,0.0000000,178.2480000); //Object number 213
	CreateStreamObject(3920,1844.5000000,-3442.1001000,17.8000000,0.0000000,0.0000000,178.2480000); //Object number 214
	CreateStreamObject(3920,2006.4000000,-3576.8999000,17.8000000,0.0000000,0.0000000,88.2480000); //Object number 215
	CreateStreamObject(7916,2029.3700000,-3233.1001000,9.7400000,30.0000000,0.0000000,214.0000000); //Object number 216
	CreateStreamObject(3920,2006.8000000,-3564.3000000,17.8000000,0.0000000,0.0000000,88.2420000); //Object number 217
	CreateStreamObject(3920,2034.7000000,-3576.6001000,17.8000000,0.0000000,0.0000000,268.2420000); //Object number 218
	CreateStreamObject(3920,2035.1000000,-3563.8000000,17.8000000,0.0000000,0.0000000,268.2420000); //Object number 219
	CreateStreamObject(3920,2158.3000000,-3404.6001000,17.8000000,0.0000000,0.0000000,178.2420000); //Object number 220
	CreateStreamObject(3920,2170.2000000,-3405.0000000,17.8000000,0.0000000,0.0000000,178.2370000); //Object number 221
	CreateStreamObject(3920,2170.3000000,-3328.1001000,17.8000000,0.0000000,0.0000000,178.2370000); //Object number 222
	CreateStreamObject(3920,2158.3000000,-3327.7000000,17.8000000,0.0000000,0.0000000,178.2370000); //Object number 223
	CreateStreamObject(3920,2158.0000000,-3376.0000000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 224
	CreateStreamObject(3920,2169.8000000,-3376.6001000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 225
	CreateStreamObject(3920,2169.8000000,-3299.8000000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 226
	CreateStreamObject(3920,2158.0000000,-3299.3999000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 227
	CreateStreamObject(3920,2383.1001000,-2965.2000000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 228
	CreateStreamObject(3920,2371.1001000,-2964.7000000,17.8000000,0.0000000,0.0000000,358.2370000); //Object number 229
	CreateStreamObject(3920,2383.1001000,-2935.3999000,17.8000000,0.0000000,0.0000000,178.2370000); //Object number 230
	CreateStreamObject(3920,2370.8999000,-2935.1001000,17.8000000,0.0000000,0.0000000,178.2370000); //Object number 231
	CreateStreamObject(3920,2210.3999000,-2798.6001000,17.8000000,0.0000000,0.0000000,268.2370000); //Object number 232
	CreateStreamObject(3920,2210.2000000,-2810.8999000,17.8000000,0.0000000,0.0000000,268.2310000); //Object number 233
	CreateStreamObject(3920,2181.7000000,-2811.3000000,17.8000000,0.0000000,0.0000000,88.2310000); //Object number 234
	CreateStreamObject(3920,2182.1001000,-2799.2000000,17.8000000,0.0000000,0.0000000,88.2310000); //Object number 235
	CreateStreamObject(3920,2045.0000000,-2972.7000000,17.8000000,0.0000000,0.0000000,358.2310000); //Object number 236
	CreateStreamObject(3920,2057.0000000,-2973.1001000,17.8000000,0.0000000,0.0000000,358.2260000); //Object number 237
	CreateStreamObject(3920,2057.0000000,-3048.8000000,17.8000000,0.0000000,0.0000000,358.2260000); //Object number 238
	CreateStreamObject(3920,2045.1000000,-3048.5000000,17.8000000,0.0000000,0.0000000,358.2260000); //Object number 239
	CreateStreamObject(3920,2045.2000000,-3001.1001000,17.8000000,0.0000000,0.0000000,178.2260000); //Object number 240
	CreateStreamObject(3920,2056.8999000,-3001.3999000,17.8000000,0.0000000,0.0000000,178.2260000); //Object number 241
	CreateStreamObject(3920,2045.0000000,-3076.8999000,17.8000000,0.0000000,0.0000000,178.2260000); //Object number 242
	CreateStreamObject(3920,2057.1001000,-3077.2000000,17.8000000,0.0000000,0.0000000,178.2260000); //Object number 243
	CreateStreamObject(1245,2180.7700000,-2790.8401000,12.7600000,0.0000000,0.0000000,180.0000000); //Object number 244
	CreateStreamObject(16258,1968.6000000,-3560.5000000,18.2000000,0.0000000,0.0000000,280.0000000); //Object number 245
	CreateStreamObject(1245,2210.7400000,-2788.7000000,12.7600000,0.0000000,0.0000000,359.9950000); //Object number 246
	CreateStreamObject(1225,2206.1599000,-2788.9600000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 247
	CreateStreamObject(1225,2206.1599000,-2790.8101000,11.7200000,0.0000000,0.0000000,0.0000000); //Object number 248
	CreateStreamObject(1245,2391.2900000,-2933.4299000,12.7600000,0.0000000,0.0000000,89.9890000); //Object number 249
	CreateStreamObject(1245,2393.4299000,-2963.6899000,12.6600000,0.0000000,0.0000000,269.9890000); //Object number 250
	CreateStreamObject(1245,2147.9399000,-3298.5200000,12.6100000,0.0000000,0.0000000,91.9890000); //Object number 251
	CreateStreamObject(1245,2150.0801000,-3327.6399000,12.6100000,0.0000000,0.0000000,269.9890000); //Object number 252
	CreateStreamObject(1245,2178.6299000,-3373.1699000,12.6100000,0.0000000,0.0000000,89.9840000); //Object number 253
	CreateStreamObject(7392,2138.6001000,-3357.3000000,33.2000000,352.0050000,357.9800000,267.7190000); //Object number 254
	CreateStreamObject(1245,2180.4800000,-3403.4299000,12.5600000,0.0000000,0.0000000,269.9840000); //Object number 255
	CreateStreamObject(1245,2036.6100000,-3585.2600000,12.5600000,0.0000000,0.0000000,359.9780000); //Object number 256
	CreateStreamObject(1245,2004.6400000,-3587.2600000,12.5600000,0.0000000,0.0000000,179.9780000); //Object number 257
	CreateStreamObject(1245,1824.0900000,-3441.6799000,12.5600000,0.0000000,0.0000000,269.9730000); //Object number 258
	CreateStreamObject(1245,1822.0900000,-3412.2800000,12.5300000,0.0000000,0.0000000,89.9670000); //Object number 259
	CreateStreamObject(3864,2183.8401000,-3359.8799000,16.4400000,0.0000000,0.0000000,320.0000000); //Object number 260
	CreateStreamObject(3864,2145.5901000,-3359.8799000,16.4400000,0.0000000,0.0000000,229.9990000); //Object number 261
	CreateStreamObject(16195,1990.3000000,-3139.8000000,18.1000000,0.0000000,0.0000000,210.0000000); //Object number 262
	CreateStreamObject(16192,2039.4000000,-3381.8999000,5.4000000,0.0000000,0.0000000,210.0000000); //Object number 263
	CreateStreamObject(3872,2150.0300000,-3354.8999000,17.2400000,0.0000000,0.0000000,228.0000000); //Object number 264
	CreateStreamObject(3872,2178.8301000,-3355.3701000,17.2400000,0.0000000,0.0000000,317.9990000); //Object number 265
	CreateStreamObject(16196,1796.9000000,-3250.8000000,2.0000000,0.0000000,0.0000000,210.0000000); //Object number 266
	CreateStreamObject(16201,2454.7000000,-2938.3000000,6.7000000,0.0000000,354.0000000,126.0000000); //Object number 267
	CreateStreamObject(16253,2162.8000000,-2950.7000000,14.1000000,0.0000000,354.0000000,166.0000000); //Object number 268


	return 1;
}


forward Streamer();
public Streamer()
{



	if (LastObjID > Max_Streamed_Objects)
	{
		for(new i; i < MaxPlayers; i++)
		{
			if(IsPlayerConnected(i) && IsPlayerMoving(i))
			{

				for(new Obj; Obj<=LastObjID; Obj++)
				{
					ObjectDis[Obj] = floatround(GetPlayerDistanceFromPoint(i, Object[Obj][ox], Object[Obj][oy], Object[Obj][oz]), floatround_floor);
					TempSortObj[Obj] = ObjectDis[Obj];
				}
				quickSort(TempSortObj,0,LastObjID);
				PlyObjDnsDis[i] = TempSortObj[Max_Streamed_Objects];
				for(new Obj; Obj<=LastObjID; Obj++)
				{
					if(ObjectDis[Obj] >= TempSortObj[Max_Streamed_Objects])
					{
						StreamOutObject(i,Obj);
					}

				}
				for(new Obj; Obj<=LastObjID; Obj++)
				{
				    if(ObjectDis[Obj] < TempSortObj[Max_Streamed_Objects])
					{
						StreamInObject(i,Obj);
					}
				}
			}
		}
	}
	else
	{
		for(new i; i <= TotalPlayerCount; i++)
		{
			if(IsPlayerConnected(i))
			{
				for(new Obj; Obj<=LastObjID; Obj++)
				{
					StreamInObject(i,Obj);
				}
			}
		}
	}
	return 1;
}
//================================================================
StreamInObject(playerid,Obj)
{
	if(PlyObject[playerid][Streamed][Obj] == 0)
	{
		PlyObject[playerid][ID][Obj] = CreatePlayerObject(playerid, Object[Obj][Model], Object[Obj][ox], Object[Obj][oy], Object[Obj][oz], Object[Obj][orx], Object[Obj][ory], Object[Obj][orz]);
		PlyObject[playerid][Streamed][Obj] = 1;
		PlyObjectLoaded[playerid]++;
		//print("create");
	}
	return 1;
}
//================================================================
StreamOutObject(playerid,Obj)
{
	if(PlyObject[playerid][Streamed][Obj] == 1)
	{
		DestroyPlayerObject(playerid,PlyObject[playerid][ID][Obj]);
		PlyObject[playerid][Streamed][Obj] = 0;
		PlyObjectLoaded[playerid]--;
		//print("destreoy");
	}
	return 1;
}


public OnPlayerCommandText(playerid, cmdtext[])
{

	//Toon de aantal gemaakt objecten
	if (strcmp("/AllObjects", cmdtext, true, 10) == 0)
	{
		new string[64];
		format(string,sizeof(string),"Objects loaded in server: %d",LastObjID+1);
		SendClientMessage(playerid,0xFFFFFFAA,string);
		return 1;
	}

	//toon de aantal objects ingeleden voor de speler
	if (strcmp("/ObjectsLoaded", cmdtext, true, 10) == 0)
	{
		new string[64];
		format(string,sizeof(string),"Objects loaded in server for you: %d",PlyObjectLoaded[playerid]);
		SendClientMessage(playerid,0xFFFFFFAA,string);
		return 1;
	}


	if (strcmp("/race", cmdtext, true, 10) == 0)
	{
		TelePly(playerid, 2164.3120,-3359.8342,12.3309+5);

		return 1;
	}


	if (strcmp("/move", cmdtext, true, 10) == 0)
	{
		MoveObject(moveobjects, -3000.0,700.0,100000, 50.00);

		return 1;
	}


	if (strcmp("/s1", cmdtext, true, 10) == 0)
	{
		TelePly(playerid, 0,0,110);
		return 1;
	}




	return 0;
}




stock IsPlayerMoving(playerid)
{
	new moved=0;

	new TempPlyObjDnsDis = PlyObjDnsDis[playerid];

	TempPlyObjDnsDis=(TempPlyObjDnsDis>>>3)+(TempPlyObjDnsDis>>>4);

    if((!IsPlayerInRangeOfPoint(playerid, TempPlyObjDnsDis, History[playerid][hisx], History[playerid][hisy], History[playerid][hisz])))
    {
        GetPlayerPos(playerid, History[playerid][hisx], History[playerid][hisy], History[playerid][hisz]);
        moved = 1;
    }

	return moved;
}





stock quickSort(array[], left, right)
{
    new
        tempLeft = left,
        tempRight = right,
        pivot = array[(left + right) >>> 1],
        tempVar
    ;
    while(tempLeft <= tempRight)
    {
        while(array[tempLeft] < pivot) tempLeft++;
        while(array[tempRight] > pivot) tempRight--;

        if(tempLeft <= tempRight)
        {
            tempVar = array[tempLeft], array[tempLeft] = array[tempRight], array[tempRight] = tempVar;
            tempLeft++, tempRight--;
        }
    }
    if(left < tempRight) quickSort(array, left, tempRight);
    if(tempLeft < right) quickSort(array, tempLeft, right);
}


stock CreateCity(Float:x,Float:y,Float:z)
{

	CreateStreamObject(7486,0.0000000+x,0.0000000+y,100.0000000+z,0.0000000,0.0000000,0.0000000); //Object number 0
	CreateStreamObject(5706,38.6700000+x,-73.1400000+y,96.1200000+z,0.0000000,0.0000000,0.0000000); //Object number 1
	CreateStreamObject(5706,62.8000000+x,-73.0600000+y,96.1100000+z,0.0000000,0.0000000,0.0000000); //Object number 2
	CreateStreamObject(5706,9.6000000+x,-76.4000000+y,96.1200000+z,0.0000000,0.0000000,270.0000000); //Object number 3
	CreateStreamObject(5706,9.6000000+x,-103.5000000+y,96.1400000+z,0.0000000,0.0000000,270.0000000); //Object number 4
	CreateStreamObject(3303,12.4000000+x,-97.3000000+y,102.0000000+z,0.0000000,0.0000000,0.0000000); //Object number 5
	CreateStreamObject(3305,12.4100000+x,-72.4500000+y,102.9000000+z,0.0000000,0.0000000,270.0000000); //Object number 6
	CreateStreamObject(3308,38.0700000+x,-73.1800000+y,101.3800000+z,0.0000000,0.0000000,90.0000000); //Object number 7
	CreateStreamObject(3310,67.3300000+x,-72.3800000+y,102.0000000+z,0.0000000,0.0000000,270.0000000); //Object number 8
	CreateStreamObject(3315,-63.4200000+x,-20.9200000+y,100.9500000+z,0.0000000,0.0000000,0.0000000); //Object number 9
	CreateStreamObject(5706,-33.1100000+x,-103.5000000+y,96.1100000+z,0.0000000,0.0000000,270.0000000); //Object number 10
	CreateStreamObject(5706,-33.1100000+x,-75.8100000+y,96.1200000+z,0.0000000,0.0000000,270.0000000); //Object number 11
	CreateStreamObject(5706,-63.3000000+x,-69.6700000+y,96.1200000+z,0.0000000,0.0000000,180.0000000); //Object number 12
	CreateStreamObject(3315,-38.9800000+x,-68.3900000+y,100.9500000+z,0.0000000,0.0000000,90.0000000); //Object number 13
	CreateStreamObject(3443,-32.7400000+x,-104.6600000+y,102.8300000+z,0.0000000,0.0000000,90.0000000); //Object number 14
	CreateStreamObject(3444,-33.4800000+x,-25.0500000+y,102.4800000+z,0.0000000,0.0000000,90.0000000); //Object number 15
	CreateStreamObject(5706,-36.4700000+x,-26.8800000+y,96.1200000+z,0.0000000,0.0000000,179.9950000); //Object number 16
	CreateStreamObject(5706,-63.4000000+x,-26.8800000+y,96.1000000+z,0.0000000,0.0000000,179.9950000); //Object number 17
	CreateStreamObject(5706,-29.5000000+x,-0.6700000+y,96.0900000+z,0.0000000,0.0000000,90.0000000); //Object number 18
	CreateStreamObject(3446,-34.4000000+x,-0.8400000+y,103.4000000+z,0.0000000,0.0000000,90.0000000); //Object number 19
	CreateStreamObject(3466,-35.0800000+x,26.7000000+y,102.4600000+z,0.0000000,0.0000000,180.0000000); //Object number 20
	CreateStreamObject(5706,-36.5700000+x,26.9000000+y,96.1000000+z,0.0000000,0.0000000,0.0000000); //Object number 21
	CreateStreamObject(5706,-63.5000000+x,26.9000000+y,96.0900000+z,0.0000000,0.0000000,0.0000000); //Object number 22
	CreateStreamObject(3483,-64.8400000+x,22.9100000+y,106.8900000+z,0.0000000,0.0000000,180.0000000); //Object number 23
	CreateStreamObject(3484,14.8000000+x,22.7600000+y,106.5600000+z,0.0000000,0.0000000,180.0000000); //Object number 24
	CreateStreamObject(5706,12.9800000+x,23.5600000+y,96.0900000+z,0.0000000,0.0000000,89.9950000); //Object number 25
	CreateStreamObject(5706,12.9800000+x,-9.4900000+y,96.0900000+z,0.0000000,0.0000000,89.9950000); //Object number 26
	CreateStreamObject(5706,13.0800000+x,-30.4700000+y,96.0700000+z,0.0000000,0.0000000,0.0000000); //Object number 27
	CreateStreamObject(5706,46.0500000+x,-30.4700000+y,96.0700000+z,0.0000000,0.0000000,0.0000000); //Object number 28
	CreateStreamObject(3501,54.3700000+x,-24.6300000+y,103.1000000+z,0.0000000,0.0000000,90.0000000); //Object number 29
	CreateStreamObject(3598,15.2100000+x,-34.0800000+y,101.9300000+z,0.0000000,0.0000000,0.0000000); //Object number 30
	CreateStreamObject(3684,8.7100000+x,-11.6800000+y,103.1800000+z,0.0000000,0.0000000,0.0000000); //Object number 31
	CreateStreamObject(3825,-67.0400000+x,-64.4600000+y,104.5500000+z,0.0000000,0.0000000,270.0000000); //Object number 32
	CreateStreamObject(3825,-75.6000000+x,-64.4600000+y,104.5500000+z,0.0000000,0.0000000,270.0000000); //Object number 33
	CreateStreamObject(6039,-37.4500000+x,92.9000000+y,108.1100000+z,0.0000000,0.0000000,180.0000000); //Object number 34
	CreateStreamObject(6047,-50.2300000+x,77.1800000+y,108.1200000+z,0.0000000,0.0000000,180.0000000); //Object number 35
	CreateStreamObject(5706,-36.5400000+x,69.5800000+y,96.1200000+z,0.0000000,0.0000000,0.0000000); //Object number 36
	CreateStreamObject(5706,-63.5200000+x,69.5800000+y,96.1200000+z,0.0000000,0.0000000,0.0000000); //Object number 37
	CreateStreamObject(5706,-63.5200000+x,92.0700000+y,96.1200000+z,0.0000000,0.0000000,0.0000000); //Object number 38
	CreateStreamObject(5706,-63.5200000+x,106.9400000+y,96.1200000+z,0.0000000,0.0000000,0.0000000); //Object number 39
	CreateStreamObject(5706,-63.5200000+x,-7.1800000+y,96.0600000+z,0.0000000,0.0000000,0.0000000); //Object number 40
	CreateStreamObject(5706,-45.1100000+x,-11.0200000+y,96.0400000+z,0.0000000,0.0000000,0.0000000); //Object number 41
	CreateStreamObject(5706,-56.8100000+x,11.9600000+y,96.0700000+z,0.0000000,0.0000000,0.0000000); //Object number 42
	CreateStreamObject(5706,-63.3000000+x,-92.4400000+y,96.1200000+z,0.0000000,0.0000000,179.9950000); //Object number 43
	CreateStreamObject(5706,-63.3000000+x,-106.8400000+y,96.1300000+z,0.0000000,0.0000000,179.9950000); //Object number 44
	CreateStreamObject(5706,-43.7500000+x,-92.4400000+y,96.0700000+z,0.0000000,0.0000000,179.9950000); //Object number 45
	CreateStreamObject(5706,32.3900000+x,-103.5000000+y,96.1400000+z,0.0000000,0.0000000,270.0000000); //Object number 46
	CreateStreamObject(5706,55.1000000+x,-103.5000000+y,96.1300000+z,0.0000000,0.0000000,270.0000000); //Object number 47
	CreateStreamObject(5706,66.2500000+x,-103.4900000+y,96.1900000+z,0.0000000,0.0000000,270.0000000); //Object number 48
	CreateStreamObject(5706,62.8300000+x,-81.8100000+y,96.0800000+z,0.0000000,0.0000000,180.0000000); //Object number 49
	CreateStreamObject(4021,7.2400000+x,72.5200000+y,106.4300000+z,0.0000000,0.0000000,270.0000000); //Object number 50
	CreateStreamObject(5706,12.9800000+x,76.1800000+y,96.0900000+z,0.0000000,0.0000000,89.9950000); //Object number 51
	CreateStreamObject(3442,17.5600000+x,104.1600000+y,104.1500000+z,0.0000000,0.0000000,270.0000000); //Object number 52
	CreateStreamObject(3449,41.3900000+x,25.0900000+y,101.9400000+z,0.0000000,0.0000000,270.0000000); //Object number 53
	CreateStreamObject(3466,66.6400000+x,25.1100000+y,102.4100000+z,0.0000000,0.0000000,270.0000000); //Object number 54
	CreateStreamObject(5706,55.5100000+x,23.4500000+y,96.0800000+z,0.0000000,0.0000000,89.9950000); //Object number 55
	CreateStreamObject(5706,37.3900000+x,-2.5200000+y,96.0800000+z,0.0000000,0.0000000,89.9950000); //Object number 56
	CreateStreamObject(5706,63.3700000+x,1.1900000+y,96.0800000+z,0.0000000,0.0000000,179.9950000); //Object number 57
	CreateStreamObject(5706,33.4000000+x,-2.5200000+y,96.0600000+z,0.0000000,0.0000000,89.9950000); //Object number 58
	CreateStreamObject(3484,64.8600000+x,77.2300000+y,106.5700000+z,0.0000000,0.0000000,0.0000000); //Object number 59
	CreateStreamObject(5706,53.6500000+x,76.1800000+y,96.0500000+z,0.0000000,0.0000000,89.9950000); //Object number 60
	CreateStreamObject(5706,34.8100000+x,76.1800000+y,96.0700000+z,0.0000000,0.0000000,89.9950000); //Object number 61
	CreateStreamObject(3449,29.8900000+x,71.1600000+y,101.3500000+z,0.0000000,0.0000000,180.0000000); //Object number 62
	CreateStreamObject(5706,70.2100000+x,103.4100000+y,96.0900000+z,0.0000000,0.0000000,89.9950000); //Object number 63
	CreateStreamObject(5706,41.3800000+x,103.3900000+y,96.0800000+z,0.0000000,0.0000000,89.9950000); //Object number 64
	CreateStreamObject(5706,59.7900000+x,103.3900000+y,96.0500000+z,0.0000000,0.0000000,89.9950000); //Object number 65
	CreateStreamObject(1315,0.0400000+x,53.0100000+y,103.1500000+z,0.0000000,0.0000000,90.0000000); //Object number 66
	CreateStreamObject(1315,0.0400000+x,-46.4700000+y,103.1500000+z,0.0000000,0.0000000,90.0000000); //Object number 67
	CreateStreamObject(1315,-20.2000000+x,-53.3300000+y,103.1500000+z,0.0000000,0.0000000,270.0000000); //Object number 68
	CreateStreamObject(1315,-20.2000000+x,46.7200000+y,103.1500000+z,0.0000000,0.0000000,270.0000000); //Object number 69
	CreateStreamObject(1315,-13.9200000+x,60.1300000+y,103.1500000+z,0.0000000,0.0000000,180.0000000); //Object number 70
	CreateStreamObject(1315,-13.4900000+x,-39.6300000+y,103.1500000+z,0.0000000,0.0000000,179.9950000); //Object number 71
	CreateStreamObject(1315,-6.2100000+x,-60.3100000+y,103.1500000+z,0.0000000,0.0000000,359.9950000); //Object number 72
	CreateStreamObject(1315,-6.2100000+x,39.7400000+y,103.1500000+z,0.0000000,0.0000000,359.9890000); //Object number 73
	CreateStreamObject(1297,-4.5900000+x,-29.7300000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 74
	CreateStreamObject(1297,-4.5900000+x,-9.6100000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 75
	CreateStreamObject(1297,-4.5900000+x,10.3700000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 76
	CreateStreamObject(1297,-4.5900000+x,30.2500000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 77
	CreateStreamObject(1297,-15.8600000+x,29.7800000+y,103.3300000+z,0.0000000,0.0000000,180.0000000); //Object number 78
	CreateStreamObject(1297,-15.8600000+x,10.3700000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 79
	CreateStreamObject(1297,-15.8600000+x,-10.2700000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 80
	CreateStreamObject(1297,-15.8600000+x,-30.2600000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 81
	CreateStreamObject(1297,-15.8600000+x,-70.2600000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 82
	CreateStreamObject(1297,-15.8600000+x,-90.1800000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 83
	CreateStreamObject(1297,-15.8600000+x,-110.3000000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 84
	CreateStreamObject(1297,-4.5900000+x,-69.6800000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 85
	CreateStreamObject(1297,-4.5900000+x,-89.7600000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 86
	CreateStreamObject(1297,-4.5900000+x,-109.6800000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 87
	CreateStreamObject(1297,-4.5900000+x,70.2800000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 88
	CreateStreamObject(1297,-4.5900000+x,90.3300000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 89
	CreateStreamObject(1297,-4.5900000+x,109.8800000+y,103.3300000+z,0.0000000,0.0000000,0.0000000); //Object number 90
	CreateStreamObject(1297,-15.8600000+x,69.7400000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 91
	CreateStreamObject(1297,-15.8600000+x,89.7700000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 92
	CreateStreamObject(1297,-15.8600000+x,109.4000000+y,103.3300000+z,0.0000000,0.0000000,179.9950000); //Object number 93
	CreateStreamObject(1297,-30.3000000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,91.9950000); //Object number 94
	CreateStreamObject(1297,-50.2800000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9940000); //Object number 95
	CreateStreamObject(1297,-70.2600000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9890000); //Object number 96
	CreateStreamObject(1297,10.3800000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9890000); //Object number 97
	CreateStreamObject(1297,29.6500000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9890000); //Object number 98
	CreateStreamObject(1297,49.6300000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9890000); //Object number 99
	CreateStreamObject(1297,72.7400000+x,55.1800000+y,103.3300000+z,0.0000000,0.0000000,89.9890000); //Object number 100
	CreateStreamObject(1297,72.7400000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 101
	CreateStreamObject(1297,50.3300000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 102
	CreateStreamObject(1297,30.2100000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 103
	CreateStreamObject(1297,10.1800000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 104
	CreateStreamObject(1297,-29.9200000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 105
	CreateStreamObject(1297,-49.7600000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 106
	CreateStreamObject(1297,-69.7400000+x,44.4800000+y,103.3300000+z,0.0000000,0.0000000,269.9890000); //Object number 107
	CreateStreamObject(1211,-26.2600000+x,55.7300000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 108
	CreateStreamObject(1211,-4.1400000+x,107.8300000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 109
	CreateStreamObject(1211,47.6700000+x,43.6000000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 110
	CreateStreamObject(1211,-16.2700000+x,-27.0500000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 111
	CreateStreamObject(1211,15.7000000+x,-56.3100000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 112
	CreateStreamObject(1211,-16.4100000+x,-85.2900000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 113
	CreateStreamObject(1211,-53.8000000+x,-43.7600000+y,100.3200000+z,0.0000000,0.0000000,0.0000000); //Object number 114
	CreateStreamObject(1297,9.7300000+x,-44.4500000+y,103.3300000+z,0.0000000,0.0000000,90.0000000); //Object number 115
	CreateStreamObject(1297,29.8600000+x,-44.4500000+y,103.3300000+z,0.0000000,0.0000000,90.0000000); //Object number 116
	CreateStreamObject(1297,49.7000000+x,-44.4500000+y,103.3300000+z,0.0000000,0.0000000,90.0000000); //Object number 117
	CreateStreamObject(1297,71.2800000+x,-44.4500000+y,103.3300000+z,0.0000000,0.0000000,90.0000000); //Object number 118
	CreateStreamObject(1297,71.8800000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,268.0000000); //Object number 119
	CreateStreamObject(1297,50.4100000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,267.9950000); //Object number 120
	CreateStreamObject(1297,30.3400000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,269.9950000); //Object number 121
	CreateStreamObject(1297,10.3100000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,269.9950000); //Object number 122
	CreateStreamObject(1297,-29.6800000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,269.9950000); //Object number 123
	CreateStreamObject(1297,-49.6000000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,269.9950000); //Object number 124
	CreateStreamObject(1297,-69.6900000+x,-55.6300000+y,103.3300000+z,0.0000000,0.0000000,269.9950000); //Object number 125
	CreateStreamObject(1297,-70.2600000+x,-44.0700000+y,103.3300000+z,0.0000000,0.0000000,89.9950000); //Object number 126
	CreateStreamObject(1297,-48.7100000+x,-44.0700000+y,103.3300000+z,0.0000000,0.0000000,89.9950000); //Object number 127
	CreateStreamObject(1297,-30.1600000+x,-44.0700000+y,103.3300000+z,0.0000000,0.0000000,89.9950000); //Object number 128
	CreateStreamObject(1291,1.6800000+x,43.8500000+y,100.4500000+z,0.0000000,0.0000000,0.0000000); //Object number 129
	CreateStreamObject(1346,-16.4200000+x,35.8300000+y,101.2900000+z,0.0000000,0.0000000,0.0000000); //Object number 130
	CreateStreamObject(955,-23.5900000+x,65.4400000+y,100.3100000+z,0.0000000,0.0000000,0.0000000); //Object number 131
	CreateStreamObject(1300,-3.8400000+x,-31.4400000+y,100.2800000+z,0.0000000,0.0000000,0.0000000); //Object number 132
	CreateStreamObject(1300,-16.5400000+x,-80.4000000+y,100.2800000+z,0.0000000,0.0000000,0.0000000); //Object number 133
	CreateStreamObject(1300,45.1200000+x,-43.8600000+y,100.2800000+z,0.0000000,0.0000000,0.0000000); //Object number 134
	CreateStreamObject(3675,79.9600000+x,56.8900000+y,98.6600000+z,270.0000000,0.0000000,0.0000000); //Object number 135
	CreateStreamObject(3675,79.9600000+x,43.2500000+y,98.6600000+z,270.0000000,0.0000000,180.0000000); //Object number 136
	CreateStreamObject(3675,83.0700000+x,-56.7500000+y,98.6700000+z,270.0000000,0.0000000,179.9950000); //Object number 137
	CreateStreamObject(3675,83.0500000+x,-43.1900000+y,98.6600000+z,270.0000000,0.0000000,359.9950000); //Object number 138
	CreateStreamObject(3675,-16.8600000+x,120.0000000+y,98.6800000+z,270.0000000,0.0000000,90.0000000); //Object number 139
	CreateStreamObject(3675,-3.3100000+x,120.0100000+y,98.6800000+z,270.0000000,0.0000000,270.0000000); //Object number 140
	return 1;
}

stock TelePly(playerid,Float:x,Float:y,Float:z,Float:a= 0.0)
{
	SetPlayerPos(playerid,x,y,z);
	SetPlayerFacingAngle( playerid, a );
	TogglePlayerControllable(playerid, 0);
	SetTimerEx("TelePlyTimer", 2000, 0, "d", playerid);
	GameTextForPlayer(playerid, "~g~Loading...", 2000, 3);
	return 1;
}

forward TelePlyTimer(playerid);
public TelePlyTimer(playerid)
{
    TogglePlayerControllable(playerid, 1);
    return 1;
}



stock khup(Float:x,Float:y,Float:z)
{
	CreateStreamObject(18450,x+0.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 0
	CreateStreamObject(3502,x+42.7999992,y+-3.3000000,z+102.0000000,0.0000000,0.0000000,270.0000000); //Object number 1
	CreateStreamObject(3502,x+99.1999969,y+-3.5000000,z+121.9000015,0.0000000,0.0000000,270.0000000); //Object number 2
	CreateStreamObject(18450,x+140.0000000,y+0.0000000,z+120.0000000,0.0000000,0.0000000,0.0000000); //Object number 3
	CreateStreamObject(3502,x+51.0040806,y+-3.3110787,z+103.1023324,14.4485586,0.8517440,-90.1483703); //Object number 4
	CreateStreamObject(3502,x+59.0367332,y+-3.3396501,z+105.9451898,23.5902518,1.0779123,-90.2514612); //Object number 5
	CreateStreamObject(3502,x+66.9714266,y+-3.3787172,z+109.8323621,27.8375287,1.1012012,-90.3040881); //Object number 6
	CreateStreamObject(3502,x+74.8816302,y+-3.4212828,z+114.0676394,27.8009501,1.0989206,-90.3036181); //Object number 7
	CreateStreamObject(3502,x+82.8408135,y+-3.4603498,z+117.9548117,23.4937917,1.0701017,-90.2503077); //Object number 8
	CreateStreamObject(3502,x+90.9224459,y+-3.4889213,z+120.7976691,14.3447342,0.8388829,-90.1472581); //Object number 9
	CreateStreamObject(1395,x+51.4000015,y+3.0000000,z+103.1999969,0.0000000,72.0000000,0.0000000); //Object number 10
	CreateStreamObject(18450,x+240.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 11
	CreateStreamObject(18367,x+203.3999939,y+3.7000000,z+99.9000015,326.0000000,0.0000000,270.0000000); //Object number 12
	CreateStreamObject(18367,x+203.3999939,y+-3.8000000,z+99.9000015,325.9973145,0.0000000,270.0000000); //Object number 13
	LastCorObject[0]=x+203.3999939;
	LastCorObject[1]=y+-3.8000000;
	//LastCorObject[2]=z+99.9000015;
	return 1;
}

stock khup1(Float:x,Float:y,Float:z)
{
	CreateStreamObject(18450,x+80.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 0
	CreateStreamObject(18450,x+0.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 1
	CreateStreamObject(18450,x+250.0000000,y+0.0000000,z+200.0000000,0.0000000,300.0000000,0.0000000); //Object number 2
	CreateStreamObject(18450,x+101.0894065,y+0.0000000,z+100.7674974,0.0277029,-4.3247074,0.0020950); //Object number 3
	CreateStreamObject(18450,x+120.7813674,y+0.0000000,z+103.0935691,0.0421722,-9.3057673,0.0069103); //Object number 4
	CreateStreamObject(18450,x+139.1660406,y+0.0000000,z+107.0135845,0.0406159,-14.9087959,0.0108137); //Object number 5
	CreateStreamObject(18450,x+156.3335838,y+0.0000000,z+112.5629130,0.0239012,-21.0236059,0.0091861); //Object number 6
	CreateStreamObject(18450,x+172.3741548,y+0.0000000,z+119.7769237,0.0018173,-27.4582302,0.0009444); //Object number 7
	CreateStreamObject(18450,x+187.3779113,y+0.0000000,z+128.6909861,0.0266974,-33.9596049,0.0179802); //Object number 8
	CreateStreamObject(18450,x+201.4350113,y+0.0000000,z+139.3404696,0.0419627,-40.2598937,0.0355364); //Object number 9
	CreateStreamObject(18450,x+214.6356123,y+0.0000000,z+151.7607433,0.0440427,-46.1296800,0.0458146); //Object number 10
	CreateStreamObject(18450,x+227.0698723,y+0.0000000,z+165.9871768,0.0347885,-51.4138865,0.0436004); //Object number 11
	CreateStreamObject(18450,x+238.8279572,y+0.0000000,z+182.0551453,0.0156250,303.9606934,0.0231934); //Object number 12
	CreateStreamObject(18450,x+309.7000122,y+0.0000000,z+234.5000000,0.0000000,0.0000000,0.0000000); //Object number 13
	CreateStreamObject(18450,x+369.3999939,y+0.0000000,z+200.0000000,0.0000000,60.0000000,0.0000000); //Object number 14
	CreateStreamObject(18450,x+600.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 15
	CreateStreamObject(18450,x+381.9834651,y+0.0000000,z+182.0551392,0.1332378,50.1653467,-0.1597198); //Object number 16
	CreateStreamObject(18450,x+397.6115647,y+0.0000000,z+165.9871768,0.2365439,41.6935340,-0.2107035); //Object number 17
	CreateStreamObject(18450,x+415.8280942,y+0.0000000,z+151.7607433,0.2926913,34.5258503,-0.2013539); //Object number 18
	CreateStreamObject(18450,x+436.1768552,y+0.0000000,z+139.3404696,0.3081315,28.4675977,-0.1670749); //Object number 19
	CreateStreamObject(18450,x+458.2016494,y+0.0000000,z+128.6909861,0.2946764,23.2898681,-0.1268452); //Object number 20
	CreateStreamObject(18450,x+481.4462784,y+0.0000000,z+119.7769237,0.2623084,18.7767172,-0.0891778); //Object number 21
	CreateStreamObject(18450,x+505.4545436,y+0.0000000,z+112.5629130,0.2180313,14.7378112,-0.0573531); //Object number 22
	CreateStreamObject(18450,x+529.7702468,y+0.0000000,z+107.0135845,0.1665455,11.0045011,-0.0323867); //Object number 23
	CreateStreamObject(18450,x+553.9371896,y+0.0000000,z+103.0935691,0.1111570,7.4184207,-0.0144731); //Object number 24
	CreateStreamObject(18450,x+577.4991734,y+0.0000000,z+100.7674974,0.0546067,3.8150487,-0.0036414); //Object number 25
	LastCorObject[0]=x+577.4991734;
	LastCorObject[1]=y+0.0;
	//LastCorObject[2]=z+100.7674974;
	return 1;
}


stock khup2(Float:x,Float:y,Float:z)
{
	CreateStreamObject(18450,x+80.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 0
	CreateStreamObject(18450,x+80.0000000,y+10.0000000,z+220.0000000,0.0000000,179.9999390,6.0000000); //Object number 1
	CreateStreamObject(18450,x+90.8815144,y+0.1200450,z+100.7904120,-0.6430760,-8.5547101,1.2071262); //Object number 2
	CreateStreamObject(18450,x+100.6694827,y+0.4607061,z+103.0579872,-1.4531716,-17.7150731,2.2693701); //Object number 3
	CreateStreamObject(18450,x+109.3647566,y+0.9927726,z+106.6472348,-2.3776376,-27.2148310,3.1148005); //Object number 4
	CreateStreamObject(18450,x+116.9681880,y+1.6870336,z+111.4026638,-3.3373471,-36.7471348,3.7022911); //Object number 5
	CreateStreamObject(18450,x+123.4806287,y+2.5142784,z+117.1687833,-4.2512137,-46.0389702,4.0310787); //Object number 6
	CreateStreamObject(18450,x+128.9029303,y+3.4452963,z+123.7901024,-5.0567937,-54.9103083,4.1324117); //Object number 7
	CreateStreamObject(18450,x+133.2359448,y+4.4508764,z+131.1111300,-5.7168893,-63.2936466,4.0531579); //Object number 8
	CreateStreamObject(18450,x+136.4805239,y+5.5018080,z+138.9763754,-6.2149964,-71.2185965,3.8422402); //Object number 9
	CreateStreamObject(18450,x+138.6375195,y+6.5688802,z+147.2303475,-6.5469972,-78.7818029,3.5437327); //Object number 10
	CreateStreamObject(18450,x+139.7077832,y+7.6228824,z+155.7175555,-6.7138929,-86.1187802,3.1954073); //Object number 11
	CreateStreamObject(18450,x+139.6921670,y+8.6346038,z+164.2825083,-6.7170902,-93.3838469,2.8303923); //Object number 12
	CreateStreamObject(18450,x+138.5915225,y+9.5748335,z+172.7697151,-6.5561909,-100.7368891,2.4802121); //Object number 13
	CreateStreamObject(18450,x+136.4067017,y+10.4143608,z+181.0236849,-6.2289952,-108.3324993,2.1782097); //Object number 14
	CreateStreamObject(18450,x+133.1385563,y+11.1239750,z+188.8889268,-5.7337502,-116.3062685,1.9626241); //Object number 15
	CreateStreamObject(18450,x+128.7879380,y+11.6744652,z+196.2099498,-5.0739920,-124.7537474,1.8782875); //Object number 16
	CreateStreamObject(18450,x+123.3556988,y+12.0366207,z+202.8312631,-4.2660745,-133.7009483,1.9751255); //Object number 17
	CreateStreamObject(18450,x+116.8426903,y+12.1812306,z+208.5973756,-3.3478063,-143.0732206,2.3009835); //Object number 18
	CreateStreamObject(18450,x+109.2497644,y+12.0790843,z+213.3527965,-2.3831029,-152.6802968,2.8875058); //Object number 19
	CreateStreamObject(18450,x+100.5777728,y+11.7009710,z+216.9420348,-1.4548229,-162.2385925,3.7331981); //Object number 20
	CreateStreamObject(18450,x+90.8275674,y+11.0176798,z+219.2095996,-0.6430627,-171.4342823,4.7952262); //Object number 21
	CreateStreamObject(18450,x+80.0999985,y+20.0000000,z+100.0000000,0.0000000,0.0000000,180.0000000); //Object number 22
	CreateStreamObject(18450,x+80.0000000,y+10.0000000,z+220.0000000,0.0000000,180.0000000,184.0000000); //Object number 23
	CreateStreamObject(18450,x+69.2162486,y+19.8979774,z+100.7904114,-0.6016602,-8.5516783,-178.9818330); //Object number 24
	CreateStreamObject(18450,x+59.4219758,y+19.6077791,z+103.0579851,-1.3458047,-17.7047793,-178.0995923); //Object number 25
	CreateStreamObject(18450,x+50.7169308,y+19.1532090,z+106.6472303,-2.1854851,-27.1965746,-177.4148832); //Object number 26
	CreateStreamObject(18450,x+43.1008645,y+18.5580712,z+111.4026563,-3.0506982,-36.7237114,-176.9618164); //Object number 27
	CreateStreamObject(18450,x+36.5735276,y+17.8461698,z+117.1687723,-3.8701542,-46.0153255,-176.7388655); //Object number 28
	CreateStreamObject(18450,x+31.1346710,y+17.0413088,z+123.7900875,-4.5895132,-54.8917083,-176.7166506); //Object number 29
	CreateStreamObject(18450,x+26.7840454,y+16.1672923,z+131.1111111,-5.1770197,-63.2843233,-176.8526903); //Object number 30
	CreateStreamObject(18450,x+23.5214017,y+15.2479243,z+138.9763524,-5.6191939,-71.2212355,-177.1033804); //Object number 31
	CreateStreamObject(18450,x+21.3464906,y+14.3070089,z+147.2303207,-5.9132946,-78.7976465,-177.4299182); //Object number 32
	CreateStreamObject(18450,x+20.2590631,y+13.3683502,z+155.7175251,-6.0608224,-86.1479518,-177.7993878); //Object number 33
	CreateStreamObject(18450,x+20.2588698,y+12.4557521,z+164.2824749,-6.0633469,-93.4256135,-178.1831415); //Object number 34
	CreateStreamObject(18450,x+21.3456616,y+11.5930187,z+172.7696793,-5.9205619,-100.7897364,-178.5540080); //Object number 35
	CreateStreamObject(18450,x+23.5191893,y+10.8039542,z+181.0236476,-5.6302857,-108.3940068,-178.8831801); //Object number 36
	CreateStreamObject(18450,x+26.7792037,y+10.1123624,z+188.8888889,-5.1904309,-116.3728625,-179.1373917); //Object number 37
	CreateStreamObject(18450,x+31.1254557,y+9.5420476,z+196.2099125,-4.6032731,-124.8205322,-179.2772626); //Object number 38
	CreateStreamObject(18450,x+36.5576959,y+9.1168137,z+202.8312277,-3.8821507,-133.7619596,-179.2584090); //Object number 39
	CreateStreamObject(18450,x+43.0756753,y+8.8604647,z+208.5973437,-3.0592680,-143.1224676,-179.0375643); //Object number 40
	CreateStreamObject(18450,x+50.6791445,y+8.7968049,z+213.3527697,-2.1900997,-152.7135988,-178.5849913); //Object number 41
	CreateStreamObject(18450,x+59.3678546,y+8.9496381,z+216.9420149,-1.3473319,-162.2554857,-177.8996804); //Object number 42
	CreateStreamObject(18450,x+69.1415561,y+9.3427684,z+219.2095886,-0.6017585,-171.4388333,-177.0170464); //Object number 43
	CreateStreamObject(18450,x+0.0000000,y+0.0000000,z+100.0000000,0.0000000,0.0000000,0.0000000); //Object number 44
	CreateStreamObject(18450,x+160.0000000,y+20.0000000,z+100.0000000,0.0000000,0.0000000,179.9945068); //Object number 45
	LastCorObject[0]=x+160.0000000;
	LastCorObject[1]=y+20.0000000;
	//LastCorObject[2]=z+100.0000000;
	return 1;
}



