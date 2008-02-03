#***************************************************************************
#*
#**  File     :  /lua/ai/SorianDefenseBuilders.lua
#**
#**  Summary  : Default economic builders for skirmish
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local BBTmplFile = '/lua/basetemplates.lua'
local BuildingTmpl = 'BuildingTemplates'
local BaseTmpl = 'BaseTemplates'
local ExBaseTmpl = 'ExpansionBaseTemplates'
local Adj2x2Tmpl = 'Adjacency2x2'
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'
local MABC = '/lua/editor/MarkerBuildConditions.lua'
local OAUBC = '/lua/editor/OtherArmyUnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local PCBC = '/lua/editor/PlatoonCountBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local PlatoonFile = '/lua/platoon.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'

local AIAddBuilderTable = import('/lua/ai/AIAddBuilderTable.lua')

# Inside the base location defenses
BuilderGroup {
    BuilderGroupName = 'SorianT1BaseDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 Base D Engineer',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 0,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE STRUCTURE'}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH1 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1AADefense',
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Base D AA Engineer - Response',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE ANTIAIR STRUCTURE'}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2'}},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH1 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Base D PD Engineer - Response',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE DIRECTFIRE STRUCTURE'}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2'}},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Land' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH1 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2BaseDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Base D Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 920,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 15, 'DEFENSE TECH2 STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH2 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D Engineer PD - Response',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE TECH2 DIRECTFIRE STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH2 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D Anti-TML Engineer - Response',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'ANTIMISSILE TECH2 STRUCTURE' }},
            #{ TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Artillery' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH2 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D AA Engineer - Response',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE TECH2 ANTIAIR STRUCTURE' }},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.DEFENSE * categories.TECH3 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE}},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH2 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D Artillery',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'ARTILLERY TECH2 STRUCTURE' }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            #{ TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 10, 'Structures' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            #{ UCBC, 'CheckUnitRange', { 'LocationType', 'T2Artillery', categories.STRUCTURE + ( categories.LAND * ( categories.TECH2 + categories.TECH3 ) ) } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildStructures = {
                    'T2Artillery',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2TMLEngineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, categories.TACTICALMISSILEPLATFORM * categories.STRUCTURE}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ UCBC, 'CheckUnitRange', { 'LocationType', 'T2StrategicMissile', categories.STRUCTURE + ( categories.LAND * ( categories.TECH2 + categories.TECH3 ) ) } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2ArtilleryFormBuilders',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'Sorian T2 TML Silo',
        PlatoonTemplate = 'T2TacticalLauncherSorian',
        Priority = 1,
        InstanceCount = 1000,
        FormRadius = 10000,
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'Sorian T2 Artillery',
        PlatoonTemplate = 'T2ArtilleryStructureSorian',
        Priority = 1,
        InstanceCount = 1000,
        FormRadius = 10000,
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3BaseDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer AA',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 20, 'DEFENSE TECH3 ANTIAIR STRUCTURE'}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH3 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer AA - Exp Response',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 20, 'DEFENSE TECH3 ANTIAIR STRUCTURE'}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, categories.DEFENSE * categories.TECH3 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
			{ UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 0, 'EXPERIMENTAL AIR', 'Enemy'}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2TMLEngineer - Exp Response',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 8, categories.TACTICALMISSILEPLATFORM * categories.STRUCTURE}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
			{ UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 0, 'EXPERIMENTAL LAND', 'Enemy'}},
            #{ UCBC, 'CheckUnitRange', { 'LocationType', 'T2StrategicMissile', categories.STRUCTURE + ( categories.LAND * ( categories.TECH2 + categories.TECH3 ) ) } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer PD',
        PlatoonTemplate = 'UEFT3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 20, 'DEFENSE TECH3 DIRECTFIRE STRUCTURE'}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.TECH3 * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

# Defenses surrounding the base in patrol points
BuilderGroup {
    BuilderGroupName = 'SorianT1PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 Base D Engineer - Perimeter',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 910,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 20, categories.DEFENSE * categories.TECH1 * categories.STRUCTURE}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T1AADefense',
                    'T1GroundDefense',
                    'T1AADefense',
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Base D Engineer - Perimeter',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 930,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 30, categories.DEFENSE * categories.TECH2 * categories.STRUCTURE}},
			#{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH3'}},
			{ UCBC, 'FactoryLessAtLocation', { 'LocationType', 4, 'FACTORY TECH3' }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer - Perimeter',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 30, categories.DEFENSE * categories.TECH3 * categories.STRUCTURE}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T3AADefense',
					'T2GroundDefense',
					'T2MissileDefense',
                    'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

# Defenses at defensive point markers
BuilderGroup {
    BuilderGroupName = 'SorianT1DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 Defensive Point Engineer',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            # Most paramaters freaking ever Build Condition -- All the threat ones are optional
            ####                                   MarkerType   LocRadius  category markerRad unitMax tMin tMax Rings tType
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 350, 'DEFENSE TECH1 STRUCTURE', 20,        5,     0,   1,   2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE STRUCTURE',
                BuildStructures = {
                    'T1AADefense',
                    'T1AADefense',
                    'T1GroundDefense',
                },
            },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Defensive Point Engineer UEF',
        PlatoonTemplate = 'UEFT2EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 1000, 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE', 20, 5, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
					'T2EngineerSupport',
                }
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Defensive Point Engineer Cybran',
        PlatoonTemplate = 'CybranT2EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 1000, 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE', 20, 5, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
					'T2EngineerSupport',
                }
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Defensive Point Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 1000, 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE', 20, 5, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE TECH2 STRUCTURE, DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
                }
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Defensive Point Engineer UEF',
        PlatoonTemplate = 'UEFT3EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 2000, 'DEFENSE TECH3 STRUCTURE', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T3GroundDefense',
                    'T3AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
					'T2EngineerSupport',
                }
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Defensive Point Engineer Cybran',
        PlatoonTemplate = 'CybranT3EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 2000, 'DEFENSE TECH3 STRUCTURE', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T2GroundDefense',
                    'T3AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
					'T2EngineerSupport',
                }
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Defensive Point Engineer',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 2000, 'DEFENSE TECH3 STRUCTURE', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE STRUCTURE' } },
            { UCBC, 'UnitCapCheckLess', { .75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 STRUCTURE',
                BuildStructures = {
                    'T2GroundDefense',
                    'T3AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
					'T2ShieldDefense',
                }
            }
        }
    },
}

# Defenses at naval markers where a naval factory would be built
BuilderGroup {
    BuilderGroupName = 'SorianT1NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 Naval D Engineer',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH1 ANTINAVY', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH1 ANTINAVY',
                BuildStructures = {
                    'T1NavalDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Base D Naval AA Engineer',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH1 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH1 ANTIAIR',
                BuildStructures = {
                    'T1AADefense',
                },
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Naval D Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH2 ANTINAVY', 20, 2, 0, 1, 2, 'AntiSurface' } },
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH2 ANTINAVY',
                BuildStructures = {
                    'T2NavalDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D Naval AA Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH2 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH2 ANTIAIR',
                BuildStructures = {
                    'T2AADefense',
                },
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Naval D Engineer',
        PlatoonTemplate = 'CybranT3EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH3 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 ANTINAVY',
                BuildStructures = {
                    'T3NavalDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Base D Naval AA Engineer',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH3 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.DEFENSE * categories.STRUCTURE - categories.SHIELD - categories.ANTIMISSILE } },
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 ANTIAIR',
                BuildStructures = {
                    'T3AADefense',
                },
            }
        }
    },
}

# Shields
BuilderGroup {
    BuilderGroupName = 'SorianT2Shields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Shield D Engineer Near Energy Production',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 930,
        BuilderConditions = {
            #{ UCBC, 'HaveLessThanUnitsWithCategory', { 10, categories.SHIELD * categories.TECH2 * categories.STRUCTURE}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, categories.SHIELD * categories.TECH2 * categories.STRUCTURE }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiency', { 0.85, 1.3 } },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'SHIELD STRUCTURE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AdjacencyCategory = 'FACTORY, ENERGYPRODUCTION EXPERIMENTAL, ENERGYPRODUCTION TECH3, ENERGYPRODUCTION TECH2',
                AdjacencyDistance = 100,
                BuildClose = false,
                BuildStructures = {
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2ShieldsExpansion',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Shield D Engineer Near Factory Expansion',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            #{ UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.SHIELD * categories.TECH2 * categories.STRUCTURE}},
			{ UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.SHIELD * categories.TECH2 * categories.STRUCTURE }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiency', { 0.85, 1.3 } },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'SHIELD STRUCTURE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AdjacencyCategory = 'FACTORY, ENERGYPRODUCTION EXPERIMENTAL, ENERGYPRODUCTION TECH3, ENERGYPRODUCTION TECH2',
                AdjacencyDistance = 100,
                BuildClose = false,
                BuildStructures = {
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianShieldUpgrades',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'Sorian T2 Shield Cybran 1',
        PlatoonTemplate = 'T2Shield1',
        Priority = 5,
        InstanceCount = 5,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome',  { 5, 150}},
            { MIBC, 'FactionIndex', {3, 3}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'Sorian T2 Shield Cybran 2',
        PlatoonTemplate = 'T2Shield2',
        Priority = 5,
        InstanceCount = 5,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome',  { 5, 200}},
            { MIBC, 'FactionIndex', {3, 3}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'Sorian T2 Shield Cybran 3',
        PlatoonTemplate = 'T2Shield3',
        Priority = 5,
        InstanceCount = 5,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome',  { 5, 300}},
            { MIBC, 'FactionIndex', {3, 3}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'Sorian T2 Shield Cybran 4',
        PlatoonTemplate = 'T2Shield4',
        Priority = 5,
        InstanceCount = 5,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome',  { 5, 400}},
            { MIBC, 'FactionIndex', {3, 3}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'Sorian T2 Shield UEF Seraphim',
        PlatoonTemplate = 'T2Shield',
        Priority = 5,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome',  { 7, 350}},
            { MIBC, 'FactionIndex', {1, 4}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
        },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3Shields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Shield D Engineer Factory Adj',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, categories.SHIELD * categories.TECH3 * categories.STRUCTURE} },
            { MIBC, 'FactionIndex', {1, 2, 4}},
			{ UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'SHIELD STRUCTURE TECH3' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.85, 1.3 }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AdjacencyCategory = 'FACTORY, ENERGYPRODUCTION EXPERIMENTAL, ENERGYPRODUCTION TECH3, ENERGYPRODUCTION TECH2',
                AdjacencyDistance = 100,
                BuildClose = false,
                BuildStructures = {
                    'T3ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Shield D Engineer Factory Adj Cybran',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 16, categories.SHIELD * categories.TECH2 * categories.STRUCTURE} },
            { MIBC, 'FactionIndex', {3}},
			{ UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'SHIELD STRUCTURE TECH2' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.85, 1.3 }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AdjacencyCategory = 'FACTORY, ENERGYPRODUCTION EXPERIMENTAL, ENERGYPRODUCTION TECH3, ENERGYPRODUCTION TECH2',
                AdjacencyDistance = 100,
                BuildClose = false,
                BuildStructures = {
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

# Anti nuke defenses
BuilderGroup {
    BuilderGroupName = 'SorianT3NukeDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Anti-Nuke Engineer Near Factory',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 945,
        BuilderConditions = {
            #{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3 STRUCTURE' } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, categories.ANTIMISSILE * categories.TECH3 * categories.STRUCTURE}},
            { EBC, 'GreaterThanEconIncome', { 2.5, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .95 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                BuildClose = false,
                AdjacencyCategory = 'FACTORY -NAVAL',
                AdjacencyDistance = 100,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Anti-Nuke Engineer - Emerg',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 1000,
        BuilderConditions = {
            #{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3 STRUCTURE' } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.ANTIMISSILE * categories.TECH3 * categories.STRUCTURE}},
            #{ EBC, 'GreaterThanEconIncome', { 2.5, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .95 } },
			{ UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 0, 'NUKE SILO STRUCTURE', 'Enemy'}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                BuildClose = false,
                AdjacencyCategory = 'FACTORY -NAVAL',
                AdjacencyDistance = 100,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Anti-Nuke Engineer - Emerg 2',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 960,
        BuilderConditions = {
            #{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ANTIMISSILE TECH3 STRUCTURE' } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3 STRUCTURE' } },
			{ SBC, 'HaveComparativeUnitsWithCategoryAndAlliance', { true, categories.ANTIMISSILE * categories.TECH3 * categories.STRUCTURE, categories.STRUCTURE * categories.NUKE * categories.TECH3, 'Enemy'}},
            #{ EBC, 'GreaterThanEconIncome', { 2.5, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .95 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                BuildClose = false,
                AdjacencyCategory = 'FACTORY -NAVAL',
                AdjacencyDistance = 100,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3NukeDefenseBehaviors',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'Sorian T3 Anti Nuke Silo',
        PlatoonTemplate = 'T3AntiNuke',
        Priority = 5,
        InstanceCount = 20,
        BuilderConditions = {
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.STRUCTURE * categories.TECH3 * categories.ANTIMISSILE}},
            },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT1LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 Base D Engineer - Light',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'DEFENSE STRUCTURE'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1GroundDefense',
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Base D Engineer - Light - Emerg AA',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 1200,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, 'DEFENSE ANTIAIR STRUCTURE'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Base D Engineer - Light - Emerg PD',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 1200,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, 'DEFENSE DIRECTFIRE STRUCTURE'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2MissileDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2MissileDefenseEng',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'ANTIMISSILE TECH2 STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T2 Base D Anti-TML Engineer - Emerg Response',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 1200,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'ANTIMISSILE TECH2' }},
            { SBC, 'GreaterThanEnemyUnitsAroundBase', { 'LocationType', 0, 'TACTICALMISSILEPLATFORM TECH2 STRUCTURE', 256 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, categories.ANTIMISSILE * categories.TECH2 } },
            { UCBC, 'UnitCapCheckLess', { .9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Base D Engineer - Light',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE TECH2 STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
					'T2Artillery',
					'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian Light T2 Artillery',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, 'ARTILLERY TECH2 STRUCTURE' }},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            #{ TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 10, 'Structures' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            #{ UCBC, 'CheckUnitRange', { 'LocationType', 'T2Artillery', categories.STRUCTURE + ( categories.LAND * ( categories.TECH2 + categories.TECH3 ) ) } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildStructures = {
                    'T2Artillery',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian Light T2TML',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.TACTICALMISSILEPLATFORM}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
            #{ UCBC, 'CheckUnitRange', { 'LocationType', 'T2StrategicMissile', categories.STRUCTURE + ( categories.LAND * ( categories.TECH2 + categories.TECH3 ) ) } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer AA - Light',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE TECH3 ANTIAIR STRUCTURE'}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T3 Base D Engineer PD - Light',
        PlatoonTemplate = 'UEFT3EngineerBuilderSorian',
        Priority = 875,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, 'DEFENSE TECH3 DIRECTFIRE STRUCTURE'}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

# Misc Defenses
BuilderGroup {
    BuilderGroupName = 'SorianMiscDefensesEngineerBuilders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Air Staging Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.AIRSTAGINGPLATFORM}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AirStagingPlatform',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'Sorian T1 Engineer Reclaim Enemy Walls',
        PlatoonTemplate = 'EngineerBuilderSorian',
        PlatoonAIPlan = 'ReclaimUnitsAI',
        Priority = 975,
        BuilderConditions = {
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENGINEER * categories.TECH1}},
                { UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 10, categories.WALL, 'Enemy'}},
            },
        BuilderType = 'Any',
        BuilderData = {
            Radius = 1000,
            Categories = {'WALL'},
            ThreatMin = -10,
            ThreatMax = 10000,
            ThreatRings = 1,
        },
    },
    Builder {
        BuilderName = 'Sorian T2 Engineer Reclaim Enemy Walls',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        PlatoonAIPlan = 'ReclaimUnitsAI',
        Priority = 975,
        BuilderConditions = {
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENGINEER * categories.TECH2}},
                { UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 10, categories.WALL, 'Enemy'}},
            },
        BuilderType = 'Any',
        BuilderData = {
            Radius = 1000,
            Categories = {'WALL'},
            ThreatMin = -10,
            ThreatMax = 10000,
            ThreatRings = 1,
        },
    },
    Builder {
        BuilderName = 'Sorian T3 Engineer Reclaim Enemy Walls',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        PlatoonAIPlan = 'ReclaimUnitsAI',
        Priority = 975,
        BuilderConditions = {
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENGINEER * categories.TECH3}},
                { UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 10, categories.WALL, 'Enemy'}},
            },
        BuilderType = 'Any',
        BuilderData = {
            Radius = 1000,
            Categories = {'WALL'},
            ThreatMin = -10,
            ThreatMax = 10000,
            ThreatRings = 1,
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT1ACUDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T1 ACU D Engineer',
        PlatoonTemplate = 'EngineerBuilderSorian',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE STRUCTURE'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2ACUDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 ACU D Engineer',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'DEFENSE TECH2 STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T2AADefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT2ACUShields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T2 Shield D Engineer Near ACU',
        PlatoonTemplate = 'T2EngineerBuilderSorian',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 4, categories.ENGINEER * categories.TECH2}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH2 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.SHIELD * categories.TECH2 * categories.STRUCTURE}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { MIBC, 'FactionIndex', {2} },
            { EBC, 'GreaterThanEconEfficiency', { 0.9, 1.2 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}


BuilderGroup {
    BuilderGroupName = 'SorianT3ACUShields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Shield D Engineer Near ACU',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 8, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, categories.SHIELD * categories.STRUCTURE} },
            { MIBC, 'FactionIndex', {1, 2, 4}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T3ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'SorianT3ACUNukeDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'Sorian T3 Anti-Nuke Engineer Near ACU',
        PlatoonTemplate = 'T3EngineerBuilderSorian',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
			{ UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3 STRUCTURE' } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.ANTIMISSILE * categories.TECH3 * categories.STRUCTURE}},
            #{ EBC, 'GreaterThanEconIncome', { 2.5, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}