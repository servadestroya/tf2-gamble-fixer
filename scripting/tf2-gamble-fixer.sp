#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>

#define PLUGIN_VERSION "0.0"
#define PLUGIN_NAME "Gamble Fixer"
#define PLUGIN_PREFIX "gamble_fixer"

public Plugin myinfo = 
{
    name = PLUGIN_NAME,
    author = "fakuivan",
    description = "Makes server-made econ items visible",
    version = PLUGIN_VERSION,
    url = "https://forums.alliedmods.net/member.php?u=264797"
}

public void OnPluginStart()
{
    CreateConVar("sm_" ... PLUGIN_PREFIX ... "_version",
                 PLUGIN_VERSION,
                 "Version of " ... PLUGIN_NAME,
                 FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);
}

public void OnEntityCreated(int i_entity, const char[] s_classname)
{
    if (IsValidEntity(i_entity) &&
            HasEntProp(i_entity, Prop_Send, "m_bValidatedAttachedEntity"))
        SetEntProp(i_entity, Prop_Send, "m_bValidatedAttachedEntity", 1);
}
