Object = {}
Object.__index = Object

function Object:new(x, y, typ)
    return setmetatable({x = x, y = y, type = typ}, self)
end

World = {}