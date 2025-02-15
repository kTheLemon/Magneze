local updateTimer = 0
UpdateDelay = 0.15

local invalidAttractors = {
    ['bg'] = true,
    ['wall'] = true
}

local updaters = {
    ['plus_normal'] = true,
    ['neutral_normal'] = true,
    ['minus_normal'] = true
}

function SplitCell(x, y, dirs, amnt)
    local cType = GetCell(x, y)
    local should_delete = false

    for i = 1, #dirs do
        local d = dirs[i]
        print(d)
        local nx, ny = NextPos(x, y, d, amnt)

        local c, nc = GetCell(nx, ny), GetCell(nx, ny, NextWorld)
        
        if c == 'bg' then
            if nc == 'bg' then
                SetCell(nx, ny, cType, NextWorld)
                should_delete = true
            elseif nc:sub(1, 1) == cType:sub(1, 1) then
                should_delete = true
            elseif nc:sub(1, 1) ~= cType:sub(1, 1) then
                DeleteCell(nx, ny, NextWorld)
                should_delete = true
            end
        end
    end

    if should_delete then
        DeleteCell(x, y, NextWorld)
    end
end

function UpdateCell(x, y)
    local cType = World[x][y]
    local split_dirs = {}

    for d = 0, 3 do
        local nx, ny = NextPos(x, y, d, 1)
        local n2x, n2y = NextPos(x, y, d, 2)
        
        local nc, n2c = GetCell(nx, ny), GetCell(n2x, n2y)

        if (nc:sub(1, 1) == cType:sub(1, 1)) then
            split_dirs[#split_dirs+1] = (d + 2)%4
        end

        if (n2c:sub(1, 1) ~= cType:sub(1, 1)) and (not invalidAttractors[n2c]) then
            split_dirs[#split_dirs+1] = d
        end
    end

    SplitCell(x, y, split_dirs, 1)
end

function UpdateWorld()
    NextWorld = CopyValue(World)

    for x = 1, #World do
        for y = 1, #World[1] do
            if updaters[GetCell(x, y)] then
                UpdateCell(x, y)
            end
        end
    end

    World = CopyValue(NextWorld)
end

function love.update(dt)
    updateTimer = updateTimer + dt

    if updateTimer >= UpdateDelay then
        updateTimer = 0
        UpdateWorld()
    end
end