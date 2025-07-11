---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Settings
local command = "/heal" -- Command to heal.
---------------------
local warning = "You can not use it here!" -- Warning text
local warningColor = Color.Red -- Warning color
local doneText = "You are healed." -- Done text
local doneColor = Color.Chartreuse -- Done color
---------------------
local health = 1 -- Health level (Use: 0.1 - 1)
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Script
class 'HealMe'

function HealMe:__init()
    Events:Subscribe("PlayerChat", self, self.PlayerChat)
end

function HealMe:PlayerChat(args)
    local cmd_args = args.text:split(" ")

    if cmd_args[1] == command then
        if args.player:GetWorld() ~= DefaultWorld then
            Chat:Send(args.player, warning, warningColor)
            return
        end

        args.player:SetHealth(args.player:GetHealth() + health)
        Chat:Send(args.player, doneText, doneColor)

        return false
    end
end

local healme = HealMe()
-----------------------------------------------------------------------------------

--v0.2--
--11.07.25--