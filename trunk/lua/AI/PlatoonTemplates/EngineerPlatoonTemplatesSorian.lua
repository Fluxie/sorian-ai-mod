#***************************************************************************
#*
#**  File     :  /lua/ai/EngineerPlatoonTemplates.lua
#**
#**  Summary  : Global platoon templates
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

### Engineer platoons to be formed

PlatoonTemplate {
    Name = 'CommanderBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.COMMAND, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'T2EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'UEFT2EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.UEF * categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'CybranT2EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.CYBRAN * categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'T3EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 + categories.SUBCOMMANDER, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'AeonT3EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.AEON * categories.ENGINEER * ( categories.TECH3 + categories.SUBCOMMANDER ), 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'UEFT3EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.UEF * categories.ENGINEER * ( categories.TECH3 + categories.SUBCOMMANDER ), 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'CybranT3EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.CYBRAN * categories.ENGINEER * ( categories.TECH3 + categories.SUBCOMMANDER ), 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'SeraphimT3EngineerBuilderSorian',
    Plan = 'EngineerBuildAISorian',
    GlobalSquads = {
        { categories.SERAPHIM * categories.ENGINEER * ( categories.TECH3 + categories.SUBCOMMANDER ), 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'EngineerRepairSorian',
    Plan = 'RepairAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'T2EngineerRepairSorian',
    Plan = 'RepairAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },        
}

PlatoonTemplate {
    Name = 'T3EngineerRepairSorian',
    Plan = 'RepairAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 + categories.SUBCOMMANDER, 1, 1, 'support', 'None' }
    },        
}