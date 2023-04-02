
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local POINT_ZERO = Point(0,0)
local inheritClass = utils.inheritClass
local scans = {}


scans.acid = inheritClass(Scan, {
	id = "Acid",
	name = "SpaceDamage Acid",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iAcid = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.animation = inheritClass(Scan, {
	id = "Animation",
	name = "SpaceDamage Animation",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sAnimation = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sAnimation)
		self:evaluateResults()
	end
})


scans.animState = inheritClass(Scan, {
	id = "AnimState",
	name = "SpaceDamage AnimState",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local fx = SkillEffect()
		local state = math.random(3,7)
		fx:AddAnimation(POINT_ZERO, "", state)

		self:searchSpaceDamage(fx.effect:back(), state)
		self:evaluateResults()
	end
})


scans.crack = inheritClass(Scan, {
	id = "Crack",
	name = "SpaceDamage Crack",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iCrack = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.damage = inheritClass(Scan, {
	id = "Damage",
	name = "SpaceDamage Damage",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iDamage = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.delay = inheritClass(Scan, {
	id = "Delay",
	name = "SpaceDamage Delay",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "float",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.fDelay = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.evacuate = inheritClass(Scan, {
	id = "Evacuate",
	name = "SpaceDamage Evacuage",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bEvacuate = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.fire = inheritClass(Scan, {
	id = "Fire",
	name = "SpaceDamage Fire",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iFire = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.frozen = inheritClass(Scan, {
	id = "Frozen",
	name = "SpaceDamage Frozen",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iFrozen = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.grappleAnim = inheritClass(Scan, {
	id = "GrappleAnim",
	name = "SpaceDamage GrappleAnim",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "string",
	action = function(self)
		local fx = SkillEffect()
		local str = "find me"
		fx:AddGrapple(POINT_ZERO, POINT_ZERO, str)

		self:searchSpaceDamage(fx.effect:back(), str)
		self:evaluateResults()
	end
})


scans.grappleTargetX = inheritClass(Scan, {
	id = "GrappleTargetX",
	name = "SpaceDamage GrappleTargetX",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local fx = SkillEffect()
		local target = Point(math.random(3,7),0)
		fx:AddGrapple(POINT_ZERO, target, "")

		self:searchSpaceDamage(fx.effect:back(), target.x)
		self:evaluateResults()
	end
})

scans.grappleTargetY = inheritClass(Scan, {
	id = "GrappleTargetY",
	name = "SpaceDamage GrappleTargetY",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local fx = SkillEffect()
		local target = Point(0,math.random(3,7))
		fx:AddGrapple(POINT_ZERO, target, "")

		self:searchSpaceDamage(fx.effect:back(), target.y)
		self:evaluateResults()
	end
})


scans.hide = inheritClass(Scan, {
	id = "Hide",
	name = "SpaceDamage Hide",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bHide = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.hideIcon = inheritClass(Scan, {
	id = "HideIcon",
	name = "SpaceDamage HideIcon",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bHideIcon = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.hidePath = inheritClass(Scan, {
	id = "HidePath",
	name = "SpaceDamage HidePath",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bHidePath = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.imageMark = inheritClass(Scan, {
	id = "ImageMark",
	name = "SpaceDamage ImageMark",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sImageMark = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sImageMark)
		self:evaluateResults()
	end
})


scans.injure = inheritClass(Scan, {
	id = "Injure",
	name = "SpaceDamage Frozen",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iInjure = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.item = inheritClass(Scan, {
	id = "Item",
	name = "SpaceDamage Item",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sItem = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sItem)
		self:evaluateResults()
	end
})


scans.koEffect = inheritClass(Scan, {
	id = "KO_Effect",
	name = "SpaceDamage KO_Effect",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bKO_Effect = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.moveType = inheritClass(Scan, {
	id = "MoveType",
	name = "SpaceDamage MoveType",
	prerequisiteScans = {"vital.size_space_damage"},
	access = "RW",
	dataType = "int",
	action = function(self)
		local moveType = random_element{
			SPACE_DAMAGE_PLIST_TYPE_MOVE,
			SPACE_DAMAGE_PLIST_TYPE_LEAP,
			SPACE_DAMAGE_PLIST_TYPE_CHARGE,
			SPACE_DAMAGE_PLIST_TYPE_MELEE,
			SPACE_DAMAGE_PLIST_TYPE_BURROW,
		}
		local fx = SkillEffect()
		local plist = PointList() plist:push_back(POINT_ZERO) plist:push_back(POINT_ZERO)

		if moveType == SPACE_DAMAGE_PLIST_TYPE_MOVE then
			fx:AddMove(plist, 0)
		elseif moveType == SPACE_DAMAGE_PLIST_TYPE_LEAP then
			fx:AddLeap(plist, 0)
		elseif moveType == SPACE_DAMAGE_PLIST_TYPE_CHARGE then
			fx:AddCharge(plist, 0)
		elseif moveType == SPACE_DAMAGE_PLIST_TYPE_MELEE then
			fx:AddMelee(POINT_ZERO, SpaceDamage())
		elseif moveType == SPACE_DAMAGE_PLIST_TYPE_BURROW then
			fx:AddBurrow(plist, 0)
		end

		self:searchSpaceDamage(fx.effect:back(), moveType)
		self:evaluateResults()
	end
})


scans.pawnTeam = inheritClass(Scan, {
	id = "PawnTeam",
	name = "SpaceDamage PawnTeam",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iPawnTeam = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.push = inheritClass(Scan, {
	id = "Push",
	name = "SpaceDamage Push",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iPush = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.script = inheritClass(Scan, {
	id = "Script",
	name = "SpaceDamage Script",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sScript = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sScript)
		self:evaluateResults()
	end
})


scans.shield = inheritClass(Scan, {
	id = "Shield",
	name = "SpaceDamage Shield",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iShield = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.simpleMark = inheritClass(Scan, {
	id = "SimpleMark",
	name = "SpaceDamage SimpleMark",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "bool",
	action = function(self)
		local rand = math.random(0, 1)
		local spaceDamage = SpaceDamage()
		spaceDamage.bSimpleMark = rand == 1

		self:searchSpaceDamage(spaceDamage, rand, "byte")
		self:evaluateResults()
	end
})


scans.smoke = inheritClass(Scan, {
	id = "Smoke",
	name = "SpaceDamage Smoke",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iSmoke = val

		self:searchSpaceDamage(spaceDamage, val)
		self:evaluateResults()
	end
})


scans.sound = inheritClass(Scan, {
	id = "Sound",
	name = "SpaceDamage Sound",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sSound = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sSound)
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


scans.pawn = inheritClass(Scan, {
	id = "Pawn",
	name = "SpaceDamage Pawn",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "string",
	action = function(self)
		local spaceDamage = SpaceDamage()
		spaceDamage.sPawn = "find me"

		self:searchSpaceDamage(spaceDamage, spaceDamage.sPawn)
		self:evaluateResults()
	end
})


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


scans.targetX = inheritClass(Scan, {
	id = "TargetX",
	name = "SpaceDamage TargetX",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local target = Point(math.random(3,7), 0)
		local spaceDamage = SpaceDamage()
		spaceDamage.loc = target

		self:searchSpaceDamage(spaceDamage, target.x)
		self:evaluateResults()
	end
})


scans.targetY = inheritClass(Scan, {
	id = "TargetY",
	name = "SpaceDamage TargetY",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local target = Point(0, math.random(3,7))
		local spaceDamage = SpaceDamage()
		spaceDamage.loc = target

		self:searchSpaceDamage(spaceDamage, target.y)
		self:evaluateResults()
	end
})


scans.terrain = inheritClass(Scan, {
	id = "Terrain",
	name = "SpaceDamage Terrain",
	prerequisiteScans = {"vital.size_space_damage"},
	dataType = "int",
	action = function(self)
		local val = math.random(3,7)
		local spaceDamage = SpaceDamage()
		spaceDamage.iTerrain = val

		self:searchSpaceDamage(spaceDamage, val)
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
