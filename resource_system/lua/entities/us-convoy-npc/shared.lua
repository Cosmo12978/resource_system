ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "US Convoy NPC"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

USCONVOY= USCONVOY or {}
USCONVOY.Cfg = USCONVOY.Cfg or {}

USCONVOY.Cfg.SpawnPos = {
    vec = Vector(8712, 14487, 200),
    ang = Angle(0, -90, 0),
}

USCONVOY.Cfg.SpawnBox = {
    minPos = Vector(  8821, 14668, 100),
    maxPos = Vector(-10357, -13642, 136),
}

USCONVOY.Cars = {
    {
        carname = "Convoy Truck",
        carpath = "sw_ural4320_troop",
    },


}


