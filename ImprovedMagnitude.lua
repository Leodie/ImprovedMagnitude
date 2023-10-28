-----------------------------------------------------------
------------------------- SERVICES -----------------------
-----------------------------------------------------------

local Players = game:GetService("Players")

-----------------------------------------------------------
--------------------- MODULE DEFINITION -------------------
-----------------------------------------------------------

local ImprovedMagnitude = {}
ImprovedMagnitude.__index = ImprovedMagnitude
ImprovedMagnitude.__type = "ImprovedMagnitude"

-----------------------------------------------------------
----------------------- STATIC DATA -----------------------
-----------------------------------------------------------

local ERR_INVALID_VALUE = 'INVALID VALUE: "%s" need to be a %s'

-----------------------------------------------------------
------------------------- EXPORTS -------------------------
-----------------------------------------------------------

function ImprovedMagnitude.new()
	return setmetatable({
		HitPoint = Vector3.new(),
		MaxDistance = 0,
		IgnoreList = {},
		Directory = Players
	}, ImprovedMagnitude)
end

function ImprovedMagnitude:Get()
	assert(typeof(self.HitPoint) == "Vector3", ERR_INVALID_VALUE:format("HitPoint", "Vector3"))
	assert(typeof(self.MaxDistance) == "number", ERR_INVALID_VALUE:format("MaxDistance", "number"))
	assert(typeof(self.IgnoreList) == "table", ERR_INVALID_VALUE:format("IgnoreList", "table"))
	assert(typeof(self.Directory) == "Instance", ERR_INVALID_VALUE:format("Directory", "Instance"))

	local AllUsers
	if (self.Directory:IsA("Players")) then
		AllUsers = self.Directory:GetPlayers()
	else
		AllUsers = self.Directory:GetChildren()
	end

	local InRange = {}
	for _,User in AllUsers do
		local Character = User
		if User:IsA("Player") then
			Character = User.Character
		end
		if table.find(self.IgnoreList, Character) then continue end

		if (not Character) or (not Character.Parent) then continue end

		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		if (not Humanoid) then continue end

		local Pos : CFrame, Size : Vector3 = Character:GetBoundingBox()
		
		local Direction = self.HitPoint - Pos.Position

		if self.MaxDistance > 0 then
			if Direction.Magnitude <= self.MaxDistance then
				table.insert(InRange, Character)
			end
			
			continue
		end

		if ((Direction * Vector3.new(1, 0, 1)).Magnitude <= (Size * Vector3.new(1, 0, 1)).Magnitude) and (math.abs(Direction.Y) <= Size.Y) then
			table.insert(InRange, Character)
		end
	end

	return InRange
end

return ImprovedMagnitude
