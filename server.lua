AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() == res then
        correct = false
        if AntiCipher.Enable == nil then
            print("^1[DEBUG]^0 ServerConfig Error, AntiCipher.Enable is removed from Config... Add it Back or the Script dont work!")
            correct = false
            return
        else 
            if AntiCipher.DiscordAnnounceDetection == nil then 
                print("^1[DEBUG]^0 ServerConfig Error, AntiCipher.DiscordAnnounceDetection is removed from Config... Add it Back or the Script dont work!")
                correct = false
                return
            else 
                if AntiCipher.DiscordAnnounceDetection and AntiCipher.DiscordWebhook == "" or AntiCipher.DiscordWebhook == nil then 
                    print("^1[DEBUG]^0 ServerConfig Error, AntiCipher.DiscordWebhook is removed from Config ... Add it Back or the Script dont work! or u have AntiCipher.DiscordAnnounceDetection enabled but didnt added Webhook to AntiCipher.DiscordWebhook")
                    correct = false
                    return
                else 
                    if AntiCipher.ConsolePrint == nil then 
                        print("^1[DEBUG]^0 ServerConfig Error, AntiCipher.ConsolePrint is removed from Config... Add it Back or the Script dont work!")
                        correct = false
                        return
                    else 
                        if AntiCipher.StopServer == nil then 
                            print("^1[DEBUG]^0 ServerConfig Error, AntiCipher.StopServer is removed from Config... Add it Back or the Script dont work!")
                            correct = false
                            return
                        else 
                            correct = true 
                        end 
                    end 
                end 
            end 
        end 
        if correct and AntiCipher.Enable then 
            if AntiCipher.ConsolePrint then 
                print("^1[DEBUG] ^0Starting AntiCipher")
                print()
                print("^1[DEBUG] ^0searching for Cipher!")
                token = "AntiCipher"
                startSearchCipher(token)
                token = nil
            else 
                token = "AntiCipher"
                startSearchCipher(token)
                token = nil
            end
        end             
    end 
end)

function getFolders(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('dir "'..directory..'" /b /ad')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

  
  function scandir(directory)
      local i, t, popen = 0, {}, io.popen
      for filename in popen('dir "'..directory..'" /b'):lines() do
          i = i + 1
          t[i] = filename
      end
      return t
  end
  
  function GetFileExtension(url)
    return url:match("^.+(%..+)$")
  end
  
  function readAll(file)
    local f = io.open(file, "rb")
    if f then
        local content = f:read("*a")
        f:close()
        return content
    else
        return false
    end
end

function startSearchCipher(token)
    complicatedresourced = {}
    skippedresources = {}
    infectedresourced = {}
    if token == nil or token == "" then 
        print("^1[DEBUG] ^0Script Error in Cipher Detection!")
        return 
    else
        if token == "AntiCipher" then 
            count = 0
            skip = 0
            for resources = 0, GetNumResources() - 1 do
                local _resname = GetResourceByFindIndex(resources)
                local num = GetNumResourceMetadata(_resname, 'server_script')
                if num >  0 then
                    for i = 0, num-1 do
                        local file = GetResourceMetadata(_resname, 'server_script', i)
                        checkresource = LoadResourceFile(_resname, file)
                            if string.find(file, "*") then
                                    skip = skip + 1
                                    table.insert(complicatedresourced, {resource = _resname})
                                    scanfiles = scandir(GetResourcePath(string.gsub(_resname, '//', "/")))
                                    getfolders = getFolders(GetResourcePath(string.gsub(_resname, '//', "/")))
                                    resourcename = _resname
                                    for i,k in pairs(scanfiles) do
                                        if GetFileExtension(k) ~= nil then
                                            scaninfectedresourced = {}
                                            checkresource = readAll(GetResourcePath(resourcename) .. "/" .. k)
                                            if type(checkresource) ~= 'boolean' then
                                                if checkresource ~= nil then
                                                    local name = "nicht gefunden"
                                                    local found = false
                                                    local stringfound = false
                                                    if string.find(checkresource, 'cipher-panel') then
                                                        stringfound = "cipher-panel"
                                                        name = "[CIPHER BACKDOOR]\nCheck 1"
                                                        found = true
                                                    elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                        print("y")
                                                        stringfound = "Enchanced_Tabs"
                                                        name = "[CIPHER BACKDOOR]\nCheck 2"
                                                        found = true
                                                    elseif string.find(checkresource, 'helperServer') then
                                                        stringfound = "helperServer"
                                                        name = "[CIPHER BACKDOOR]\nCheck 4"
                                                        found = true
                                                    elseif string.find(checkresource, 'ketamin.cc') then
                                                        stringfound = "ketamin.cc"
                                                        name = "[CIPHER BACKDOOR]\nCheck 6"
                                                        found = true
                                                    elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                        stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                        name = "[CIPHER BACKDOOR]\nCheck 7"
                                                        found = true
                                                    elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                        stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                        name = "[CIPHER BACKDOOR]\nCheck 7"
                                                        found = true
                                                    elseif string.find(checkresource, 'MpWxwQeLMRJaDFLKmxVIFNeVfzVKaTBiVRvjBoePYciqfpJzxjNPIXedbOtvIbpDxqdoJR') then 
                                                        stringfound = "MpWxwQeLMRJaDFLKmxVIFNeVfzVKaTBiVRvjBoePYciqfpJzxjNPIXedbOtvIbpDxqdoJR"
                                                        name = "[CIPHER BACKDOOR]\nCheck 8"
                                                        found = true
                                                    end
                                            
                                                    if found then
                                                        table.insert(infectedresourced, {resource = resourcename .. '/' .. k, name = name, stringfound = stringfound})
                                                    end
                                                end
                                            end
                                        end
                                    end
    
                            else
                                if checkresource ~= nil and resourcename ~= 'monitor' and _resname ~= GetCurrentResourceName() then
                                    count = count + 1
                                    local name = "nicht gefunden"
                                    local found = false
                                    local stringfound = false
                                    if type(checkresource) ~= 'boolean' then
                                            if string.find(checkresource, 'cipher-panel') then
                                                stringfound = "cipher-panel"
                                                name = "[CIPHER BACKDOOR]\nCheck 1"
                                                found = true
                                            elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                stringfound = "Enchanced_Tabs"
                                                name = "[CIPHER BACKDOOR]\nCheck 2"
                                                found = true
                                            elseif string.find(checkresource, 'helperServer') then
                                                stringfound = "helperServer"
                                                name = "[CIPHER BACKDOOR]\nCheck 4"
                                                found = true
                                            elseif string.find(checkresource, 'ketamin.cc') then
                                                stringfound = "ketamin.cc"
                                                name = "[CIPHER BACKDOOR]\nCheck 6"
                                                found = true
                                            elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                name = "[CIPHER BACKDOOR]\nCheck 7"
                                                found = true
                                            elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                name = "[CIPHER BACKDOOR]\nCheck 7"
                                                found = true
                                            elseif string.find(checkresource, 'MpWxwQeLMRJaDFLKmxVIFNeVfzVKaTBiVRvjBoePYciqfpJzxjNPIXedbOtvIbpDxqdoJR') then 
                                                stringfound = "MpWxwQeLMRJaDFLKmxVIFNeVfzVKaTBiVRvjBoePYciqfpJzxjNPIXedbOtvIbpDxqdoJR"
                                                name = "[CIPHER BACKDOOR]\nCheck 8"
                                                found = true
                                            end
                                            if found then
                                                table.insert(infectedresourced, {resource = _resname .. '/' .. file, name = name, stringfound = stringfound})
                                            end
                                    end
                                end
                        end
                    end
                else
                    local file = GetResourceMetadata(_resname, 'server_script', 0)
                end
            end
            string2 = ""
            for i,k in pairs(infectedresourced) do
            string2 = string2 .. '\n+ ' .. k.resource .. "\nSearch for: [" .. k.stringfound .. "]"
            string4 = '\n+ **' .. k.resource .. "**\n\nSearch for: **[" .. k.stringfound .. "]**"
            end
    
            string3 = ""
            for i,k in pairs(skippedresources) do
                string3 = string3 .. '\n+ ' .. k.resource
            end
        
    
            if string2 ~= "" then
                if AntiCipher.ConsolePrint then 
                    print("^1[DEBUG]^0 Found Backdoor")
                    print("^1", string2, "^0") 
                end
                if AntiCipher.DiscordAnnounceDetection then 
                    local connect = {
                        {
                            ["color"] = 16711680,
                            ["title"] = "**Found Backdoor**",
                            ["description"] = "Backdoor found in: "..string4.."",
                            ["footer"] = {["text"] = "Developed By Plant.Bronze"}
                        }
                    }
                    PerformHttpRequest(AntiCipher.DiscordWebhook, function(err, text, headers) end, 'POST',json.encode({username = "Anti Backdoor",embeds = connect}), {['Content-Type'] = 'application/json'})
                end 
                if AntiCipher.StopServer then 
                    Citizen.Wait(2000)
                    os.exit()
                end
                return
            end
        else 
            print("^1[DEBUG] ^0Script Error in Cipher Detection!!")
        end 
    end 
end 