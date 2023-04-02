
function SpaceDamage:GetAnimState()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		result = memedit:require().spaceDamage.getAnimState(self)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:GetGrappleAnim()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		result = memedit:require().spaceDamage.getGrappleAnim(self)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:GetGrappleTarget()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		local memedit = memedit:require()
		result = Point(
			memedit.spaceDamage.getGrappleTargetX(self),
			memedit.spaceDamage.getGrappleTargetY(self)
		)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


function SpaceDamage:GetMoveType()
	Assert.Equals("userdata", type(self), "Argument #0")

	local result

	try(function()
		result = memedit:require().spaceDamage.getMoveType(self)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)

	return result
end


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


function SpaceDamage:SetAnimState(busyState)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.Equals("number", type(busyState), "Argument #1")

	try(function()
		memedit:require().spaceDamage.setAnimState(self, busyState)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end


function SpaceDamage:SetGrappleAnim(anim)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.Equals("string", type(anim), "Argument #1")

	try(function()
		memedit:require().spaceDamage.setGrappleAnim(self, anim)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end


function SpaceDamage:SetGrappleTarget(target)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.TypePoint(target, "Argument #1")

	try(function()
		local memedit = memedit:require()
		memedit.spaceDamage.setGrappleTargetX(self, target.x)
		memedit.spaceDamage.setGrappleTargetY(self, target.y)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
end


function SpaceDamage:SetMoveType(moveType)
	Assert.Equals("userdata", type(self), "Argument #0")
	Assert.Equals("number", type(moveType), "Argument #1")

	try(function()
		memedit:require().spaceDamage.setMoveType(self, moveType)
	end)
	:catch(function(err)
		error("memedit.dll: "..tostring(err))
	end)
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
