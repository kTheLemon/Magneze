-- thanks blendi, creator of photon

love.graphics.setDefaultFilter("nearest", "nearest")

Tex = {}
TexSize = {}

local function ScanTextures(directory, removeAtStart)
    removeAtStart = removeAtStart or directory
    for i, v in ipairs(love.filesystem.getDirectoryItems(directory)) do
        local combinedpath = directory .. "/" .. v
        if love.filesystem.getInfo(combinedpath, "directory") then
            ScanTextures(combinedpath, removeAtStart)
        else
            local tx = love.graphics.newImage(combinedpath)
            if combinedpath:sub(1, #removeAtStart + 1) == removeAtStart .. "/" then
                combinedpath = combinedpath:sub(#removeAtStart + 2)
            end
            if combinedpath:sub(#combinedpath - 3) == ".png" then
                combinedpath = combinedpath:sub(1, #combinedpath - 4)
            end
            Tex[combinedpath] = tx
            TexSize[combinedpath] = {
                w = tx:getWidth(),
                h = tx:getHeight(),
                w2 = tx:getWidth() / 2,
                h2 = tx:getHeight() / 2,
                diagsize = math.sqrt(tx:getWidth() ^ 2 + tx:getHeight() ^ 2)
            }
        end
    end
end

ScanTextures("assets/images")
