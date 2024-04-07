local us = Material( "materials/ticketpng/Flag_of_US.png", "noclamp smooth" )
local ru = Material( "materials/ticketpng/Flag_of_Russia.svg.png", "noclamp smooth" )
hook.Add("HUDPaint", "MyAddonHUD", function()
draw.RoundedBox(4, 1720, ScrH() - 1077, 200, 120, Color(25,25,25,200))

surface.SetMaterial( us )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 1730, ScrH() - 1070, 50, 50 )

surface.SetMaterial( ru )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 1730, ScrH() - 1015, 50, 50 )
draw.SimpleText( "Resources: "..GetGlobalInt("USTICKETS"), "DermaDefault", 1790, ScrH() - 1065, color_white )
draw.SimpleText( "Atherium: "..GetGlobalInt("USATHERIUM"), "DermaDefault", 1790, ScrH() - 1045, color_white )
draw.SimpleText( "Resources: "..GetGlobalInt("RUTICKETS"), "DermaDefault", 1790, ScrH() - 1008, color_white )
draw.SimpleText( "Atherium: "..GetGlobalInt("RUATHERIUM"), "DermaDefault", 1790, ScrH() - 988, color_white )

end)
  
/*
hook.Add("PostDrawTranslucentRenderables", "TestPlayerInBox2", function()

    --The box coordinates
    local boxStart  = Vector( -9014, -10865, 100)
    local boxEnd    = Vector( -9329, -10699, 82)

    --The coordinate to test (the player position)
    local testCoord = LocalPlayer():GetPos()

    --- if player in
   
 
    --Draw the box
    render.DrawWireframeBox(Vector(0,0,0), Angle(0,0,0), boxStart, boxEnd, col, true)

end)

*/ 

