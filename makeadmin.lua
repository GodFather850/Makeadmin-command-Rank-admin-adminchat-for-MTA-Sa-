---@diagnostic disable: undefined-global
-- Scripted By GodFather
-- variables ----->
local accSYs = exports["Accounts-System"]
--===================================================================================================================
--___________________commands_________________
-- chat admins for staff and managements
addCommandHandler("a", function(thePlayer, cmd, ...)
    if getElementData(thePlayer, "loggedIn") ~= true then return end 

    local playerAccount = accSys:getPlayerAcc(thePlayer)
    local playerAdminLevel = tonumber(getElementData(playerAccount, "pAdmin")) or 0

    if playerAdminLevel == 0 then
        return false
    end

    if not (...) then  --Text Message
        exports["notf"]:addNotification(thePlayer, "/a <Text>", 'info')
        return false
    end

    local message = string.sub(table.concat({...}, " "), 1, 90) -- input message and show
    
    if string.find(string.sub(message, 1, 1), " ") then
        return false
    end

    -- admins rank name and color
    local adminRanks = {
        [1] = {title = "Hoster", color = "#773842", prefixColor = "#7E2C00"},
        [2] = {title = "VIP", color = "#FFD700", prefixColor = "#7E2C00"},
        [3] = {title = "Maper", color = "#C8720B", prefixColor = "#7E2C00"},
        [4] = {title = "Designer", color = "#bababa", prefixColor = "#7E2C00"},
        [5] = {title = "Modeler", color = "#DAA520", prefixColor = "#7E2C00"},
        [6] = {title = "Content Creator", color = "#6495ED", prefixColor = "#7E2C00"},
        [7] = {title = "Streamer", color = "#6495ED", prefixColor = "#7E2C00"},
        [8] = {title = "Trial", color = "#F0E68C", prefixColor = "#7E2C00"},
        [9] = {title = "Operator", color = "#0059FF", prefixColor = "#7E2C00"},
        [10] = {title = "Moderator", color = "#8F0000", prefixColor = "#FFBB00"},
        [11] = {title = "Bronze", color = "#FB1203", prefixColor = "#7E2C00"},
        [12] = {title = "Silver", color = "#77FF00", prefixColor = "#ff0000"},
        [13] = {title = "Gold", color = "#FBCA03", prefixColor = "#7E2C00"},
        [14] = {title = "Plutinum", color = "#96ff00", prefixColor = "#7E2C00"},
        [15] = {title = "Senior", color = "#8F0000", prefixColor = "#FFBB00"},
        [16] = {title = "Assistant", color = "#818181", prefixColor = "#7E2C00"},
        [17] = {title = "Head Admin", color = "#00FFFF", prefixColor = "#008080"},
        [18] = {title = "Mafia Manager", color = "#00FFFF", prefixColor = "#008080"},
        [19] = {title = "Social", color = "#00FFFF", prefixColor = "#008080"},
        [20] = {title = "Content Manager", color = "#00FFFF", prefixColor = "#008080"},
        [21] = {title = "Faction Manager", color = "#00FFFF", prefixColor = "#008080"},
        [22] = {title = "Helper Manager", color = "#00FFFF", prefixColor = "#008080"},
        [23] = {title = "Executive", color = "#00FFFF", prefixColor = "#008080"},
        [24] = {title = "SuperVisur", color = "#00FFFF", prefixColor = "#008080"},
        [25] = {title = "Staff Boos", color = "#00FFFF", prefixColor = "#008080"},
        [26] = {title = "Manager", color = "#00FFFF", prefixColor = "#008080"},
        [27] = {title = "Administrator", color = "#00FFFF", prefixColor = "#008080"},
        [28] = {title = "Owner", color = "#00FFFF", prefixColor = "#008080"},
        [29] = {title = "Co-Scripter", color = "#00FFFF", prefixColor = "#008080"},
        [30] = {title = "Scripter", color = "#00FFFF", prefixColor = "#00FF6F"}
    }

    local playerRank = adminRanks[playerAdminLevel] or {title = "Unknown", color = "#FFFFFF", prefixColor = "#FFFFFF"}
    
    local playerName = getPlayerName(thePlayer):gsub("_", " ")
    
    -- loop: output message for admins
    for _, adminPlayer in ipairs(getElementsByType("player")) do
        if getElementData(adminPlayer, "loggedIn") == true then
            local adminAccount = accSys:getPlayerAcc(adminPlayer)
            local adminLevel = tonumber(getElementData(adminAccount, "pAdmin")) or 0
            
            if adminLevel >= 1 then -- admin chat style
                outputChatBox(--[[playerRank.prefixColor .. ""]] playerRank.color .. "((" .. playerRank.title .. ")(" .. 
                             "#a230ff " .. playerName .. ")): #ffffff" .. message .. "" .. playerRank.prefixColor .. "", 
                             adminPlayer, 54, 181, 75, true)
            end
        end
    end
end)


--==================================================================================================================================

-- /makeadmin # for create new admin
addCommandHandler("makeadmin", function (thePlayer, command, player, admin)
    if tonumber(getElementData(accSYs:getPlayerAcc(thePlayer), "pAdmin")) <= 27 then
        return false
    end

    if thePlayer then
        if player then
            local admin = tonumber(admin) -- make int admin rank
            if admin then
                local name = getPlayerName(thePlayer)
                local playername = getPlayerName(player)
                setElementData(accSYs:getPlayerAcc(player), "pAdmin", admin) -- set player rank with administrator
                for i in ipairs(getElementsByType(" player ")) do
                    outputChatBox("#FF0000[Admin System]: Player [#FFFFFF"..playername.."#FF0000] By Administrator [#FFFFFF"..name.."#FF0000] Join Team Staff! #FFAE00Rank: "..admin)
                end
            else
                exports["notf"]:addNotification(thePlayer, "Please Enter admin rank", 'error')
            end
        else
            exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
        end
    else
        exports["notf"]:addNotification(thePlayer, "Syntax: /makeadmin <player> <Admin_Rank>", 'info')
    end
end)