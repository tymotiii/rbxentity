local obj = {}
obj.__index = obj

function obj.new(model: Model, id)
    local self = setmetatable({}, obj)

    self.model = model
    self.id = id
    self.deleted = false

    return self
end

function obj:setName(name)
    self.model.Name = name
end

function obj:getName()
    return self.model.Name
end

function obj:Spawn()
    print("Spawning entity with id: "..self.id)
    self.model.Parent = workspace
end

function obj:DeSpawn()
    print("Despawning entity with id: "..self.id)
    self.model.Parent = script
end

function obj:getEntityModel()
    return self.model
end

function obj:setEntityModel(mod: Model)
    self.model = mod
end

function obj:Anchor()
    for _, v in self.model:GetDescendants() do
        if v:IsA("MeshPart") or v:IsA("Part") then
            v.Anchored = true
        end
    end
end

function obj:unAnchor()
    for _, v in self.model:GetDescendants() do
        if v:IsA("MeshPart") or v:IsA("Part") then
            v.Anchored = false
        end
    end
end

function obj:setCFrame(Cf: CFrame)
    self.model.HumanoidRootPart.CFrame = Cf
end

function obj:getCFrame()
    return self.model.HumanoidRootPart.CFrame
end

function obj:DeleteEntity()
    print("Deleting entity ID: "..self.id)
    self.model:Destroy()
    game.ReplicatedStorage.Shared.RbxEntity.RemoveEntity:Invoke(self.id)
    self.model = nil
    self.deleted = true
end

function obj:exists()
    return not self.deleted
end

return obj
