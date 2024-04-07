AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )



function ENT:Initialize()
self.Entity:SetModel( "models/props_lab/monitor02.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
self:SetUSCAP(false)
self:SetRUCAP(false)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.Delay = 5
self.nextOccurance = 0
end

function ENT:Use(ply)

---local jobs = ply:getJobTable() 

---print(table.ToString(jobs))

if ply:getJobTable().category=="Civil Protection" then  
	if self:GetUSCAP() == true then
end
end
if ply:getJobTable().category=="Civil Protection" then  
	if self:GetRUCAP() == true then
		self:SetUSCAP(true)
		self:SetRUCAP(false)
end
end
if ply:getJobTable().category=="Civil Protection" then  
	if self:GetRUCAP() == false then
		self:SetUSCAP(true)
end
end



if ply:getJobTable().category=="Gangsters" then  
	if self:GetRUCAP() == true then
end
end
if ply:getJobTable().category=="Gangsters" then  
	if self:GetUSCAP() == true then
		self:SetUSCAP(false)
		self:SetRUCAP(true)
end
end
if ply:getJobTable().category=="Gangsters" then  
	if self:GetUSCAP() == false then
		self:SetRUCAP(true)
end
end

end


function ENT:Think()


if self:GetRUCAP() == true and self:GetUSCAP() == true then
	self:SetRUCAP(false)
	self:SetUSCAP(false)
end
if self:GetUSCAP() == true then
local ustimeLeft = self.nextOccurance - CurTime()
if ustimeLeft < 0 then 
		print("US CAP")
		SetGlobalInt("USTICKETS", GetGlobalInt("USTICKETS") + 10) 
		self.nextOccurance = CurTime() + self.Delay
	end
end


if self:GetRUCAP() == true then
local rutimeLeft = self.nextOccurance - CurTime()
if rutimeLeft < 0 then 
			SetGlobalInt("RUTICKETS", GetGlobalInt("RUTICKETS") + 10) 
		print("RU CAP")
		self.nextOccurance = CurTime() + self.Delay
	end
end


end