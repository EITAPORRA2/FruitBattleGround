local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService");
local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
local playerName = game.Players.LocalPlayer.Name

function Safe()
    local baseplate = Instance.new("Part")
    baseplate.Parent = workspace
    baseplate.Size = Vector3.new(20,4,20)
    baseplate.Anchored = true
    baseplate.Position = Vector3.new(9999, 1080, 7830)
end
Safe()

local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	x = string.split(v.Name, " ")
	if x[2] ~= nil then
		v.Name = x[1]..x[2]
	end
end
 

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = string.format("Universe Hub | %s", GameName),
    LoadingTitle = string.format("Universe Hub", GameName),
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false,
     },
})

local FarmingTab = Window:CreateTab("Farming");
FarmingTab:CreateSection("Farming");

FarmingTab:CreateToggle({
	Name = "Auto Farm",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
		AutoFarm = Value
            while AutoFarm do task.wait()
                pcall(function()
                task.wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, 1098, 7830)
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                local ohString1 = game.Players.LocalPlayer["MAIN_DATA"].Slots[game.Players.LocalPlayer["MAIN_DATA"].Slot.Value].Value
                local ohString2 = v.Name
                local ohTable3 = {}
                game:GetService("ReplicatedStorage").Replicator:InvokeServer(ohString1, ohString2, ohTable3)
                antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                antifall.Velocity = Vector3.new(0, 0, 0)
                end
            end)
		end
	end,
})

FarmingTab:CreateToggle({
	Name = "Auto Respawn",
	CurrentValue = false,
	Flag = "Toggle2", 
	Callback = function(Value)
		AutoRespawn = Value
            while AutoRespawn do task.wait()
                pcall(function()
                local player = game.Players.LocalPlayer
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Died:Connect(function()
                        local ohString1 = "Core"
                        local ohString2 = "LoadCharacter"
                        local ohTable3 = {}
                        game:GetService("ReplicatedStorage").ReplicatorNoYield:FireServer(ohString1, ohString2, ohTable3)
                        local ohString1 = "Main"
                        local ohString2 = "LoadCharacter"
                        game:GetService("ReplicatedStorage").ReplicatorNoYield:FireServer(ohString1, ohString2)
                    end)
                else
                    local ohString1 = "Core"
                    local ohString2 = "LoadCharacter"
                    local ohTable3 = {}
                    game:GetService("ReplicatedStorage").ReplicatorNoYield:FireServer(ohString1, ohString2, ohTable3)
                    task.wait()
                    local ohString1 = "Main"
                    local ohString2 = "LoadCharacter"
                    game:GetService("ReplicatedStorage").ReplicatorNoYield:FireServer(ohString1, ohString2)                
            end
        end)
		end
	end,
})

FarmingTab:CreateToggle({
	Name = "HitBox Extender",
	CurrentValue = false,
	Flag = "Toggle3", 
	Callback = function(Value)
		HitBoxExtender = Value
            while HitBoxExtender do task.wait()
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Characters.Players:GetDescendants()) do
                        if v ~= game.Players.LocalPlayer.Character and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(20,20,20)
                            v.HumanoidRootPart.Material = "Neon"
                            v.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.HumanoidRootPart.Transparency = 0.9
                        end
                    end
            end)
		end
	end,
})

FarmingTab:CreateToggle({
Name = "NoClip",
CurrentValue = false,
Flag = "Toggl4", 
Callback = function(Value)
Noclip = Value
while Noclip do task.wait()
pcall(function()
task.wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide == true then
v.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
end
end
end)
end
end,
})

local MiscTab = Window:CreateTab("Misc")
local Slider = MiscTab:CreateSlider({
   Name = "WalkSpeed ",
   Range = {0, 500},
   Increment = 1,
   Suffix = "",
   CurrentValue = 25,
   Flag = "Slider1",
   Callback = function(Value)
   _G.HackedWalkSpeed = Value
   end,
})
   _G.HackedWalkSpeed = 20

local Plrs = game:GetService("Players")

local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character
if MyChar then
local Hum = MyChar.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end

MyPlr.CharacterAdded:connect(function(Char)
MyChar = Char
repeat wait() until Char:FindFirstChild("Humanoid")
local Hum = Char.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
local Slider = MiscTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 500},
   Increment = 1,
   Suffix = "",
   CurrentValue = 16,
   Flag = "Slider2",
   Callback = function(v)
   while true do 
       task.wait(0.5)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = v
    end
   end,
})
