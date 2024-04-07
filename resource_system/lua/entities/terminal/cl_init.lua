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

ang:RotateAroundAxis( self:GetAngles():Right(),270 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -22 + ang:Up() * 12 + ang:Forward() * -7.5

local us = "materials/ticketpng/Flag_of_US.png"
local ru = "materials/ticketpng/Flag_of_Russia.svg.png"
local none = "debug/debughitbox"
local displaymaterial = none

if self:GetUSCAP() == true then
displaymaterial = us

end
if self:GetRUCAP() == true then
displaymaterial = ru
end

if self:GetRUCAP() == false and self:GetUSCAP() == false then
displaymaterial = none
end

local displaymat = Material( displaymaterial, "noclamp smooth" )








cam.Start3D2D(pos,ang,0.1)

surface.SetMaterial( displaymat )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 0, 0, 150, 150 )

cam.End3D2D()













end