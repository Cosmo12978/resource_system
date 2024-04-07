ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "RU Air Dealer"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

RUAIRDEALER = RUAIRDEALER or {}
RUAIRDEALER.Cfg = RUAIRDEALER.Cfg or {}

RUAIRDEALER.Cfg.SpawnPos = {
    vec = Vector(-7736, -13449, 212),
    ang = Angle(0, 90, 0),
}

RUAIRDEALER.Cfg.SpawnBox = {
    minPos = Vector(  -7457, -13154, 120 ),
    maxPos = Vector(-8065, -13710, 78),
}

RUAIRDEALER.Cars = {
    {
        carname = "Rebel Helicopter",
        resource = 250,  
        carpath = "lunasflightschool_rebelheli",
    },


}


