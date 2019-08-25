Magicka Expanded

By: OperatorJack & RedFurryDemon

====Contents====

1. Requirements
2. Description
3. Permissions
4. Conflicts
5. Installation
6. Removal
7. Credits

====Requirements====

- Morrowind
- Tribunal
- Bloodmoon
- MGE XE 0.10.1
- MWSE 2.1+

This mod requires the most recently nightly build of MWSE. Please be sure to run the mwse-update.exe before playing this mod.

====Description====
This mod provides a framework to add new and fully functional magic effects to Morrowind. These effects behave just like vanilla effects: you can create new spells, enchant items, give them to companions, and treat them how any other effect would be treated.

It does this by providing a relatively simple API to access MWSE functions, manage objects, and handle calculations and events.

The mod does not introduce anything new into the game. It is a base package for other mods to build on. To maintain modularity, I am releasing new similar spells as spell packs, available separately. 

This mod allows the distribution of spells through spell tomes and grimoires. Spell tomes teach 1 spell per book. Spell grimoires teach 2+ spells per book. This mod uses leveled lists and booksellers for spell distribution, but Spell Packs may use any mechanism to distribute spells. Please refer to the Spell Pack you are using for instructions are finding the spells within.

At this time, there are 43 new spell effects available in the following spell packs, with these new magic effects:
1) Lore Friendly Pack
- Banish Daedra
- Darkness
- Bound Greaves
- Bound Pauldrons
- Bound Claymore
- Bound Club
- Bound Dai-Katana
- Bound Katana
- Bound Shortsword
- Bound Staff
- Bound Tanto
- Bound Wakizashi
- Bound Waraxe
- Bound Warhammer

2) Summoning Pack
- Summon Goblin Grunt
- Summon Goblin Officer
- Summon Goblin Warchief
- Summon War Durzog
- Summon Hulking Fabricant
- Summon Imperfect
- Summon Draugr
- Summon Lich
- Summon Ogrim
- Summon Spriggan
- Summon Centurion Spider
- Summon Centurion Archer
- Summon Steam Centurion
- Summon Ash Ghoul
- Summon Ash Zombie
- Summon Ash Slave
- Summon Ascended Sleeper

3) Teleportation Pack
- Teleport to Ald-Ruhn
- Teleport to Balmora
- Teleport to Ebonheart
- Teleport to Vivec
- Teleport to Caldera
- Teleport to Gnisis
- Teleport to Maar Gan
- Teleport to Molag Mar
- Teleport to Pelagiad
- Teleport to Suran
- Teleport to Tel Mora

This mod IS NOT compatible with OpenMW, at least until support for MWSE mods is added.

====Permissions====
This mod may be utilized for any purpose for Morrowind, as long as you credit me as the original author, except as described below. It may not be used for other games. To use or redistribute any graphic files (meshes, textures, icons) within this mod, you must contact the author of those graphics files first.

====Conflicts====
Creating new magic effects requires creating entries in a MWSE table. These entries are permanent. This mod will conflict with any mod that uses the same spell effect IDs. Other authors should check the magic effect ID list before choosing an ID to prevent conflicts.

====Installation====
1) Use a mod management tool to install this framework first.
2) Use a mod management tool to install any desired Spell Packs in any order after this framework.
3) Use a list mering tool such as Wrye Mash to merge leveled lists.

NOTE: Creating new magic effects requires creating entries in a MWSE table. These entries are permanent.

====Removal====
1) Uninstall this framework and any Spell Packs using your mod management tool.
3) Reinstall MWSE to reset your magic effects table.

====Credits====
- RedFurryDemon for all graphic and icons.
- NullCascade, Greatness7 and Merlord for their on-going help and development of MWSE.