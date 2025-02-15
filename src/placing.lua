PlaceTypes = {
    'minus_normal',
    'plus_normal',
    'wall',
    'minus_wall',
    'plus_wall',
}

Cursor = {
    x = 0,
    y = 0,
    type = 1,
    speed = 10,
}

function DeleteObject(x, y)
    for i = 1, #World do
        if (World[i].x == x) and (World[i].y == y) then
            table.remove(World, i)
            return
        end
    end
end

function CursorPlace()
    DeleteObject(Cursor.x, Cursor.y)
    World[#World+1] = Object:new(Cursor.x, Cursor.y, PlaceTypes[Cursor.type])
end

function CyclePlaceType(amnt)
    Cursor.type = ((Cursor.type - 1) + amnt) % #PlaceTypes + 1
end