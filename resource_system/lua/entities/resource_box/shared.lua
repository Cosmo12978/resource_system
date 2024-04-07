ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Resource Box"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "cargoamount")
end
