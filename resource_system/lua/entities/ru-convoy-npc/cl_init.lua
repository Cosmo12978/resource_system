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
	size = 20,
	weight = 700,
} )

surface.CreateFont( "Resource Font", {
	font = "Default", 
	extended = false,
	bold = true,
	size = 18,
	weight = 700,
} )

function ENT:Draw()


self:DrawModel()


end

net.Receive( "Operationirongate.Convoymenu1", function()

	local convoymain = vgui.Create( "DFrame" ) 	
	convoymain:SetPos(480,100)			
	convoymain:SetSize( 900, 600 ) 				
	convoymain:SetTitle( "" ) 		
	convoymain:MakePopup("Airdrop NPC Font")
	convoymain:SetDraggable(false)
	convoymain:SetBackgroundBlur(true)
	convoymain:ShowCloseButton(false)
	convoymain.Paint = function()
	draw.RoundedBox( 20, 0, 0, convoymain:GetWide(), convoymain:GetTall(), Color( 38, 41, 39, 255 ) )
end


local title = vgui.Create( "DLabel", convoymain )
title:SetPos( 200, 0 )
title:SetAutoStretchVertical(true)
title:SetWrap( true )
title:SetColor(Color(255, 255, 255))
title:SetSize(1000,50)
title:SetFont("Title Font")
title:SetText("Convoy Mission Menu")

local lowriskdetail = vgui.Create( "DLabel", convoymain )
lowriskdetail:SetPos( 10, 90 )
lowriskdetail:SetAutoStretchVertical(true)
lowriskdetail:SetWrap( true )
lowriskdetail:SetColor(Color(255, 255, 255))
lowriskdetail:SetSize(1000,80)
lowriskdetail:SetFont("Describe Font")
lowriskdetail:SetText("Once a convoy starts a truck will spawn, Take the truck to the location and return the supplies back to base. ")


local lowriskbutton = vgui.Create( "DModelPanel", convoymain )
lowriskbutton:SetSize(500,500)
lowriskbutton:SetPos(180,120)
lowriskbutton:SetAnimSpeed(2000)
lowriskbutton:SetModel( "models/ural_troop.mdl" ) 
function lowriskbutton:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0)) 
lowriskbutton.DoClick = function()	
	net.Start("Operationirongate.Convoystart1")
	net.WriteInt(1,32)
	net.SendToServer()	
	convoymain:Close()						
end 
end
lowriskbutton:SetCamPos(Vector(0, 255, 36))

local lowriskdetailsendoff = vgui.Create( "DLabel", convoymain )
lowriskdetailsendoff:SetPos( 345, 130 )
lowriskdetailsendoff:SetAutoStretchVertical(true)
lowriskdetailsendoff:SetWrap( true )
lowriskdetailsendoff:SetColor(Color(255, 255, 255))
lowriskdetailsendoff:SetSize(1000,50)
lowriskdetailsendoff:SetFont("Resource Font")
lowriskdetailsendoff:SetText("Click below to Start Convoy!")







local exitbutton = vgui.Create( "DButton", convoymain ) 
exitbutton:SetText( "Exit" )					
exitbutton:SetPos( 820, 0 )					
exitbutton:SetSize( 80, 40 )
exitbutton:Paint( 100, 30 )		
exitbutton.Paint = function() 
    draw.RoundedBox( 90, 0, 0, exitbutton:GetWide(), exitbutton:GetTall(), Color( 255, 0, 0,1000 ) )
  	end
exitbutton.DoClick = function()	
	convoymain:Close()						
end 





end)


