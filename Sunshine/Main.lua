
local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local component = require("component")
local computer = require("computer")

if component.isAvailable("debug") then
  --вариаблы
  local world = component.debug.getWorld()
  local titles = {"I love thunder!", "Lightning bolts!", "SHIT IT RAINS AGAIN", "To rain or not to rain", "Lovely morning!", "Today will be sunny.", "is a first btvoidx's app.", ":^", "Did you saw the lightning?", "A creeper behind you"}

  --окно
  local application, window = MineOSInterface.addWindow(GUI.titledWindow(5, 5, 54, 16, "Sunshine: ".. titles[math.random(#titles)], true))
  
  local layout = window:addChild(GUI.layout(1, 2, window.width, window.height - 1, 1, 1))
  layout:setSpacing(1, 1, 0)

  local function addButton(text, doSomething)
    local button = layout:addChild(GUI.framedButton(1, 1, 25, 3, 13158600, 0, 9868950, 0, text))
    button.onTouch = function()
      doSomething()
      computer.beep(500)
    end

    return button
  end

  --кнопки
  addButton("Weather: Clear.", function()
    world.setThundering(false)
    world.setRaining(false)
  end)

  addButton("Weather: Rainy.", function()
    world.setThundering(false)
    world.setRaining(true)
  end)

  addButton("Weather: Thunder.", function()
    world.setThundering(true)
    world.setRaining(true)
  end)

  --ползунок
  local slider = layout:addChild(GUI.slider(1, 1, 25, 16767488, 4718847, 9868950, 0, 0, 24000, world.getTime(), true, "Current time: ", " ticks"))
  slider.height = 2
  slider.onValueChanged = function()
    world.setTime(slider.value)
  end

  --ресайз
  window.onResize = function(newWidth, newHeight)
    window.backgroundPanel.width = newWidth
    window.backgroundPanel.height = newHeight
    window.titlePanel.width = newWidth
    window.titleLabel.width = newWidth

    layout.width = newWidth
    layout.height = newHeight - 1
  end

  application:draw()
else
  GUI.alert("This program requires debug card to run")
end
