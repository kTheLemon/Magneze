Camera = {
    offx = 0,
    offy = 0,
    zoom = 4,
    cellSize = 11
}

function Object:Render()
    love.graphics.draw(Tex[self.type], self.x*Camera.zoom*Camera.cellSize + Camera.offx, self.y*Camera.zoom*Camera.cellSize + Camera.offy, 0, Camera.zoom, Camera.zoom)
end

function RenderWorld()
    for i = 1, #World do
        World[i]:Render()
    end
end

function RenderCursor()
    love.graphics.setColor(1, 1, 0, 0.5)
    love.graphics.rectangle('fill', Cursor.x*Camera.zoom*Camera.cellSize + Camera.offx, Cursor.y*Camera.zoom*Camera.cellSize + Camera.offy, Camera.zoom*Camera.cellSize, Camera.zoom*Camera.cellSize)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.draw(Tex[PlaceTypes[Cursor.type]], Cursor.x*Camera.zoom*Camera.cellSize + Camera.offx + Camera.cellSize*Camera.zoom - 15, Cursor.y*Camera.zoom*Camera.cellSize + Camera.offy + Camera.cellSize*Camera.zoom - 15, 0, Camera.zoom/2, Camera.zoom/2)
end

function RenderBg()
    for x = -20, 120 do
        for y = -20, 120 do
            love.graphics.draw(Tex['bg'], x*Camera.zoom*Camera.cellSize + Camera.offx, y*Camera.zoom*Camera.cellSize + Camera.offy, 0, Camera.zoom, Camera.zoom)
        end
    end
end

function love.draw()
    RenderBg()
    RenderWorld()
    RenderCursor()
end