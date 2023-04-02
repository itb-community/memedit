
function SpaceDamage:GetProjectileArt()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		result = memedit:require().spaceDamage.getProjectileArt(self)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:GetSource()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		local memedit = memedit:require()
		return Point(
			memedit.spaceDamage.getSourceX(self),
			memedit.spaceDamage.getSourceY(self)
		)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:GetType()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		result = memedit:require().spaceDamage.getType(self)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:SetProjectileArt(projectileArt)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.Equals("string", type(projectileArt), "Argument #1")

	try(function()
		memedit:require().spaceDamage.setProjectileArt(self, projectileArt)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end


function SpaceDamage:SetSource(source)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.TypePoint(source, "Argument #1")

	try(function()
		local memedit = memedit:require()
		memedit.spaceDamage.setSourceX(self, source.x)
		memedit.spaceDamage.setSourceY(self, source.y)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end


function SpaceDamage:SetType(objType)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.Equals("number", type(objType), "Argument #1")

	try(function()
		memedit:require().spaceDamage.setType(self, objType)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end
