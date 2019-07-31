# Getting Started

Data Modding in openage is done through our data storage management system *[nyan](https://github.com/SFTtech/nyan)*. Every piece of game data, including the converted AoE data, is described in the nyan language.

## Main Features

**Human-readable plain-text modding**: Everything in the game data files is editable without the need for binary extraction. You just require a text editor. For those of you who are scared of text editors, additional helper tools will be made available.

**Object-oriented**: Game entities are be described as objects with multiple key-value pairs.

**Inheritance**: Objects can inherit from other objects instead of redefining everything for a minor change.

**Easy modification through patches**: Objects are not static in nyan. They can be modified indefinitely by patching their attributes.

**Optimized mod-combination**: Because every object has a unique identifier, mods can easily reference each others data. Of course, data from Age of Empires 2 is no exception as it will simply be treated as one of many modpack.

nyan is only used for the *definition* and *composition* of game data. Everything concerning *behaviour*, e.g. what, when, how and if objects are handled, is done by the openage engine or can be implemented with our Scripting API.

## Contents

Modders coming from AoE2 should read our [Quickstart Guide](quickstart_guide.md).

The *General* section provides you with the basic language concepts of nyan. This is a must-read, if you plan on writing large-scale mods.

* [Objects](objects.md)
  * [Inheritance](objects.md#inheritance)
  * [Abstract Objects](objects.md#abstract-objects)
  * [Nested Objects](objects.md#nested-objects)
* [Patches](patches.md)
  * [Patch Application](patches.md#applying-a-patch)
  * [Patching a Patch](patches.md#patching-a-patch)
  * [Patching Inheritance](patches.md#adding-inheritance)
* [Data Types](data_types.md)
* [Namespaces](namespaces.md)

In the *API* section, we explain how core functionality of the engine can be accessed by your mods. These tutorials will explain how to create new units, buildings, abilities, techs and more. Furthermore, you will learn how to make the game register your mod and apply your changes.

[TBD]

Our *Tips & Tricks* section features in-depth tutorials of small but popular changes made by mods. Here you will learn how to replace sounds, graphics and icons as well as making changes to the interface.

[TBD]
