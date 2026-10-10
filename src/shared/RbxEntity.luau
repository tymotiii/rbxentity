local mod = {}
local entityobj = require(script.Parent.rbxentmodules.EntityObj)
local entities = {}
local entcount = 1
const plrs = game:GetService("Players")
local removeEntityEvent = Instance.new("BindableFunction")
removeEntityEvent.Parent = script
removeEntityEvent.Name = "RemoveEntity"
removeEntityEvent.OnInvoke = function(id)
	print("[debug] bindable: entities[id] = nil. ")
	entities[id] = nil
end

function mod:createEntity(modelusername)
	print("Creating new entity with ID: "..entcount)
	local ent = plrs:CreateHumanoidModelFromUserIdAsync(plrs:GetUserIdFromNameAsync(modelusername))
	ent.Name = "Unnamed Entity"
	local entobj = entityobj.new(ent, entcount)
	entities[entcount] = entobj
	entcount += 1
	
	return entobj
end

function mod:id_getEntity(id)
	return entities[id]
end

function mod:id_getEntityExistsFrom(id)
	return entities[id]:exists()
end

return mod