SWEP.PrintName = "Atherium Box"
SWEP.Author = "Cosmos"
SWEP.Category = "Resource System"
SWEP.Purpose = ""
SWEP.Instructions = "Bring this to FOB or Convoy Truck"
 
SWEP.Spawnable = true

SWEP.ViewModel = ""
SWEP.WorldModel = "models/Items/item_item_crate_dynamic.mdl"
SWEP.DrawCrosshair 		= false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = true
SWEP.Slot = 1
SWEP.SlotPos = 1		
SWEP.HoldType = "duel"
SWEP.Primary.Ammo = "none"
SWEP.Secondary.Ammo = "none"

if CLIENT then
	local WorldModel = ClientsideModel(SWEP.WorldModel)

	-- Settings...
	WorldModel:SetSkin(1)
	WorldModel:SetNoDraw(true)

	function SWEP:DrawWorldModel()
		local _Owner = self:GetOwner()

		if (IsValid(_Owner)) then
            -- Specify a good position
			local offsetVec = Vector(8, -2.7, 12)
			local offsetAng = Angle(180, 90, 0)
			
			local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
			if !boneid then return end

			local matrix = _Owner:GetBoneMatrix(boneid)
			if !matrix then return end

			local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

			WorldModel:SetPos(newPos)
			WorldModel:SetAngles(newAng)

            WorldModel:SetupBones()
		else
			WorldModel:SetPos(self:GetPos())
			WorldModel:SetAngles(self:GetAngles())
		end

		WorldModel:DrawModel()
	end
end	

function SWEP:Think()
    playerholder = self:GetOwner()
    playerholder:SetWalkSpeed(70)
    playerholder:SetRunSpeed(70)
    playerholder:SetSlowWalkSpeed(70)

end
function SWEP:Equip()
playerholder = self:GetOwner()
playerholder:SetWalkSpeed(70)
playerholder:SetRunSpeed(70)
playerholder:SetSlowWalkSpeed(70)
playerholder:SelectWeapon( "ath_box_swep" )
end


function SWEP:Holster( wep )
	return false
end


function SWEP:Reload()
	if (!SERVER) then return end;
	playerholder = self:GetOwner()
	 playerholder:SetWalkSpeed(200)
	 playerholder:SetRunSpeed(400)
	 playerholder:SetSlowWalkSpeed(150)
	self:dropcrate()
end



function SWEP:PrimaryAttack() 
	end

function SWEP:SecondaryAttack()

	end

	function SWEP:dropcrate ()
		if (!SERVER) then return end; 

	local ent = ents.Create ("atherium_box");
	ent:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector() * 16));
	ent:SetAngles (self.Owner:EyeAngles());
	ent:Spawn();
	ent:Setatheriumamounts(1)
	self:GetOwner():StripWeapon( "ath_box_swep" )
	local phys = ent:GetPhysicsObject();
	end