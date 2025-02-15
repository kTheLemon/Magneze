function love.keypressed(key, scancode, isRepeat)
    -- directions
    if scancode == 'right' then
        if InBounds(Cursor.x + 1, 1) then
            Cursor.x = Cursor.x + 1
        end
    end

    if scancode == 'down' then
        if InBounds(1, Cursor.y + 1) then
            Cursor.y = Cursor.y + 1
        end
    end

    if scancode == 'left' then
        if InBounds(Cursor.x - 1, 1) then
            Cursor.x = Cursor.x - 1
        end
    end

    if scancode == 'up' then
        if InBounds(1, Cursor.y - 1) then
            Cursor.y = Cursor.y - 1
        end
    end

    Camera.offx = -Cursor.x*Camera.cellSize*Camera.zoom + love.graphics.getWidth()/2 - Camera.cellSize*Camera.zoom/2
    Camera.offy = -Cursor.y*Camera.cellSize*Camera.zoom + love.graphics.getHeight()/2 - Camera.cellSize*Camera.zoom/2

    -- placing/breaking

    if scancode == 'w' then
        CursorPlace()
    end

    if scancode == 's' then
        DeleteCell(Cursor.x, Cursor.y)
    end

    -- cycling place types

    if scancode == 'a' then
        CyclePlaceType(-1)
    end

    if scancode == 'd' then
        CyclePlaceType(1)
    end
end