# Holsters
This is a resource for FiveM which is inspired by the [Cop Holster](https://www.lcpdfr.com/files/file/8017-cop-holster/) script on LSPDFR. It implements dynamic holsters for all players by removing the handgun from the holster when it is drawn. It is highly configurable and can support multiple peds. It even supports EUP peds and the multiple holsters it has to offer.

## Information
### How does this work?
Ped models in Grand Theft Auto V have different textures called 'drawables'. Many of the default cop models and community made models have 2 drawables for the holster, where one is empty and the other has a handgun in it. This script utilises those textures by flawlessly and automatically changing them when the player has a handgun drawn. 

### Does this support EUP?
Yes, the default config file is preconfigured with the default holsters for both male and female peds. However, you may need to configure this a little to suit accomodate any different holsters.

## Installation
1. Download the [latest release](https://github.com/Jamelele/holsters/releases/latest) as a zip file, or clone the repository using Git.
2. Put it in your `resources` folder.
3. Add `start holsters` to your `server.cfg` to ensure it is run on start-up.
4. *Optional*: Edit config.lua to your liking, scroll down further to learn how to.

## Configuration File
This resource comes with a basic default configuration that is suited to the default ped models. Drawables often vary between different peds and the script has no way of telling which drawables contain the holster. If you are using custom ped models, it is likely that you will need to configure it.

Configuration numbers are consistent with the ones used in the GTA code. 

The "component ID" is the category of the drawable, such as Shirt/Jacket. 

Use this table to translate the various categories.

| Component ID  | Lambda Menu | Simple Trainer |
| ------------- | ------------- | --------|
| 0  | Head/Face  | TBA |
| 1  | Beard/Mask  | TBA |
| 2  | Hair/Hat  | TBA |
| 3  | Top  | TBA |
| 4  | Legs  | TBA |
| 5  | Accessory/Gloves  | TBA |
| 6  | Accessory/Shoes  | TBA |
| 7  | Neck  | Teeth 
| 8  | Shirt  | TBA |
| 9  | Accessory  | TBA |
| 10  | Badges  | TBA |
| 11  | Shirt/Jacket | TBA |

Most of the holsters will either be in the Neck (7) or Accessory (9) categories.

The "drawable ID" indicates which drawable to use. You must tell the config which two holsters correspond to each other.

The configuration follows a common format:
```lua
["ped name"] = {
  ["components"] = {
    [component ID] = {
      [holster with handgun] = empty holster,
    }
  }
},
```

Here is an example for some of the EUP holsters in the male ped, where multiple different holsters are specified:
```lua
["mp_m_freemode_01"] = { -- Make sure to use the full ped name
      ["components"] = {
        [7] = { -- This is the 'Neck' category
          [1] = 3, -- Drawable '3' is the empty version of drawable '1'
          [6] = 5,
          [8] = 2,
          [42] = 43,
          [110] = 111,
          [119] = 120
        }
      }
    },
```

The resource comes with a fully working config file that is ready for you to edit. Take a look at it [here](config.lua)  to see more examples of how the configuration works. 