local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Snakeboy99/BLUEX/main/BlueXLibrary.lua",true))()

local blueXLibrary = library.new("UI Library")
local Player_Tab = blueXLibrary:make_tab("Player",true)
local Lab_Tab = blueXLibrary:make_tab("Lab Factory")
local Locations_Tab = blueXLibrary:make_tab("Locations")

local Player = Player_Tab:addSection("LocalPlayer")
Player:AddToggle("Fast Walk", false, function(a_1)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (a_1 and 100) or 16
end)

local locate = Locations_Tab:addSection("Teleports")
locate:AddButton("Lab Teleport", function()
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.UI.LabTeleport.Yes.MouseButton1Click)
end)

local factorySection = Lab_Tab:addSection("Lab Utility")

local researchAuto = false
factorySection:AddToggle("Auto Research", false, function()
		researchAuto = not researchAuto
end)

spawn(function()
		while wait(1) do 
				if researchAuto then 
					local scrollingIndex = game:GetService("Players").LocalPlayer.PlayerGui.UI.IndexFrameOld.Scrolling;
					for i,v in pairs(scrollingIndex:GetChildren()) do 
					    if v.Name == "Slot" and v.Unlock.BackgroundColor3 == Color3.fromRGB(143, 143, 143) then 
					        firesignal(v.Unlock.MouseButton1Click)    
					    end
					end
				end
		end
end)
