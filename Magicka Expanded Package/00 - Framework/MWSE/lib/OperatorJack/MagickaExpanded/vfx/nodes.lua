local log = require("OperatorJack.MagickaExpanded.utils.logger")
local data = require("OperatorJack.MagickaExpanded.data")

---@class MagickaExpanded.Vfx.Nodes
local this = {}

local vfx = {}

local stenciledActors = {}

local masks = {}

local vanillaStencilProperties = {}
local vanillaStencilObjects = {
    ["Left Upper Leg"] = true,
    ["Left Ankle"] = true,
    ["Left Knee"] = true,
    ["Left Upper Arm"] = true,
    ["Left Forearm"] = true,
    ["Left Wrist"] = true,
    ["Left Foot"] = true,
    ["Left Pauldron"] = true
}

local function reattachStencils(e)
    -- Initialize player.
    if e.reference == tes3.player or e.reference == tes3.player1stPerson then
        stenciledActors[e.reference] = nil
        this.attachStencilProperty(e.reference)

        -- Reset any stenciled actors since scene node was rebuilt.
    elseif stenciledActors[e.reference] then
        stenciledActors[e.reference] = nil
        this.attachStencilProperty(e.reference)
    end
end

-- Handle initializing and rebuilding scenegraph for stenciled actors.
event.register(tes3.event.referenceSceneNodeCreated, reattachStencils)

-- Handle change in equipment for stenciled actors.
event.register(tes3.event.equipped, function(e)
    timer.delayOneFrame(function()
        if e.reference == tes3.player then
            reattachStencils({reference = tes3.player1stPerson})
        end
        reattachStencils(e)
    end)
end)
event.register(tes3.event.unequipped, function(e)
    timer.delayOneFrame(function()
        if e.reference == tes3.player then
            reattachStencils({reference = tes3.player1stPerson})
        end
        reattachStencils(e)
    end)
end)

-- When invalidated, scene node will be recreated. Remove from tracking.
event.register(tes3.event.objectInvalidated,
               function(e) stenciledActors[e.object] = nil end)

masks = {
    player1st = assert(tes3.loadMesh(data.paths.stencils.player1st):getProperty(
                           ni.propertyType.stencil)),
    player = assert(tes3.loadMesh(data.paths.stencils.player):getProperty(
                        ni.propertyType.stencil)),
    playerMirror = assert(
        tes3.loadMesh(data.paths.stencils.playerMirror):getProperty(
            ni.propertyType.stencil)),
    npc = assert(tes3.loadMesh(data.paths.stencils.npc):getProperty(
                     ni.propertyType.stencil)),
    npcMirror = assert(tes3.loadMesh(data.paths.stencils.npcMirror):getProperty(
                           ni.propertyType.stencil)),
    creature = assert(tes3.loadMesh(data.paths.stencils.creature):getProperty(
                          ni.propertyType.stencil)),
    weapon = assert(tes3.loadMesh(data.paths.stencils.weapon):getProperty(
                        ni.propertyType.stencil))
}

local function attachStencilPropertyToReference(reference, mask)
    reference.sceneNode:detachProperty(ni.propertyType.stencil)
    reference.sceneNode:attachProperty(mask)
    reference.sceneNode:update()
    reference.sceneNode:updateNodeEffects()
    reference.sceneNode:updateProperties()
    stenciledActors[reference] = true
end

local function attachStencilMirrorPropertiesToReference(reference, mask)
    -- Replace vanilla arm and leg stencil property. Cache to reset later.
    for name in pairs(vanillaStencilObjects) do
        local node = reference.sceneNode:getObjectByName(name)
        if node then
            vanillaStencilProperties[name] =
                node:getProperty(ni.propertyType.stencil)
            node:detachProperty(ni.propertyType.stencil)
            node:attachProperty(mask)
        end
    end
end

local function attachWeaponStencilPropertyToReference(reference, mask)
    local node = reference.sceneNode:getObjectByName("Weapon Bone")

    if node then
        node:detachProperty(ni.propertyType.stencil)
        node:attachProperty(mask)
    end
end

--[[
    Removes stencil properties from the given actor reference, if the reference is being tracked by the framework. 
    The reference must be the player, an npc, or a creature. 
    The reference will be removed from stencil tracking.
]]
---@param reference tes3reference The reference to remove the stencil properties from.
this.detachStencilProperty = function(reference)
    if not stenciledActors[reference] then return end

    -- Dettach character stencil.
    local sceneNode = reference.sceneNode --[[@as niNode]]
    sceneNode:detachProperty(ni.propertyType.stencil)

    -- Reset vanilla stencils.
    for name in pairs(vanillaStencilObjects) do
        if not vanillaStencilProperties[name] then
            log:error("Cached vanilla stencil property not found.")
        else
            local node = sceneNode:getObjectByName(name)
            if node then
                node:detachProperty(ni.propertyType.stencil)
                node:attachProperty(vanillaStencilProperties[name])
            end
        end
    end

    sceneNode:update()
    sceneNode:updateEffects()
    sceneNode:updateProperties()
    stenciledActors[reference] = nil

    log:debug("Removed stencil properties from %s.", reference)
end

--[[
    Applies stencil properties to the given actor reference, so that stencil VFX effects can be used. The reference must be the player, an npc, or a creature. 
    The reference will be tracked for the current game session and stencil properties automatically applied when appropriate (such as when removed by the game engine).
]]
---@param reference tes3reference The reference to attach the stencil properties to. The reference must be the player, an npc, or a creature. 
this.attachStencilProperty = function(reference)
    if stenciledActors[reference] then return end

    -- Set mask paths & process
    if reference == tes3.player then
        attachStencilMirrorPropertiesToReference(reference, masks.playerMirror)
        attachWeaponStencilPropertyToReference(reference, masks.weapon)
        attachStencilPropertyToReference(reference, masks.player)

    elseif reference == tes3.player1stPerson then
        attachWeaponStencilPropertyToReference(reference, masks.weapon)
        attachStencilPropertyToReference(reference, masks.player1st)

    elseif reference.object.objectType == tes3.objectType.npc then
        attachStencilMirrorPropertiesToReference(reference, masks.npcMirror)
        attachWeaponStencilPropertyToReference(reference, masks.weapon)
        attachStencilPropertyToReference(reference, masks.npc)

    elseif reference.object.objectType == tes3.objectType.creature then
        attachWeaponStencilPropertyToReference(reference, masks.weapon)
        attachStencilPropertyToReference(reference, masks.creature)

    end

    log:debug("Added stencil properties to %s.", reference)
end

--[[
    Applies the given VFX mesh to a reference and returns the VFX node on the reference. If the reference already has the VFX applied, the existing VFX is loaded from the reference sceneNode. 
    This function will also morph the VFX mesh to account for the game enginee modifying NPC meshes due to height and weight, so that the VFX is not visibily altered.
]]
---@param reference tes3reference The reference to upsert the VFX onto.
---@param sceneObjectName string The name of the node to search for or attach. This value should match the name of the root node in the VFX mesh.
---@param path string The path of the VFX mesh to attach to the reference. The mesh must have a unique name in the root node.
---@param attachmentSceneObjectName? string The name of the node to attach the Vfx to, if desired. Otherwise, attached to the sceneNode of the reference.
---@returned NiNode
this.getOrAttachVfx = function(reference, sceneObjectName, path,
                               attachmentSceneObjectName)
    local node, sceneNode
    sceneNode = reference.sceneNode --[[@as niNode]]
    node = sceneNode:getObjectByName(sceneObjectName) --[[@as niNode]]

    if (not node) then
        if not vfx[sceneObjectName] then
            vfx[sceneObjectName] = assert(tes3.loadMesh(path))
        end
        node = vfx[sceneObjectName]:clone() --[[@as niNode]]

        if (reference.object.race) then
            if (reference.object.race.weight and reference.object.race.height) then
                local weight = reference.object.race.weight.male
                local height = reference.object.race.height.male
                if (reference.object.female == true) then
                    weight = reference.object.race.weight.female
                    height = reference.object.race.height.female
                end

                local weightMod = 1 / weight
                local heightMod = 1 / height

                local r = node.rotation
                local s = tes3vector3.new(weightMod, weightMod, heightMod)
                node.rotation = tes3matrix33.new(r.x * s, r.y * s, r.z * s)
            end
        end

        if (attachmentSceneObjectName) then
            local target = sceneNode:getObjectByName(attachmentSceneObjectName) --[[@as niNode]]
            if (not target) then
                log:error(
                    "Unable to find attachment scene node object %s to %s.",
                    attachmentSceneObjectName, reference)
                return
            end
            target:attachChild(node)
            target:update({controllers = true})
            target:updateEffects()
        else
            sceneNode:attachChild(node, true)
        end
        node:update({controllers = true})
        node:updateEffects()

        log:debug("Added object %s to %s.", sceneObjectName, reference)
    end

    return node
end

--[[
    Uses appculling to show the given NiNode, node.
]]
---@param node niNode The node to show.
this.showNode = function(node)
    if (node.appCulled == true) then node.appCulled = false end
end

--[[
    Uses appculling to hide the given NiNode, node.
]]
---@param node niNode The node to hide.
this.hideNode = function(node)
    if (node.appCulled == false) then node.appCulled = true end
end

return this
