ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Terminal"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", false, "USCAP")
	self:NetworkVar("Bool", false, "RUCAP")
	self:NetworkVar("Int", math.Rand( 5, 15 ), "Randomtime")
end