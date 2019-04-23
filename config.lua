-- Created by Jamelele, April 2019

-- Take a look at the documentation for configuring:
-- https://github.com/Jamelele/holsters#configuration-file 

config = {
  ["peds"] = {
    ["mp_m_freemode_01"] = { -- Male multiplayer ped
      ["components"] = {
        [7] = { -- Simple Trainer: 'Teeth', Lambda: 'Neck'
          [1] = 3,
          [6] = 5,
          [8] = 2,
          [42] = 43,
          [110] = 111,
          [119] = 120
        }
      }
    },
    ["mp_f_freemode_01"] = { -- Female multiplayer ped
      ["components"] = { -- Simple Trainer: 'Teeth', Lambda: 'Neck'
        [7] = {
          [1] = 3,
          [6] = 5,
          [8] = 2,
          [29] = 30,
          [81] = 82
        }
      }
    },
    ["s_m_y_hwaycop_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_cop_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_sheriff_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
  }
}