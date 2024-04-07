ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Atherium Mine"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category  = "Resource System"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "atheriumamounts")
end