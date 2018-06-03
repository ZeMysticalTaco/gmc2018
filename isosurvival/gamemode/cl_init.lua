include("shared.lua")
--[[-------------------------------------------------------------------------
	Font Stuff
---------------------------------------------------------------------------]]
ISO_FONT = "Arial"

surface.CreateFont("IsoMedium", {
	font = ISO_FONT,
	size = 25,
	extended = true,
	weight = 1000
})
surface.CreateFont("IsoGeneric", {
	font = ISO_FONT,
	size = 20,
	extended = true,
	weight = 1000
})

surface.CreateFont("IsoSmall", {
	font = ISO_FONT,
	size = 15,
	extended = true,
	weight = 1000
})

--[[-------------------------------------------------------------------------
	HUD Stuff
---------------------------------------------------------------------------]]
function GM:HUDPaint()
	--define screen width and height in a local variable for micro-optimization
	local scrW, scrH = ScrW(), ScrH()
	--Health
	surface.SetDrawColor(Color(0, 0, 0, 200))
	surface.DrawRect(scrW / 20 - 80, scrH - 80, 400, 70)
	draw.DrawText("Healthy", "IsoMedium", scrW / 20 - 70, scrH - 70, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
	--Armor
	draw.DrawText("Armor: Poor", "IsoMedium", scrW / 20 - 70, scrH - 40, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
	--Ammo
	surface.SetDrawColor(Color(0, 0, 0, 200))
	surface.DrawRect(scrW / 1.3, scrH - 80, 430, 70)
	surface.SetDrawColor(Color(60, 120, 100, 200))
	surface.DrawRect(scrW / 1.2 + 26, scrH - 120, 280, 40)
	draw.DrawText("H&K MP7A1", "IsoMedium", scrW / 1.1 + 150, scrH - 110, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
	draw.DrawText("Magazine: 0 / 0", "IsoMedium", scrW / 1.1 + 150, scrH - 70, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
	draw.DrawText("Tube: 0", "IsoMedium", scrW / 1.1 + 150, scrH - 40, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
	--Player Information
	surface.SetDrawColor(Color(60, 120, 100, 200))
	surface.DrawRect(scrW / 20 - 80, scrH - 120, 280, 40)
	draw.DrawText(LocalPlayer():Name(), "IsoMedium", scrW / 20 - 70, scrH - 110, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
	--Round Information
	surface.SetDrawColor(Color(0, 0, 0, 200))
	surface.DrawRect(scrW / 2.5, scrH / 120, 315, 40)
	draw.DrawText("Wave 1 - 0:00 | Round: 5", "IsoMedium", scrW / 2.4, scrH / 65, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
end

function GM:HUDShouldDraw(name)
	if (name ~= "CHudHealth" and name ~= "CHudBattery" and name ~= "CHudAmmo" and name ~= "CHudSecondaryAmmo") then
		return true
	end
end