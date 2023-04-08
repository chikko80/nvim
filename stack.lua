
local Stack = {}

function Stack:new()
  local stack = { contents = {} }
  setmetatable(stack, self)
  self.__index = self
  return stack
end

function Stack:push(value)
  table.insert(self.contents, value)
end

function Stack:pop()
  return table.remove(self.contents)
end

function Stack:peek()
  return self.contents[#self.contents]
end

function Stack:isEmpty()
  return #self.contents == 0
end
