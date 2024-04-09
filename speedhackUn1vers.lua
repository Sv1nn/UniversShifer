-- Sv1nn Hub

if game.PlaceId == 7560156054 then

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Gertigetr Funpay", IntroText = "Gertigetr Funpay", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Westbound hub

local WestTab = Window:MakeTab({
  Name = "Westbound",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

local Section = WestTab:AddSection({
  Name = "Westbound"
})

WestTab:AddButton({
  Name = "AutofarmV1",
  Callback = function()
      while true do
          local args = {
              [1] = "Safe",
              [2] = workspace:WaitForChild("Safe")
          }
          
          game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Rob"):FireServer(unpack(args))
          wait(0.1)
      end
  end
})

WestTab:AddButton({
  Name = "Autofarm Mod",
  Callback = function()
      while true do
          local args = {
              [1] = "Complete"
          }
          workspace:WaitForChild("Safe"):WaitForChild("OpenSafe"):FireServer(unpack(args))
          wait(20)
      end
  end
})

WestTab:AddButton({
Name = "Tp user",
Callback = function()
      local RunService = game:GetService("RunService")

      local function moveCharacter()
          local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:wait(5)
          
          char.HumanoidRootPart.CFrame = CFrame.new(1627.92297, 128.849976, 1579.78149, -0.0333881564, -3.30991874e-08, -0.999442458, 2.13044915e-09, 1, -3.31888224e-08, 0.999442458, -3.23737481e-09, -0.0333881564)
          
          RunService.Heartbeat:wait(5)
      end
      
      RunService.Heartbeat:Connect(function()
          moveCharacter()
      end)
  end    
})

WestTab:AddButton({
Name = "AspawnMod",
Callback = function()
      while true do
          local args = {
              [1] = "Grayridge",
              [2] = false,
              [3] = false
          }
          
          game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
          wait(50)
      end
  end    
})
