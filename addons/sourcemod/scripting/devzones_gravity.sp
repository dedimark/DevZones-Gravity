// ------ #include ------ //

#include <sourcemod>
#include <devzones>
#include <multicolors>

// ------ ConVar ------ //

ConVar ConVar_Gravity;

// ------ #pragma ------ //

#pragma semicolon 1
#pragma newdecls required

// ------ myinfo ------ //

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Gravity",
	author = "ByDexter",
	description = "",
	version = "1.0",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	ConVar_Gravity = CreateConVar("sm_zones_gravity", "0.5", "Bölgeye giren oyuncuların gravitysi (1.0 default)");
	AutoExecConfig(true, "DevZones-gravity", "ByDexter");
}

public void OnClientDisconnect(int client)
{
	SetEntityGravity(client, 1.0);
}

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "gravity", false) == 0)
	{
		SetEntityGravity(client, ConVar_Gravity.FloatValue);
		CPrintToChat(client, "{darkred}[ByDexter] {green}gravity bölgesine {default}girdiniz.");
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if(StrContains(zone, "gravity", false) == 0)
	{
		SetEntityGravity(client, 1.0);
		CPrintToChat(client, "{darkred}[ByDexter] {green}gravity bölgesinden {default}ayrıldınız.");
	}
}