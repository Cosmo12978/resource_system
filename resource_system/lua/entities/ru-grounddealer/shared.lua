ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "RU Ground Dealer"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

RUGROUNDDEALER = RUGROUNDDEALER or {}
RUGROUNDDEALER.Cfg = RUGROUNDDEALER.Cfg or {}

RUGROUNDDEALER.Cfg.SpawnPos = {
    vec = Vector(-10277, -13493, 211),
    ang = Angle(0, 90, 0),
}

RUGROUNDDEALER.Cfg.SpawnBox = {
    minPos = Vector( -10413, -13769, 114),
    maxPos = Vector(-10168, -13236, 80 ),
}

RUGROUNDDEALER.Cars = {
    {
        carname = "Willy Jeep",
        resource = 250,  
        carpath = "lvs_wheeldrive_dodwillyjeep",
    },


}


