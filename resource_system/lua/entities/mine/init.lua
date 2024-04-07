AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )



function ENT:Initialize()
self.Entity:SetModel( "models/props_wasteland/laundry_washer003.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
self:Setatheriumamounts(0)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.minedelay = 60
self.nextmineOccurance = 0
end

function ENT:Use(ply)

if ply:getJobTable().category=="Civil Protection" or ply:getJobTable().category=="Gangsters" then  
if self:Getatheriumamounts() <= 0 then
else
	if ply:HasWeapon("ath_box_swep") or ply:HasWeapon("box_swep") then DarkRP.notify(ply, 1,3, "You can only carry one cargo at a time! " ) else
	self:Setatheriumamounts(self:Getatheriumamounts() - 1)
	ply:Give("ath_box_swep")
	DarkRP.notify(ply, 1,3, "You collected an Atherium Box! ") 
	end
end
end
end


function ENT:Think()
	local timeLeft = self.nextmineOccurance - CurTime()
	if timeLeft < 0 then 
		if self:Getatheriumamounts() >=12 then else
		self:Setatheriumamounts(self:Getatheriumamounts() + 1)
		self.nextmineOccurance = CurTime() + self.minedelay
		end
	end
end