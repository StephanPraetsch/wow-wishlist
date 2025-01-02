local addonName, addonData = ...

addonData.Hooks = {

    init = function()
        local db = WOW_WISHLIST_Database
        hooksecurefunc("JumpOrAscendStart", function()
            if db.reportJump then
                db[Meta.id].jumps = (db[Meta.id].jumps or 0) + 1
                print("Your character " .. Meta.player .. " jumped " .. db[Meta.id].jumps .. " times")
            end
        end)
    end

}
