AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

util.AddNetworkString( "Operationirongate.Convoymenu1" )
util.AddNetworkString( "Operationirongate.Convoystart1" )

function ENT:Initialize()
	self.Entity:SetModel( "models/breen.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )     
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
	self.Entity:SetSolid( SOLID_BBOX ) 
	self.Entity:DrawShadow(false)
	self.Entity:SetUseType(SIMPLE_USE)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:EnableMotion(false)
		phys:Wake()
	end
end

function ENT:Use(ply, activator)
	if ply:getJobTable().category=="Russia" then  
		net.Start("Operationirongate.Convoymenu")
		net.Send(activator)
	end
end



net.Receive("Operationirongate.Convoystart", function(len, ply)
	local id = net.ReadInt(32)
	local carData = RUCONVOY.Cars[id]
	if not carData then return end

	local pos1 = RUCONVOY.Cfg.SpawnBox.minPos
	local pos2 = RUCONVOY.Cfg.SpawnBox.maxPos
	local carinbox = false
	local orgin_ents = ents.FindInBox(pos1, pos2)

	if  table.Count(orgin_ents) >= 3 then
		carinbox = true 
	else
		carinbox = false
	end

	
		

	if GetGlobalBool("USCONVOY") == false then

		if ply:GetNWBool("Spawncooldown") == false then
	if carinbox == false then
		DarkRP.notify(ply, 3,3,carData.carname .." Has spawned succesfully") 
		ply:SetNWBool("Spawncooldown", true)
		local carspawned = ents.Create(carData.carpath )
		carspawned:SetPos( RUCONVOY.Cfg.SpawnPos.vec )
		carspawned:SetAngles( RUCONVOY.Cfg.SpawnPos.ang )
		carspawned:SetCreator(ply)
		carspawned:Spawn()
		carspawned:Activate()
		--SetGlobalBool("USCONVOY", true)
		timer.Simple( 60, function() ply:SetNWBool("Spawncooldown", false) end )
		
        
		local phys = carspawned:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:EnableMotion(false)
			phys:Wake()
		end

		local rack = ents.Create("resource_box") 
  rack:SetParent(carspawned)
  rack:SetCollisionGroup(COLLISION_GROUP_WORLD) 
  rack:SetLocalPos(Vector(-130,-30,80)) 
  rack:SetLocalAngles(Angle(0, 0, 0))
  rack:Spawn() -- spawn it

  local rack1 = ents.Create("resource_boxau") 
  rack1:SetParent(carspawned)
  rack1:SetCollisionGroup(COLLISION_GROUP_WORLD) 
  rack1:SetLocalPos(Vector(-130,30,80)) 
  rack1:SetLocalAngles(Angle(0, 0, 0))
  rack1:Spawn() -- spawn it
else
	DarkRP.notify(ply, 1,3, "Clear the spawn area! ") 
end
else
	DarkRP.notify(ply, 1,3, "There is already a convoy in progress! ") 
end
end
end)
