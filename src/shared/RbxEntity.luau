local mod = {}
local testdummy = script["Unnamed Entity"]
local entityobj = require(script.Parent.rbxentmodules.EntityObj)
local entities = {}
local entcount = 1

function mod:createEntity()
	print("Creating new entity with ID: "..entcount)
	local ent = testdummy:Clone()
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