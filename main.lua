Dropdown = require "dropdown"

function love.load()
  
  kennyFuture = love.graphics.newFont("assets/fonts/kenvector_future.ttf", 15)
  kennyThin = love.graphics.newFont("assets/fonts/kenvector_future_thin.ttf", 15)
  love.graphics.setFont(kennyFuture)
  dropdown = Dropdown:create(20, 20, 5)
  dropdown:addOption("Cool")
end

function love.update(dt)
  local length = dropdown:length(dropdown.options)
  for k,v in pairs(dropdown.options) do
    dropdown:onHover(v)
  end
end

function love.draw()
  dropdown:draw()
end