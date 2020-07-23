local function bottleneck()
    if remote.interfaces["Bottleneck"] and remote.interfaces["Bottleneck"]["blacklist_name"] then
        remote.call("Bottleneck", "blacklist_name", "liquify2-liquifier")
    end
end

script.on_init(bottleneck);
script.on_load(bottleneck);
