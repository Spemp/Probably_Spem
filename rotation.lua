local combatRotation = {

	-- Dark Intent
	{"!109773", "!player.buffs.multistrike"},
	{"!109773", "!player.buffs.spellpower"},
	
	-- Cooldowns
	{"Dark Soul: Instability", "modifier.cooldowns"},
	{"Summon Terrorguard", "modifier.cooldowns"},
	{"Summon Doomguard", "modifier.cooldowns"},
	
	--Defensive & Utilities
	{"#5512", "player.health < 30"},
	{"Unending Resolve", "modifier.lcontrol"},
	{"Sacrificial Pact", "modifier.lalt"},
	{"Shadowfury", "modifier.lshift", "mouseover.ground"},
	
	
--Rotation(s)
	
	-- Regular Rotation
	{{
	{ "Life Tap", {
	  "player.mana < 40",
	  "player.health > 70",
	}},
	
	{"Corruption", "target.debuff(Corruption).duration < 5", "target"},
	{"Metamorphosis", "player.demonicfury > 900" },
	{"Hand of Gul'dan", "target.debuff(Hand of Gul'dan).duration < 3", "target"},
	{"Soul Fire", "player.spell(Molten Core).charges >= 4", "target"},
	{"Soul Fire", "target.health <= 25"},
	{"Shadow Bolt" },
	}, "!player.buff(Metamorphosis)" },
	
	--Rotation with Metamorphosis
	{{
	{"Dark Soul: Knowledge", "modifier.cooldowns" },
	{"Immolation Aura", "Modifier.multitarget" },
	{"Doom", "target.debuff(Doom).duration <= 18", "target"},
	{"Touch of Chaos", "target.debuff(Corruption).duration < 5", "target"},
	{"Soul Fire", "player.spell(Molten Core).exists", "target"},
	{"Touch of Chaos", "player.demonicfury > 950", "target"},
	
	{"/cancelaura Metamorphosis", {
	 "player.demonicfury < 650",
	 "!player.buff(Dark Soul: Knowledge)",
	}},
	
	{"Soul Fire", "player.spell(Molten Core).exists", "target"},
	{"Touch of Chaos", "player.demonicfury > 950", "target"},
	
	}, "player.buff(Metamorphosis)"},
	
}

local outCombat = { 

	-- Dark Intent
	{"!109773", "!player.buffs.multistrike"},
	{"!109773", "!player.buffs.spellpower"},
	
	--Summon Wrathguard
	{"Summon Wrathguard", {
	 "!pet.exists",
	 "!pet.alive",
	 "!player.moving",
	 "!player.buff(108503)",
	 "!player.dead",
	}},
	
}	
	
	


ProbablyEngine.rotation.register_custom(266, "Demonology", combatRotation, outCombat)