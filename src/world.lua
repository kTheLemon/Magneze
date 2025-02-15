World = {}
NextWorld = {}

WorldWidth = 100
WorldHeight = 100

function SetupWorld(width, height)
    for x = 1, width do
        World[x] = {}
        for y = 1, height do
            World[x][y] = 'bg'
        end
    end
end

function InBounds(x, y)
    return ((x > 0) and (x <= WorldWidth)) and((y > 0) and (y <= WorldHeight))
end

function SetCell(x, y, type, world)
    if InBounds(x, y) then
        (world or World)[x][y] = type
    end
end

function DeleteCell(x, y, world)
    if InBounds(x, y) then
        (world or World)[x][y] = 'bg'
    end
end

function GetCell(x, y, world)
    if InBounds(x, y) then
        return (world or World)[x][y]
    else
        return 'wall'
    end
end

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


SetupWorld(WorldWidth, WorldHeight)