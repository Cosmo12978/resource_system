include("shared.lua")
surface.CreateFont( "Airdrop NPC Font", {
	font = "akbar", 
	extended = false,
	size = 50,
	weight = 700,


} )


surface.CreateFont( "Title Font", {
	font = "Default", 
	extended = true,
	size = 55,
	weight = 700,


} )

surface.CreateFont( "Describe Font", {
	font = "Default", 
	extended = false,
	size = 14,
	weight = 700,
} )

surface.CreateFont( "Resource Font", {
	font = "Default", 
	extended = false,
	size = 12,
	weight = 700,
} )

function ENT:Draw()


self:DrawModel()


end

net.Receive( "Operationirongate.USGroundDealer", function()

	local airdropmaster = vgui.Create( "DFrame" ) 	
airdropmaster:SetPos(480,100)			
airdropmaster:SetSize( 900, 900 ) 				
airdropmaster:SetTitle( "" ) 		
airdropmaster:MakePopup("Airdrop NPC Font")
airdropmaster:SetDraggable(false)
airdropmaster:SetBackgroundBlur(true)
airdropmaster:ShowCloseButton(false)
airdropmaster.Paint = function()
	draw.RoundedBox( 20, 0, 0, airdropmaster:GetWide(), airdropmaster:GetTall(), Color( 38, 41, 39, 255 ) )
end


local title = vgui.Create( "DLabel", airdropmaster )
title:SetPos( 200, 0 )
title:SetAutoStretchVertical(true)
title:SetWrap( true )
title:SetColor(Color(255, 255, 255))
title:SetSize(1000,50)
title:SetFont("Title Font")
title:SetText("Ground Vehicle Dealer")

local car1 = vgui.Create( "DFrame", airdropmaster)	
car1:SetPos( 50, 100 )		
car1:SetSize( 160, 160 ) 				
car1:SetTitle( "" ) 		
car1:SetDraggable(false)
car1:ShowCloseButton(false)
car1.Paint = function()
	draw.RoundedBox( 0, 0, 0, airdropmaster:GetWide(), airdropmaster:GetTall(), Color( 70, 70, 70, 255 ) )
end

local car1img = vgui.Create("DImage", car1)
car1img:SetPos(5, 5)
car1img:SetSize(150, 150)		
car1img:SetImage("entities/lvs_wheeldrive_dodwillyjeep.png")


local car1button = vgui.Create( "DButton", car1 ) 
car1button:SetText( "Spawn" )					
car1button:SetPos( 27, 140 )					
car1button:SetSize( 100, 20 )	
car1button:SetColor(Color(240,240,240,255))
car1button.Paint = function() 
    surface.SetDrawColor( 90, 90, 90,255 ) 
    surface.DrawRect( 0, 0, car1button:GetWide(), car1button:GetTall())
  	end				
car1button.DoClick = function()				
			net.Start("Operationirongate.USGroundDealerPurchese")
            net.WriteInt(1,32)
            net.SendToServer()
end


local car1DLabel = vgui.Create( "DLabel", car1 )
car1DLabel:SetPos( 50, 10 )
car1DLabel:SetSize(1000,60)
car1DLabel:SetText( "Willys Jeep" )
car1DLabel:SetFont("Describe Font")
car1DLabel:SetWrap(true)
car1DLabel:SetAutoStretchVertical(true)

local car1resourceDLabel = vgui.Create( "DLabel", car1 )
car1resourceDLabel:SetPos( 30, 25 )
car1resourceDLabel:SetSize(1000,60)
car1resourceDLabel:SetText( "Resource Cost: Free" )
car1resourceDLabel:SetFont("Resource Font")
car1resourceDLabel:SetWrap(true)
car1resourceDLabel:SetAutoStretchVertical(true)



------------------------------------------------------------------------------------


local car2 = vgui.Create( "DFrame", airdropmaster)	
car2:SetPos( 250, 100 )		
car2:SetSize( 160, 160 ) 				
car2:SetTitle( "" ) 		
car2:SetDraggable(false)
car2:ShowCloseButton(false)
car2.Paint = function()
	draw.RoundedBox( 0, 0, 0, airdropmaster:GetWide(), airdropmaster:GetTall(), Color( 70, 70, 70, 255 ) )
end

local car2img = vgui.Create("DImage", car2)
car2img:SetPos(5, 5)
car2img:SetSize(150, 150)		
car2img:SetImage("entities/sw_humvee_m134.png")


local car2button = vgui.Create( "DButton", car2 ) 
car2button:SetText( "Spawn" )					
car2button:SetPos( 27, 140 )					
car2button:SetSize( 100, 20 )	
car2button:SetColor(Color(240,240,240,255))
car2button.Paint = function() 
    surface.SetDrawColor( 90, 90, 90,255 ) 
    surface.DrawRect( 0, 0, car2button:GetWide(), car2button:GetTall())
  	end				
	  car2button.DoClick = function()				
			net.Start("Operationirongate.USGroundDealerPurchese")
            net.WriteInt(2,32)
            net.SendToServer()
end


local car2DLabel = vgui.Create( "DLabel", car2 )
car2DLabel:SetPos( 30, 10 )
car2DLabel:SetSize(1000,60)
car2DLabel:SetText( "Humvee M134" )
car2DLabel:SetFont("Describe Font")
car2DLabel:SetWrap(true)
car2DLabel:SetColor(Color(0,0,0))
car2DLabel:SetAutoStretchVertical(true)

local car2resourceDLabel = vgui.Create( "DLabel", car2 )
car2resourceDLabel:SetPos( 30, 25 )
car2resourceDLabel:SetSize(1000,60)
car2resourceDLabel:SetColor(Color(0,0,0))
car2resourceDLabel:SetText( "Resource Cost: 250" )
car2resourceDLabel:SetFont("Resource Font")
car2resourceDLabel:SetWrap(true)
car2resourceDLabel:SetAutoStretchVertical(true)



































local exitbutton = vgui.Create( "DButton", airdropmaster ) 
exitbutton:SetText( "Exit" )					
exitbutton:SetPos( 820, 0 )					
exitbutton:SetSize( 80, 40 )
exitbutton:Paint( 100, 30 )		
exitbutton.Paint = function() 
    draw.RoundedBox( 90, 0, 0, exitbutton:GetWide(), exitbutton:GetTall(), Color( 255, 0, 0,1000 ) )
  	end
exitbutton.DoClick = function()	
	airdropmaster:Close()						
end 





end)


