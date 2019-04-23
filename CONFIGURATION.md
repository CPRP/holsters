# Configuration File
This resource comes with a basic default configuration that is suited to the default ped models. Drawables often vary between different peds and the script has no way of telling which drawables contain the holster. If you are using custom ped models, it is likely that you will need to configure it.

This configuration file relies on the use of [Lua tables](http://lua-users.org/wiki/TablesTutorial), 

#### Adding a holster

1. You need to find out the "component ID", this is the category of the drawable, such as Shirt/Jacket. 


    If you are using a trainer of some sort, you can use this table to translate the various categories.

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

2.  The "drawable ID" indicates which drawable (specific holster) to use. You will need to know the ID of both the filled and empty holster. You can find this number in the trainer or interface.

    **Note**: In GTA native terms, drawable IDs start at 0. Some trainers such as Simple Trainer adjust the displayed ID by adding 1. It is easiest to use the Lambda menu for this as it displays the real ID.

3. If you are adding to an existing ped in the config, skip this step. If not, you need to register the ped in the "peds" section of the config like this.

    ```lua
    ["full_ped_name"] = {
      ["components"] = {
        ...
      }
    }
    ```

4. Add the drawables to the ped. 
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