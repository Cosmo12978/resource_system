ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "US Air Dealer"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

USAIRDEALER = USAIRDEALER or {}
USAIRDEALER.Cfg = USAIRDEALER.Cfg or {}

USAIRDEALER.Cfg.SpawnPos = {
    vec = Vector(7516, 11767, 212),
    ang = Angle(0, 0, 0),
}

USAIRDEALER.Cfg.SpawnBox = {
    minPos = Vector(  7700, 11480, 120 ),
    maxPos = Vector(7207, 12039, 78 ),
}

USAIRDEALER.Cars = {
    {
        carname = "Rebel Helicopter",
        resource = 250,  
        carpath = "lunasflightschool_rebelheli",
    },


}


