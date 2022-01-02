Cfg = {}

Cfg.Markers = {
    Drawdistance = 20.0,
    MarkersEnabled = true,
    Type = 30,
    Color = {r = 52, g = 180, b = 235},
    Size = 1.0
}

Cfg.Mestat = {
    Yksi = {
        Pos = vector3(178.14750671387, -1007.2783813477, 28.350284118652),
        Heading = 347.45822143555,
        Text = "Paina ~g~[E] ~w~tutkiaksesi ~b~kaappi",
        Kesto = 10, -- Sekunteina
        Rewards = {
            [1] = {
                ItemName = "WEAPON_PISTOL",
                Maara = 900, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "weapon"
            },
            [2] = {
                ItemName = "water",
                Maara = 10, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "item"
            },
            [3] = {
                ItemName = "radnomCashAmount", -- Rahan rewardissa ei väliä mitä lukee kunhan lukee
                Maara = 900, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "cash"
            }
        }
    },

    Kaksi = {
        Pos = vector3(185.1852722168, -1009.3287353516, 28.341367263794),
        Heading = 266.78506469727,
        Text = "Paina ~g~[E] ~w~tutkiaksesi ~b~ilman happipitoisuutta",
        Kesto = 3, -- Sekunteina
        Rewards = {
            [1] = {
                ItemName = "WEAPON_PISTOL",
                Maara = 900, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "weapon"
            },
            [2] = {
                ItemName = "WEAPON_MUSKET",
                Maara = 900, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "weapon"
            },
            [3] = {
                ItemName = "WEAPON_SNIPERRIFLE",
                Maara = 900, -- Aseessa luodit, itemissä ja rahassa määrä
                Type = "weapon"
            }
        }
    }
}