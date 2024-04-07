ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "US Ground Dealer"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

USGROUNDDEALER = USGROUNDDEALER or {}
USGROUNDDEALER.Cfg = USGROUNDDEALER.Cfg or {}

USGROUNDDEALER.Cfg.SpawnPos = {
    vec = Vector(9215, 14404, 211),
    ang = Angle(0, -90, 0),
}

USGROUNDDEALER.Cfg.SpawnBox = {
    minPos = Vector(  9334, 14562, 114),
    maxPos = Vector(9106, 14240, 80),
}

USGROUNDDEALER.Cars = {
    {
        carname = "Willy Jeep",
        resource = 0,  
        carpath = "lvs_wheeldrive_dodwillyjeep",
    },

    {
        carname = "Humvee M134",
        resource = 250,  
        carpath = "sw_humvee_m134",
    },


}


