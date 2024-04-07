include("shared.lua")
surface.CreateFont( "Unarrest Npc Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


function ENT:Draw()
if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end

local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),90 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -28 + ang:Up() * 26.5 + ang:Forward() * -20.5



cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 90,30, 58, 280,42, Color(30,30,30,255) )

	draw.SimpleText( "Resource: ".. self:Getcargoamount(), "Unarrest Npc Font", 163, 80, Color(255, 255, 255), 1, 1 )  

cam.End3D2D()













end