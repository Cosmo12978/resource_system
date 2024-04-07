AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )


function ENT:Initialize()
self.Entity:SetModel( "models/Items/item_item_crate.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
self.Entity:SetCollisionGroup(COLLISION_GROUP_WORLD)
self.Entity:DrawShadow(false)
self:Setatheriumamounts(0)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.delay = 9999
self.shouldOccur = false
self.OurHealth = 25; 
end
 


function ENT:Use(ply) 
 

   if ply:HasWeapon("box_swep") or  ply:HasWeapon("ath_box_swep") then
      DarkRP.notify(ply, 1,3, "You can only carry one cargo at a time! " )
      else
         if self:Getatheriumamounts() >= 0 then
         DarkRP.notify(ply, 1,3, "You picked up cargo, bring this back to FOB or cargo truck! " )
         self:Setatheriumamounts(self:Getatheriumamounts() - 1)
         ply:Give("ath_box_swep")
         if self:Getatheriumamounts() <= 0 then
            self:Remove()
            end
      end
   end
end


function ENT:OnTakeDamage(dmg)
   self:TakePhysicsDamage(dmg);

   if(self.OurHealth <= 0) then return; end 

   self.OurHealth = self.OurHealth - dmg:GetDamage(); 

   if(self.OurHealth <= 0) then 
	self:EmitSound( "physics/wood/wood_box_break2.wav" )
	   self:Remove(); 
   end
end


function ENT:Think()
if self.shouldOccur == true then
	self:Remove()
else
		timer.Simple( self.delay, function() self.shouldOccur = true end )
      end
end
