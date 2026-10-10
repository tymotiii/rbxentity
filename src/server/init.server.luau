local rbxent = require(game.ReplicatedStorage.Shared.RbxEntity)

local ent1 = rbxent:createEntity()

ent1:setName("Hello world!")
ent1:Spawn("fdsafada")
const myid = ent1.id
ent1:DeleteEntity()

warn(rbxent:id_getEntityExistsFrom(myid))