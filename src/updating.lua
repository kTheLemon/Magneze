Updates = {
    'minus_normal',
    'plus_normal'
}

function NextPos(x, y, dir, amnt)
    if dir == 0 then
        return x+amnt, y
    end

    if dir == 1 then
        return x, y+amnt
    end

    if dir == 2 then
        return x-amnt, y
    end

    if dir == 3 then
        return x, y-amnt
    end
end

function IsPositionEmpty(x, y)
    for i = 1, #World do
        if (World[i].x == x) and (World[i].y == y) then return false end
    end
    return true
end

function Object:Move(dir, amnt)
    local nx, ny = NextPos(self.x, self.y, dir, amnt)

    if IsPositionEmpty(nx, ny) then
        self.x, self.y = nx, ny
    end
end

function Object:getAttractionObjectDir(x, y, amnt)
    local xdist, ydist = x - self.x, y - self.y

    if ((math.abs(xdist) == amnt) and (ydist == 0)) then
        if (xdist > 0) then return 0 end
        if (xdist < 0) then return 2 end
    end

    if ((math.abs(ydist) == amnt) and (xdist == 0)) then
        if (ydist > 0) then return 1 end
        if (ydist < 0) then return 3 end
    end

    return false
end

function Object:update(idx)
    for i = 1, #World do
        local curObj = World[i]

        if (i ~= idx) then
            if curObj.type ~= 'wall' then
                if (curObj.type:sub(1, 1) == self.type:sub(1, 1)) then
                    local objectDir = self:getAttractionObjectDir(curObj.x, curObj.y, 1)
                    if objectDir then
                        if self:Move((objectDir+2)%4, 1) then break end
                    end
                else
                    local objectDir = self:getAttractionObjectDir(curObj.x, curObj.y, 2)
                    if objectDir then
                        if self:Move(objectDir, 1) then break end
                    end
                end
            end
        end
    end
end

function UpdateWorld()
    for i = 1, #Updates do
        for j = 1, #World do
            if (World[j].type == Updates[i]) then
                print("UPDATE INCOMING!")
                World[j]:update(j)
            end
        end
    end
end

UpdateDelay = 0.15
local updateTimer = 0
function love.update(dt)
    updateTimer = updateTimer + dt

    if updateTimer >= UpdateDelay then
        updateTimer = 0
        UpdateWorld()
    end
end