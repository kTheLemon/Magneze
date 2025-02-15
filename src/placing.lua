PlaceTypes = {
    'minus_normal',
    'neutral_normal',
    'plus_normal',
    'wall',
    'minus_wall',
    'neutral_wall',
    'plus_wall',
}

Cursor = {
    x = 1,
    y = 1,
    type = 1,
}

function CursorPlace()
    DeleteCell(Cursor.x, Cursor.y)
    World[Cursor.x][Cursor.y] = PlaceTypes[Cursor.type]
end

function CyclePlaceType(amnt)
    Cursor.type = ((Cursor.type - 1) + amnt) % #PlaceTypes + 1
end