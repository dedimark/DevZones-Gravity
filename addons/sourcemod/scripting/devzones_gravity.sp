#include <sourcemod>
#include <devzones>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "SM DEV ZONES - Gravity", 
	author = "ByDexter", 
	description = "", 
	version = "1.1", 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if (IsValidClient(client) && StrContains(zone, "gravity", false) != -1)
	{
		SetEntityGravity(client, StringToFloat(zone));
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if (IsValidClient(client) && StrContains(zone, "gravity", false) != -1)
	{
		SetEntityGravity(client, 1.0);
	}
}

bool IsValidClient(int client, bool nobots = true)
{
	if (client <= 0 || client > MaxClients || !IsClientConnected(client) || (nobots && IsFakeClient(client)))
	{
		return false;
	}
	return IsClientInGame(client);
} 