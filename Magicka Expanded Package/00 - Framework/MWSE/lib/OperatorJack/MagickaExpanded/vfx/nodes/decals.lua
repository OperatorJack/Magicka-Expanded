local log = require("OperatorJack.MagickaExpanded.utils.logger")

---@class MagickaExpanded.Vfx.Nodes.Decals
local this = {}

local decalTextures = {}

--[[
    Logs the currently loaded decal texture paths.
]]
this.logDecalTextures = function()
    for k, v in pairs(decalTextures) do log:debug("Logging decal '%s'.", k) end
end

--[[
    Preloads the given texture into memory to reduce potential log when loaded on demand. 
    If not used, the texture will automatically be loaded the first time it is attached to an actor.
]]
---@param path string Path to the decal texture to preload.
this.preloadDecal = function(path) decalTextures[path] = niSourceTexture.createFromPath(path) end

--[[
    Iterates the decals on the target texturing property which are applied by the framework.
]]
---@param texturingProperty niTexturingProperty
---@param path string|nil Optional path. Will only return decal textures with from this texture path.
this.iterDecals = function(texturingProperty, path)
    return coroutine.wrap(function()
        for i, map in ipairs(texturingProperty.maps) do
            local texture = map and map.texture
            local fileName = texture and texture.fileName

            log:debug("Found map '%s'.", fileName)

            -- If path is not provided, return all.
            if decalTextures[fileName] and not path then coroutine.yield(i, map) end

            -- If path is provided, only return matching textures.
            if decalTextures[fileName] and path and fileName == path then
                coroutine.yield(i, map)
            end
        end
    end)
end

--[[
    Checks if any loaded decal is present in the texturing property.
]]
---@param texturingProperty niTexturingProperty
---@param path string|nil Optional path. Will only return decal textures with from this texture path.
---@return boolean
this.hasDecal = function(texturingProperty, path)
    return this.iterDecals(texturingProperty, path)() ~= nil
end

--[[
    Attachs the given decal texture to the sceneNode.
]]
---@param sceneNode niNode The node to apply the decal texture to.
---@param path string The path to the decal texture.
this.attachDecal = function(sceneNode, path)
    if not decalTextures[path] then this.preloadDecal(path) end

    for node in table.traverse {sceneNode} do
        node = node --[[@as niNode]]
        if node:isInstanceOfType(tes3.niType.NiTriShape) then
            local alphaProperty = node.alphaProperty
            local texturingProperty = node.texturingProperty
            if (alphaProperty == nil and texturingProperty ~= nil and texturingProperty.canAddDecal ==
                true and this.hasDecal(texturingProperty, path) == false) then
                -- We have to detach/clone the property because it could have multiple users.
                local texturingProperty = node.texturingProperty:clone() --[[@as niTexturingProperty]]
                node.texturingProperty = nil

                texturingProperty:addDecalMap(decalTextures[path])
                node:attachProperty(texturingProperty)
                node:updateProperties()

                log:debug("Added decal '%s' to '%s'.", path, node.name)
            end
        end
    end
end
--[[
    Removes the given decal texture from the sceneNode.
]]
---@param sceneNode niNode The node to search the decal texture for and remove.
---@param path string|nil The path to the decal texture. If not provided, removes all decal textures.
this.removeDecal = function(sceneNode, path)
    for node in table.traverse {sceneNode} do
        node = node --[[@as niNode]]

        log:debug("Traversing node '%s'", path, node.name)
        local texturingProperty = node.texturingProperty
        if texturingProperty then
            for i in this.iterDecals(texturingProperty) do
                texturingProperty:removeDecalMap(i)
                log:debug("Removed decal '%s' to '%s'.", path, node.name)
            end
        end
    end
end

return this
