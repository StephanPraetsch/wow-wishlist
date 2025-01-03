local addonName, addonData = ...

addonData.Hooks = {

    init = function()
        local dbGlobal = WOW_WISHLIST_Database_Global
        local dbChar = WOW_WISHLIST_Database_Chars
        hooksecurefunc("JumpOrAscendStart", function()
            if dbGlobal.reportJump then
                dbChar.jumps = (dbChar.jumps or 0) + 1
                print("Your character " .. Meta.player .. " jumped " .. dbChar.jumps .. " times")
            end
        end)
    end

}
