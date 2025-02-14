function love.keypressed(key, scancode, isRepeat)
    -- directions
    if scancode == 'right' then
        Cursor.x = Cursor.x + 1
    end

    if scancode == 'down' then
        Cursor.y = Cursor.y + 1
    end

    if scancode == 'left' then
        Cursor.x = Cursor.x - 1
    end

    if scancode == 'up' then
        Cursor.y = Cursor.y - 1
    end

    Camera.offx = -Cursor.x*Camera.cellSize*Camera.zoom + love.graphics.getWidth()/2 - Camera.cellSize*Camera.zoom/2
    Camera.offy = -Cursor.y*Camera.cellSize*Camera.zoom + love.graphics.getHeight()/2 - Camera.cellSize*Camera.zoom/2

    -- placing/breaking

    if scancode == 'w' then
        CursorPlace()
    end

    if scancode == 's' then
        DeleteObject(Cursor.x, Cursor.y)
    end

    -- cycling place types

    if scancode == 'a' then
        CyclePlaceType(-1)
    end

    if scancode == 'd' then
        CyclePlaceType(1)
    end
end