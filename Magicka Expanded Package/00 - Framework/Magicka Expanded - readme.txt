Magicka Expanded

By: OperatorJack & RedFurryDemon

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


====Conflicts====
This mod IS NOT compatible with OpenMW, at least until support for MWSE mods is added.

Creating new magic effects requires creating entries in a MWSE table. These entries are permanent. This mod will conflict with any mod that uses the same spell effect IDs. Other authors should check the magic effect ID list before choosing an ID to prevent conflicts.

====Installation & Removal====
Installation:
1) Use a mod management tool to install this mod using the provided BAIN installer. Or just install it manually, if that's your thing.
2) Enable the .esp files for the framework and spell packs.
2) Use a list merging tool such as Wrye Mash to merge levelled lists.

NOTE: Creating new magic effects requires creating entries in a MWSE table. These entries are permanent. 

Removal:
1) Uninstall this framework and any Spell Packs using your mod management tool.
2) Reinstall MWSE to reset your magic effects table. This is only needed if you are using another mod that claims the same spell effect IDs as this one. 

====Permissions====
Scripting/writing
This mod may be utilised for any purpose for Morrowind, as long as you credit OJ as the original author, except as described below. It may not be used for other games.

Graphic assets
The meshes, textures, and book illustrations are modders' resources free to use in your mods, provided that you include a link to RFD's Nexus profile in your mod's credits. The meshes can only be used for Morrowind modding, as they are based on original MW assets; textures and illustrations were created from scratch.
Please do not edit the .dds files (because of compression). Contact RFD for the source files instead.
You may not include this mod in a compilation without RFD's permission.

====Credits====
OperatorJack: scripting
RedFurryDemon: graphics

- NullCascade, Greatness7 and Merlord - on-going help and development of MWSE.
- Reizeron/R-Zero - blank magic effct icon, a particular expression used in an illustration, some troubleshooting
- The header image for this mod was found here.
- Pixel Sagas - font based on Skyrim mage script
- Stripes - some troubleshooting