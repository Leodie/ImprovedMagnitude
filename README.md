# ImprovedMagnitude

## DISCLAIMER:
This module was created **before June 27, 2022**. It may contain outdated code and compatibility issues. Please use with caution.

## Introduction:
The ImprovedMagnitude module revolutionizes hitbox calculations, offering enhanced accuracy and flexibility. It takes into account various properties, including the size of the enemy, to deliver precise results. Whether you need to determine the closest foe, the farthest adversary, or even hit the nearest target within a specific range, ImprovedMagnitude has got you covered.

### Why Use ImprovedMagnitude?
- Pinpoint Accuracy: Consider the size of the enemy when calculating hitboxes, ensuring you accurately hit your targets, even if they're colossal.
- Efficient Range Calculation: Specify a maximum distance and an ignore list to streamline hitbox calculations and exclude unwanted objects.

## Usage:

```lua
-- Import the ImprovedMagnitude module
local ImprovedMagnitude = require(script.ImprovedMagnitude)

-- Create a new instance of ImprovedMagnitude
local Hitbox = ImprovedMagnitude.new()

-- Set the properties of the hitbox
Hitbox.HitPoint = MyHumanoidRootPart.Position -- Center point for hitbox calculations
Hitbox.MaxDistance = 10 -- Maximum range

Hitbox.Directory = workspace.Players -- Enemies' Directory
Hitbox.IgnoreList = {MyCharacter}

-- Calculate the enhanced magnitude of the hitbox
local target = Hitbox:Get()
```
