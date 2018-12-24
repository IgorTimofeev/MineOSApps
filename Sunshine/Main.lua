local GUI = require("GUI")
local component = require("component")

local world
if component.isAvailable("debug") then
  world = component.debug.getWorld()
  world.setTime(1000)
else
  GUI.alert("This program requires debug card to run")
  return
end
