---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Settings
local Active = "/heal" -- Heal Activate command.
local Active2 = "/healme" -- Heal Activate command 2.
---------------------
local Warning = "You can not use it here!" -- Warning Text.
local WarningColor = Color.Red -- Warning Color.
local DoneText = "You are healed." -- Done Text.
local DoneColor = Color.Chartreuse -- Done Color.
---------------------
local Health = 1 -- Health LVL. (Use: 0.1 - 1)
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Script
class 'HealMe'

function HealMe:__init()
	Events:Subscribe( "PlayerChat", self, self.PlayerChat )
end

function HealMe:PlayerChat( args )
    local cmd_args = args.text:split( " " )

    if cmd_args[1] == Active or cmd_args[1] == Active2 then
		if args.player:GetWorld() ~= DefaultWorld then
			Chat:Send(args.player, Warning, WarningColor )
			return
		end		
		args.player:SetHealth(Health)
		Chat:Send(args.player, DoneText, DoneColor)
        return false
    end

    return true
end

healme = HealMe()
-----------------------------------------------------------------------------------

--v0.1--
--03.17.18--