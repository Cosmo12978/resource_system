ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "US Atherium Storage"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "atheriumamounts")
	self:NetworkVar("Int", 0, "cargoamounts")
	self:NetworkVar("Bool", false, "destroyed")
end