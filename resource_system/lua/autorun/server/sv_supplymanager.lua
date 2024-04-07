util.AddNetworkString( "Operationirongate.resourcemenu" )

SetGlobalInt("USTICKETS", 25000)
SetGlobalInt("RUTICKETS", 25000)
SetGlobalInt("USATHERIUM", 0)
SetGlobalInt("RUATHERIUM", 0)

SetGlobalBool("RAIDONUS", false)
SetGlobalBool("RAIDONRU", false)

SetGlobalBool("USCONVOY", false)
SetGlobalBool("RUCONVOY", false)


hook.Add( "Think", "$#ticketlogic$#", function()
if GetGlobalInt("USTICKETS") <= 0 then
    SetGlobalInt("USTICKETS", 0)
 end

 if GetGlobalInt("RUTICKETS") <= 0 then
    SetGlobalInt("RUTICKETS", 0)
 end
 
 if GetGlobalInt("USATHERIUM") <= 0 then
    SetGlobalInt("USATHERIUM", 0)
 end

 if GetGlobalInt("RUATHERIUM") <= 0 then
    SetGlobalInt("RUATHERIUM", 0)
 end
 

end )



