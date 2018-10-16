local Dropdown = {}
Dropdown.__index = Dropdown


function Dropdown:create(x, y, numOptions)
  local dropdown = {}

  dropdown.x = x
  dropdown.y = y
  dropdown.numOptions = numOptions
  dropdown.options = {}

  dropdown.top = love.graphics.newImage("assets/dropdownTop.png"),
  

  dropdown.mid = love.graphics.newImage("assets/dropdownMid.png")
  dropdown.bottom = love.graphics.newImage("assets/dropdownBottom.png")
  
  setmetatable(dropdown, self)
  
  return dropdown
end

function Dropdown:length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Dropdown:checkX(element)
  local mouseX = love.mouse.getX()
  local topWidth = element:getWidth()
  if mouseX <= topWidth + self.x and mouseX >= self.x then
    return true
  end
end

function Dropdown:checkY(element)
  local mouseY = love.mouse.getY()
  local topHeight = element:getHeight()
  if mouseY <= topHeight + self.y and mouseY >= self.y then
    return true
  end
end

function Dropdown:onHover(element)
  local hand = love.mouse.getSystemCursor("hand")
  if self:checkX(element) and self:checkY(element) then
    love.mouse.setCursor(hand)
  else
    love.mouse.setCursor()
  end
end

function Dropdown:getElementCenter(element)
  local center = {}
  center.x = element:getWidth() / 2 - 15
  center.y = element:getHeight() / 2 + 12
  return center
end

function Dropdown:addOption(option)
  local length = Dropdown:length(self.options)
  if length == 0 then
    local dropdown = {
      img = self.top,
      x = self.x,
      y = self.y,
      centerX = self:getElementCenter(self.top).x,
      centerY = self:getElementCenter(self.top).y,
      text = option,
    }
    table.insert(self.options, dropdown)
  elseif length >= 1 then

  end
end

function Dropdown:removeOption(option)
end

function Dropdown:draw()
  love.graphics.setColor(1, 1, 1)

  local length = self:length(self.options)
  local num = 1
  for i, v in ipairs(self.options) do
    if num == 1 then
      love.graphics.draw(v.img, v.x, v.y)
      love.graphics.setColor(0, 0, 0)
      love.graphics.print(num, v.centerX, v.centerY)
      love.graphics.setColor(1, 1, 1)
      
    else if num > 1 and num <  (length - 1) then
    end
    num = num + 1
  end
  --love.graphics.draw(self.mid, self.x, self.y + 25)
  --love.graphics.draw(self.bottom, self.x, self.y + 25 * 2)
  
  
end

return Dropdown