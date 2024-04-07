AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

util.AddNetworkString( "Operationirongate.USGroundDealer" )
util.AddNetworkString( "Operationirongate.USGroundDealerPurchese" )

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


	if ply:getJobTable().category=="Civil Protection" then  

		PrintTable(USGROUNDDEALER.Cars)

		net.Start("Operationirongate.USGroundDealer")
		net.Send(activator)
	end
end


net.Receive("Operationirongate.USGroundDealerPurchese", function(len, ply)
	print(ply:GetNWBool("Spawncooldown"))
	local id = net.ReadInt(32)
	print("MEOW")
	local carData = USGROUNDDEALER.Cars[id]
	if not carData then return end

	local pos1 = USGROUNDDEALER.Cfg.SpawnBox.minPos
	local pos2 = USGROUNDDEALER.Cfg.SpawnBox.maxPos
	local carinbox = false
	local orgin_ents = ents.FindInBox(pos1, pos2)

	if  table.Count(orgin_ents) >= 3 then
		carinbox = true 
	else
		carinbox = false
	end

	if ply:GetNWBool("Spawncooldown") == false then
		

	


	if carinbox == false then


	if GetGlobalInt("USTICKETS") >= carData.resource then
		SetGlobalInt("USTICKETS", GetGlobalInt("USTICKETS") - carData.resource)
		DarkRP.notify(ply, 3,3,carData.carname .." Has spawned succesfully") 
        ply:SetNWBool("Spawncooldown", true)

		local carspawned = ents.Create(carData.carpath )
		carspawned:SetPos( USGROUNDDEALER.Cfg.SpawnPos.vec )
		carspawned:SetAngles( USGROUNDDEALER.Cfg.SpawnPos.ang )
		carspawned:SetCreator(ply)
		carspawned:Spawn()
		carspawned:Activate()
		timer.Simple( 5, function() ply:SetNWBool("Spawncooldown", false) end )
		
        
		local phys = carspawned:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:EnableMotion(false)
			phys:Wake()
		end
			
	else
		DarkRP.notify(ply, 1,3, "Not enough resources to spawn ".. carData.carname.. "!" ) 

	end

else
	DarkRP.notify(ply, 1,3, "Clear the spawn area! ") 
end
else
	DarkRP.notify(ply, 1,3, "Your on spawn cooldown! ") 
	
	
end

end)
