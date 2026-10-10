local rbxent = require(game.ReplicatedStorage.Shared.RbxEntity)

local ent1 = rbxent:createEntity("tymos1316")

ent1:setName("Hello world!")
ent1:Spawn("fdsafada")
ent1:Anchor()
task.wait(10)
ent1:unAnchor()