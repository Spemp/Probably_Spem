local combatRotation = {
	
	--Dark Intent
	{"!109773", "!player.buffs.multistrike"},
	{"!109773", "!player.buffs.spellpower"},
	
-- Cooldowns
	-- Dark Souls & Archimondes Darness
--	{"113861", {"modifier.cooldowns", "!talent(16)", "target.debuff(47960)", "player.spell(105174).charges = 0"}},
--	{"113861", {"modifier.cooldowns", "talent(16)", "player.spell(113861).charges = 2", "target.debuff(47960)", "player.spell(105174).charges = 0"}},
--	{"113861", {"modifier.cooldowns", "target.debuff(47960)", "!player.buff(113861)", "player.spell(105174).charges = 0"}},
	
	--Imp Swarm
	{"104316", {"modifier.cooldowns", "target.range <= 40", "player.spell(113861).cooldown >= 50"}},
	{"104316", {"modifier.cooldowns", "target.range <= 40", "player.spell(113861).cooldown >= 50"}},
	{"104316", {"modifier.cooldowns", "target.debuff(47960)", "target.range <= 40"}},
	
	--Defensive(s) & Utilities
	{"#5512", "player.health < 30"}, -- Healthstones
	{"104773", "modifier.lcontrol"}, -- Unending Resolve
	{"108416", "modifier.lalt"},
	{"30283", "modifier.lshift"},
	
	--Pet
	{"119898", "pet.energy > 60"}, --Command Demon
	{"89766", {"modifier.interrupt", "target.interruptAt(40)"}}, -- Axe Toss
	
--Rotation
	--Life Tap
	{"1454", {"player.mana <= 40", "player.health >= 70"}},
	
	-- Out of Metamorphosis
	{{
	{"172", "target.debuff(146739).duration < 5"}, -- Corruption
	{"103958", {"target.debuff(47960)", "player.spell(105174).charges = 0", "!player.buff(103958)", "player.buff(113861)", "player.demonicfury >= 300"}}, -- Metamorphosis with Dark Souls
	{"103958", {"target.debuff(47960)", "player.spell(105174).charges = 0", "!player.buff(103958)", "player.demonicfury >= 650"}}, -- Metamorphosis at 650 Demonicfury with dots up
	{"103958", {"!player.buff{103958)", "player.demonicfury >= 950"}}, -- Metamorphosis at 950 no matter what
	{"105174", {"player.spell(105174).charges >= 2", "!target.debuff(47960)", "!player.lastcast"}}, --Hand of Gul'dan
	{"105174", {"target.debuff(47960)", "target.debuff(47960).duration <= 4", "!player.lastcast"}}, --Hand of Gul'dan
	{"105174", {"player.spell(105174).charges >= 1", "player.spell(105174).cooldown <= 4", "!player.lastcast"}},
	{"6353", {"player.buff(122351)", "player.buff(113861).duration <= 4"}}, -- Soulfire with Molten Core if Dark Souls is about to drop
	{"6353", {"player.buff(140074)", "player.buff(113861).duration <= 4"}}, -- Soulfire with Molten Core if Dark Souls is about to drop(With Codex)
	{"6353", {"player.buff(122351).count >= 4", "!player.spell(101508).exists"}},	-- Soulfire if MoltenCore is at 4 or more stacks
	{"6353", {"player.buff(140074).count >= 4", "player.spell(101508).exists"}}, -- With Codex
	{"6353", "target.health <= 25", "target"}, -- Soulfire @ 25% health
	{"686" }, -- Shadowbolt as filler
	}, "!player.buff(103958)"}, -- Only cast this sequence out of Metamorphosis
	
	{{
	{"603", "target.debuff(603).duration < 18"}, -- Doom
	{"124916" }, -- Chaos Wave
	{"103964", "target.debuff(146739).duration < 5"}, -- Touch of Chaos if Corruption is dropping too low
	{"103964", "player.moving"}, -- Touch of Chaos if moving
	{"157695", "player.debuff(157695).count < 5"}, -- Get Demonbolt up to 4 stacks of debuff
	{"6353", {"player.debuff(157695).count = 4", "player.buff(122351)", "!player.spell(101508).exists"}}, -- Soul Fire if Demonbolt stacks are at 4
	{"6353", {"player.debuff(157695).count = 4", "player.buff(140074)", "!player.spell(101508).exists"}},
	{"6353", {"player.debuff(157695).count >= 3", "player.demonicfury < 320"}},
	{"6353", {"player.debuff(157695).count = 4", "player.buff(113861)"}}, -- Soul Fire if Demonbolt stacks are at 4 and Dark Souls is up
	{"103964", "player.debuff(157695.count = 4"}, -- Touch of Chaos incase of nothing up.
	}, "player.buff(103958)"},
	
	
	
	{"/cancelaura Metamorphosis", {"player.debuff(157695).count = 4", "player.buff(103958)", "!player.buff(113861)", "player.demonicfury <= 650", "target.debuff(603).duration > 25"}},
	{"/cancelaura Metamorphosis", {"player.buff(103958)", "!player.buff(113861)", "player.demonicfury <= 100", "target.debuff(603).duration > 25"}},
	
	
}

local outCombat = {
	--Dark Intent
	{"!109773", "!player.buffs.multistrike"},
	{"!109773", "!player.buffs.spellpower"},
	
}

ProbablyEngine.rotation.register_custom(266, "Spem's Demonology", combatRotation, outCombat)	