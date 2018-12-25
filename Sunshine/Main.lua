--импорты
local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local math = require("math")
local component = require("component")
local computer = require("computer")

if component.isAvailable("debug") then
  --вариаблы
  local world = component.debug.getWorld()
  local mainContainer = GUI.fullScreenContainer()
  local titles = {"I love thunder!", "Lightning bolts!", "SHIT IT RAINS AGAIN", "To rain or not to rain", "Lovely morning!", "Today will be sunny.", "is a first btvoidx's app.", ":^", "Did you saw the lightning?", "A creeper behind you"}
  local currenttime = world.getTime()
  --окно
  local mainContainer, window = MineOSInterface.addWindow(GUI.titledWindow(5, 5, 50, 15, "Sunshine: ".. titles[math.random(#titles)], true))
  local layout = window:addChild(GUI.layout(1, 2, window.width, window.height - 2, 1, 4))

  --кнопки
  layout:setPosition(1, 1, layout:addChild(GUI.framedButton(1, 1, 25, 3, 13158600, 0, 9868950, 0, "Weather: Clear."))).onTouch = function()
  	world.setThundering(false)
  	world.setRaining(false)
  	computer.beep(500)
  end 
  layout:setPosition(1, 2, layout:addChild(GUI.framedButton(1, 1, 25, 3, 13158600, 0, 9868950, 0, "Weather: Rainy."))).onTouch = function()
  	world.setThundering(false)
  	world.setRaining(true)
  	computer.beep(500)
  end
  layout:setPosition(1, 3, layout:addChild(GUI.framedButton(1, 1, 25, 3, 13158600, 0, 9868950, 0, "Weather: Thunder."))).onTouch = function()
    world.setRaining(true)
  	world.setThundering(true)
  	computer.beep(500)
  end

  --ползунок
  local slider = layout:setPosition(1, 4, layout:addChild(GUI.slider(1, 1, 25, 16767488, 4718847, 9868950, 0, 0, 24000, currenttime, true, "Current time: ", " ticks")))
  slider.onValueChanged = function()
    world.setTime(slider.value)
  end

  --отключение кнопки ресайза
  window.actionButtons.maximize.onTouch = function()
	GUI.alert("Doesn't work propely now.")	
  end

  mainContainer:drawOnScreen()
  mainContainer:startEventHandling()

else
  GUI.alert("This program requires debug card to run")
  return
end

