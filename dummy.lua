
-- Dummy objects used for scanning memory.

-- Dynamic objects
memedit_scanPawn = Pawn:new{}
memedit_scanItem = {Image = "", Damage = SpaceDamage(), Tooltip = "", Icon = "", UsedImage = ""}
memedit_scanWeapon = Skill:new{}
memedit_scanWeapon_A = memedit_scanWeapon:new{}
memedit_scanWeapon_B = memedit_scanWeapon:new{}
memedit_scanWeapon_AB = memedit_scanWeapon:new{}

-- Static objects
memedit_weapon = Skill:new{}
memedit_weaponPawn = Pawn:new{ SkillList = {"memedit_weapon"} }
memedit_weaponReset = memedit_weapon:new{
	Name = "Reset Scan Pawn",
	Description = "Remove the current Scan Pawn, and retry.",
}

function memedit_weapon:GetTargetArea(p)
	local ret = PointList()

	for i,p in ipairs(Board) do
		ret:push_back(p)
	end

	return ret
end

function memedit_weapon:GetSkillEffect(p1, p2)
	local ret = SkillEffect()

	ret:AddDamage(SpaceDamage(p2))

	return ret
end

memedit_weaponQueued = memedit_weapon:new{}

function memedit_weaponQueued:GetSkillEffect(p1, p2)
	local ret = SkillEffect()

	ret:AddQueuedDamage(SpaceDamage(p2))

	return ret
end

memedit_scanMove = Move:new{}
memedit_scanMove.GetTargetArea = memedit_weapon.GetTargetArea

function memedit_scanMove:TeardownEvent()
	if self.Teardown then
		self.Teardown(self.Caller)
	end

	self.TargetEvent = nil
	self.BeforeEffectEvent = nil
	self.AfterEffectEvent = nil
	self.Caller = nil
	self.Teardown = nil
end

function memedit_scanMove:SetEvents(options)
	self:TeardownEvent()

	self.TargetEvent = options.TargetEvent
	self.BeforeEffectEvent = options.BeforeEffectEvent
	self.AfterEffectEvent = options.AfterEffectEvent
	self.Caller = options.Caller
	self.Teardown = options.Teardown
end

function memedit_scanMove:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local pawn = Board:GetPawn(p1)

	if pawn and self.TargetEvent then
		self.TargetEvent(self.Caller, pawn, p1, p2)
	end

	if pawn then
		ret:AddScript(string.format([[
			local pawn = Board:GetPawn(%s) 
			if pawn then 
				if memedit_scanMove.BeforeEffectEvent then 
					memedit_scanMove.BeforeEffectEvent(memedit_scanMove.Caller, pawn, %s, %s) 
				end 
			end
		]], pawn:GetId(), p1:GetString(), p2:GetString()))
	end

	ret:AddMove(Board:GetPath(p1, p2, PATH_FLYER), FULL_DELAY)

	if pawn then
		ret:AddScript(string.format([[
			local fx = SkillEffect() 
			fx:AddScript([=[
				local pawn = Board:GetPawn(%s) 
				if pawn then 
					if memedit_scanMove.AfterEffectEvent then 
						memedit_scanMove.AfterEffectEvent(memedit_scanMove.Caller, pawn, %s, %s) 
					end 
				end
			]=]) 
			Board:AddEffect(fx)
		]], pawn:GetId(), p1:GetString(), p2:GetString()))
	end

	return ret
end
