AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )



function ENT:Initialize()
self.Entity:SetModel( "models/props_wasteland/laundry_cart002.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
self:Setatheriumamounts(0)
self:Setdestroyed(false)
self.OurHealth = 400;
self.Destroy = false
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end

function ENT:Use(ply)
if ply:getJobTable().category=="Gangsters" then  
    if ply:HasWeapon("box_swep") then
        DarkRP.notify(ply, 1,3, "You dropped off cargo! " )
        ply:StripWeapon("box_swep")
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(400)
        ply:SetSlowWalkSpeed(150)
        SetGlobalInt("RUTICKETS",GetGlobalInt("RUTICKETS") + 5)
    end

    if ply:HasWeapon("ath_box_swep") then
        DarkRP.notify(ply, 1,3, "You dropped off Atherium! " )
        ply:StripWeapon("ath_box_swep")
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(400)
        ply:SetSlowWalkSpeed(150)
        SetGlobalInt("RUATHERIUM",GetGlobalInt("RUATHERIUM") + 1)
    end

 
end
end

function ENT:Think()
    SetGlobalInt("RUATHERIUM",GetGlobalInt("RUATHERIUM"))
    SetGlobalInt("RUTICKETS",GetGlobalInt("RUTICKETS") )

    if self:Getdestroyed() == true then
        self:SetMaterial("Models/effects/vol_light001")
        self:SetCollisionGroup(COLLISION_GROUP_WORLD)
		timer.Simple( 400, function() self:Setdestroyed(false) self:Getdestroyed(false) self.OurHealth = 400 end )
    else
        self:SetMaterial("")
        self:SetCollisionGroup(COLLISION_GROUP_NONE)
    end


end


 
function ENT:OnTakeDamage(dmg)
   self:TakePhysicsDamage(dmg);
   if self:Getdestroyed() == false then
   if(self.OurHealth <= 0) then return; end 

   self.OurHealth = self.OurHealth - dmg:GetDamage(); 

   if(self.OurHealth <= 0) then 
    self:EmitSound( "physics/metal/metal_box_break1.wav" )
    self:Setdestroyed(true)
    if GetGlobalInt("RUATHERIUM") >= 0 then
        local crate = ents.Create( "atherium_box" )
    crate:SetPos( self:GetPos() + Vector(0,0,40) )
    crate:Spawn()
    crate:Setatheriumamounts(GetGlobalInt("RUATHERIUM") /2)
    SetGlobalInt("RUATHERIUM", GetGlobalInt("RUATHERIUM") /2)
    else
        SetGlobalInt("RUATHERIUM",GetGlobalInt("RUATHERIUM") /2 )
        SetGlobalInt("RUTICKETS",GetGlobalInt("RUTICKETS") /2 )

    end

   end
   end
end