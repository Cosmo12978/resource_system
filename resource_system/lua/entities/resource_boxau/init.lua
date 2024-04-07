AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )


function ENT:Initialize()
self.Entity:SetModel( "models/props_junk/wood_crate001a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
self:Setcargoamount(0)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end 
end
 

function ENT:Use(ply)
 
   if ply:HasWeapon("ath_box_swep") then
      DarkRP.notify(ply, 1,3, "You dropped off Atherium! " )
      ply:StripWeapon("ath_box_swep")
      ply:SetWalkSpeed(200)
      ply:SetRunSpeed(400)
      ply:SetSlowWalkSpeed(150)
      self:Setcargoamount(self:Getcargoamount() + 1)
      else
         if self:Getcargoamount() >= 1 then
            if ply:HasWeapon("box_swep") or  ply:HasWeapon("ath_box_swep") then
               DarkRP.notify(ply, 1,3, "You can only carry one crate at a time! " )
               else
         self:Setcargoamount(self:Getcargoamount() - 1)
         ply:Give("ath_box_swep")
         DarkRP.notify(ply, 1,3, "You took Atherium! " )
               end
         end
      end

end 

  

function ENT:Think()
if self:Getcargoamount() <=0  then
   self:Setcargoamount(0)
end

end