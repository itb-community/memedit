
local function onGameClassInitialized(GameClass, game)

	GameClass.GetReputation = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().game.getMoney()
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end
	
	GameClass.GetResist = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().game.getResist()
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	GameClass.SetReputation = function(self, reputation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(reputation), "Argument #1")

		try(function()
			memedit:require().game.setMoney(reputation)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end
	
	GameClass.SetResist = function(self, resist)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(resist), "Argument #1")

		try(function()
			memedit:require().game.setResist(resist)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end
end

modApi.events.onGameClassInitialized:subscribe(onGameClassInitialized)
