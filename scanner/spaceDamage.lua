
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local POINT_ZERO = Point(0,0)
local inheritClass = utils.inheritClass
local scans = {}


scans.projectileArt = inheritClass(Scan, {
	id = "ProjectileArt",
	name = "SpaceDamage ProjectileArt",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "string",
	action = function(self)
		local projectileArt = "find_me"
		local fx = SkillEffect()
		fx:AddProjectile(POINT_ZERO, SpaceDamage(POINT_ZERO), projectileArt, NO_DELAY)

		self:searchSpaceDamage(fx.effect:back(), projectileArt)
		self:evaluateResults()
	end
})


scans.sourceX = inheritClass(Scan, {
	id = "SourceX",
	name = "SpaceDamage SourceX",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local source = Point(math.random(3,7),0)
		local fx = SkillEffect()
		fx:AddProjectile(source, SpaceDamage(POINT_ZERO), "", NO_DELAY)

		self:searchSpaceDamage(fx.effect:back(), source.x)
		self:evaluateResults()
	end
})


scans.sourceY = inheritClass(Scan, {
	id = "SourceY",
	name = "SpaceDamage SourceY",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local source = Point(0,math.random(3,7))
		local fx = SkillEffect()
		fx:AddProjectile(source, SpaceDamage(POINT_ZERO), "", NO_DELAY)

		self:searchSpaceDamage(fx.effect:back(), source.y)
		self:evaluateResults()
	end
})


scans.type = inheritClass(Scan, {
	id = "Type",
	name = "SpaceDamage Type",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local spaceDamage
		local type = math.random(0,2)
		if type == 0 then
			spaceDamage = SpaceDamage()

		elseif type == 1 then
			local fx = SkillEffect()
			fx:AddArtillery(POINT_ZERO, SpaceDamage(POINT_ZERO), "", NO_DELAY)
			spaceDamage = fx.effect:back()

		elseif type == 2 then
			local fx = SkillEffect()
			fx:AddProjectile(POINT_ZERO, SpaceDamage(POINT_ZERO), "", NO_DELAY)
			spaceDamage = fx.effect:back()
		end

		self:searchSpaceDamage(spaceDamage, type)
		self:evaluateResults()
	end
})


return scans
