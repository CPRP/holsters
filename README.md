# Holsters
This is a resource for the Grand Theft Auto V multiplayer mod, [FiveM](https://fivem.net), which is inspired by the [Cop Holster](https://www.lcpdfr.com/files/file/8017-cop-holster/) script on LSPDFR. It implements dynamic holsters for all players by removing the handgun from the holster when it is drawn. It is highly configurable and can support multiple peds. It even supports EUP peds and the multiple holsters it has to offer.

<img src="https://media.giphy.com/media/loGRS56xWOA5fEy5OF/giphy.gif" width="185.5" height="240" />

## Information
### How does this work?
Ped models in Grand Theft Auto V have different textures called 'drawables'. Many of the default cop models and community made models have 2 drawables for the holster, where one is empty and the other has a handgun in it. This script utilises those textures by flawlessly and automatically changing them when the player has a handgun drawn. 

### Does this support EUP?
Yes, the default config file is preconfigured with the default holsters for both male and female peds. However, you may need to configure this a little to accomodate any different holsters.

## Installation
1. Download the [latest release](https://github.com/Jamelele/holsters/releases/latest) as a zip file, or clone the repository using Git.
2. Put it in your `resources` folder.
3. Add `start holsters` to your `server.cfg` to ensure it is run on start-up.
4. *Optional*: Edit config.lua to your liking, scroll down further to learn how to.

## Configuration

- [Configuration documentation](https://github.com/Jamelele/holsters/wiki/Configuration-Guide)

## Commands

### /holsters <on/off>
Toggles the resource on and off, if `on/off` is not specified then it will toggle.