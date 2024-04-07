
hook.Add( "PlayerDeath", "Atheriumdrop", function( victim, ply )
    local dropamount = victim:GetNWInt("playeratheriumhandler")
    victim:SetNWInt("playeratheriumhandler", 0)
    if dropamount >= 1 then
        DarkRP.notify(ply, 1,3, "You dropped ".. dropamount.. " atherium!" )
    local crate = ents.Create( "atherium_box" )
    crate:SetPos( ply:GetPos() )
    crate:Spawn()
    crate:Setatheriumamounts(dropamount)
    else
    end
end )


hook.Add( "PlayerDisconnected", "Atheriumdroponleave", function(ply)
    local dropamount = ply:GetNWInt("playeratheriumhandler")
    ply:SetNWInt("playeratheriumhandler", 0)
    if dropamount >= 1 then
    local crate = ents.Create( "atherium_box" )
    crate:SetPos( ply:GetPos() )
    crate:Spawn()
    crate:Setatheriumamounts(dropamount)
    else
    end
end )


hook.Add( "PlayerSay", "atheriumcommands", function( ply, text )
	if ( string.lower( text ) == "/carrying" ) then
		ply:ChatPrint( "Your currently carrying ".. ply:GetNWInt("playeratheriumhandler").." atherium!" )
		return "" 
	end
	if ( string.lower( text ) == "/dropcarrying" ) then
        local dropamount = ply:GetNWInt("playeratheriumhandler")
        ply:SetNWInt("playeratheriumhandler", 0)
        if dropamount >= 1 then
        ply:ChatPrint( "You just dropped ".. dropamount.." atherium!" )
        local crate = ents.Create( "atherium_box" )
        crate:SetPos( ply:GetPos() )
        crate:Spawn()
        crate:Setatheriumamounts(dropamount)
        else
        
            ply:ChatPrint( "You don't have atherium to drop!" )
            
        end
        return ""
    end


		


end )