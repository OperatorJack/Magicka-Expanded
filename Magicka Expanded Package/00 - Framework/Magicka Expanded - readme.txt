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

This mod consist of multiple BAIN packages:
00 - Framework
* The package does not introduce anything new into the game. It is a base package for other mods to build on. This does not require an ESP. If a mod says it requires Magicka Expanded, it likely only requires this package. This is the core framework that lets the spell packs and other dependent mods work.

01 - Resource Pack
* Contains an ESP used by other spell packs. Must be installed and enabled if using any of the packages below.

02 - Lore Friendly Pack
* Adds new lore friendly magic effects and spells. See package readme for more info.

03 - Summoning Pack
* Adds new summoning magic effects and spells. See package readme for more info.

04 - Teleportation Pack
* Adds new teleportation magic effects and spells. See package readme for more info.

05 - Tamriel Rebuilt Pack
* Adds new summoning and teleportation magic effects and spells for TR content. See package readme for more info.

06 - Weather Magick Pack
* Adds new magic effects to manipulate the weather.

07 - Cortex Pack
* Adds new magic effects inspired by Cortex's Scripted Spells mod.

This mod allows the distribution of spells through spell tomes and grimoires. Spell tomes teach 1 spell per book. Spell grimoires teach 2+ spells per book. This mod uses leveled lists and booksellers for spell distribution, but Spell Packs may use any mechanism to distribute spells. Please refer to the Spell Pack you are using for instructions for finding the spells within. If using spell tomes and grimoires, they will be dynamically placed through MWSE and do not require cell edits in the Construction Set.

There is an MCM that contains buttons to help you test the framework. You can use these buttons to add all loaded spells to the player, as well as tomes and grimoires. You can also set your stats instantly. Please note there may be a slight delay when adding spells / items through the MCM, if you are using a lot of ME dependent mods.

This mod IS NOT compatible with OpenMW, at least until support for MWSE mods is added.


====Permissions====
Scripting/writing
This mod may be utilised for any purpose for Morrowind, as long as you credit OJ as the original author, except as described below. It may not be used for other games.

Graphic assets
The meshes, textures, and book illustrations are modders' resources free to use in your mods, provided that you include a link to RFD's Nexus profile in your mod's credits. The meshes can only be used for Morrowind modding, as they are based on original MW assets; textures and illustrations were created from scratch.
Please do not edit the .dds files (because of compression). Contact RFD for the source files instead.

You may not include this mod in a compilation without RFD's permission.

====Conflicts====
Creating new magic effects requires creating entries in a MWSE table. These entries are permanent. This mod will conflict with any mod that uses the same spell effect IDs. Other authors should check the magic effect ID list before choosing an ID to prevent conflicts.

====Installation & Removal====
Installation:
1) Use a mod management tool to install this mod using the provided BAIN installer. Or just install it manually, if that's your thing.
2) Enable the .esp file for Resource pack if using any of the spell packs.

Removal:
1) Delete any spells added by this mod from the player. This can be done by clicking the spell in the spell menu and pressing [Delete] on the keyboard.
1) Uninstall this framework and any Spell Packs using your mod management tool.

====Credits====
OperatorJack: scripting
RedFurryDemon: graphics

- NullCascade, Greatness7 and Merlord - on-going help and development of MWSE.
- Merlord - Providing the code used to distribute items to merchants without requiring ESPs or cell edits.
- Reizeron/R-Zero - blank magic effct icon, a particular expression used in an illustration, some troubleshooting
- coupleoflooks - header image
- Pixel Sagas - font based on Skyrim mage script
- Stripes - some troubleshooting
- C3PA - a large number of improvements to the code to use new MWSE functions and patterns. Thank you for your work!
- Firemoth Reclaimed team: Their lightning VFX meshes, textures and MWSE code was adapted into this mod for the "Thunderbolt" magic effect.
- Kurp for the following:
    - Circular VFX mesh used in the Thunderbolt bolt VFX, Darkness bolt VFX.
- OAAB for the following
    - Lightning Bolt VFX Texture, which is used in the Thunderbolt Bolt VFX mesh.