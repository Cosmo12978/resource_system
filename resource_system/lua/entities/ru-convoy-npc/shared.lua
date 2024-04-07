ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "RU Convoy NPC"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

RUCONVOY= RUCONVOY or {}
RUCONVOY.Cfg = RUCONVOY.Cfg or {}

RUCONVOY.Cfg.SpawnPos = {
    vec = Vector(-9163,-10782, 208),
    ang = Angle(0, 180, 0),
}

RUCONVOY.Cfg.SpawnBox = {
    minPos = Vector( -9014, -10865, 100),
    maxPos = Vector( -9329, -10699, 82),
}

RUCONVOY.Cars = {
    {
        carname = "Convoy Truck",
        carpath = "sw_ural4320_troop",
    },


}


