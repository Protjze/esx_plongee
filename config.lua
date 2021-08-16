Config = {}
Config.deleteTenu =  false
Config.TimeToSearch = 2500
Config.TimeDiving = { --> Ne pas oubliée de mettre .00 quand vous attribuer une valeur au temps sous l'eau
    leger = 200.00,
    lourd = 500.00,
}
Config.Item = {
    i1 = {name = "tresor", label = "Trésor"},
    i2 = {name = "gold", label = "Or"},
    i3 = {name = "fish", label = "Poisson"},
    i4 = {name = "stone", label = "Pierre"},
    i5 = {name = "diamond", label = "Diamand"},
}
Config.Tenu = {
    leger = {
        male = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0,
            ['torso_1'] = 15, ['torso_2'] = 0,
            ['decals_1'] = 0,  ['decals_2']= 0,
            ['mask_1'] = 36, ['mask_2'] = 0,
            ['arms'] = 15,
            ['pants_1'] = 16, ['pants_2'] = 0,
            ['shoes_1'] = 34, ['shoes_2'] = 0,
            ['helmet_1'] 	= 8, ['helmet_2'] = 0,
            ['bags_1'] = 43, ['bags_2'] = 0,
            ['glasses_1'] = 6, ['glasses_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0,
            ['torso_1'] = 15, ['torso_2'] 	= 0,
            ['decals_1'] = 0,  ['decals_2'] = 0,
            ['mask_1'] = 36, ['mask_2'] 	= 0,
            ['arms'] = 15,
            ['pants_1'] = 15, ['pants_2'] 	= 0,
            ['shoes_1'] = 35, ['shoes_2'] 	= 0,
            ['helmet_1']= -1, ['helmet_2'] 	= 0,
            ['bags_1'] = 43, ['bags_2']	= 0,
            ['glasses_1'] = 5, ['glasses_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },
    lourd = {
        male = {
            ['tshirt_1'] 	= 15, 	['tshirt_2'] 	= 0,
            ['torso_1'] 	= 243, 	['torso_2'] 	= 0,
            ['decals_1'] 	= 0,  	['decals_2'] 	= 0,
            ['mask_1'] 		= 35, 	['mask_2'] 	= 0,
            ['arms'] 		= 38,
            ['pants_1'] 	= 94, 	['pants_2'] 	= 0,
            ['shoes_1'] 	= 67, 	['shoes_2'] 	= 0,
            ['helmet_1'] 	= -1, 	['helmet_2'] 	= 0,
            ['bags_1'] 		= 44,	['bags_2'] 	= 0,
            ['chain_1'] 	= 0, 	['bproof_1']	= 0, 
            ['bracelets_1'] = -1, 	['watches_1'] 	= -1,
            ['glasses_1'] 	= 26, 	['ears_1'] 		= -1
        },
        female = {
            ['tshirt_1'] 	= 14, 	['tshirt_2'] 	= 0,
            ['torso_1'] 	= 136, 	['torso_2'] 	= 3,
            ['decals_1'] 	= 0,  	['decals_2'] 	= 0,
            ['mask_1'] 		= 35, 	['mask_2'] 	= 0,
            ['arms'] 		= 36,
            ['pants_1'] 	= 27, 	['pants_2'] 	= 0,
            ['shoes_1'] 	= 70, 	['shoes_2'] 	= 0,
            ['helmet_1']	= -1, 	['helmet_2'] 	= 0,
            ['bags_1'] 		= 44, 	['bags_2'] 	= 0,
            ['chain_1'] 	= 0, 	['bproof_1']	= 0, 
            ['bracelets_1'] = -1, 	['watches_1'] 	= -1,
            ['glasses_1'] 	= 28, 	['ears_1'] 		= -1 
        }
    }
}
Config.Notif = {
    --client
    search = {msg = "Appuyez sur~g~ ~INPUT_CONTEXT~ ~s~pour ~y~fouiller", thisFrame = false, beep = true, duration = -1},
    duringSearch = {msg = "~u~Vous êtes entrin de chercher...", flash = false, saveToBrief = true, color = 250},
    noFound = {msg = "~u~Vous n'avez ~r~rien~u~ trouvé!", flash = true, saveToBrief = true, color = 250},
    --server
    tresorWin = {msg = "~u~Vous avez trouvé ~g~", flash = true, saveToBrief = true, color = 250},
    tresorVide = {msg = "~u~Le tésor est ~r~vide!", flash = true, saveToBrief = true, color = 250},
    giveItem = {msg = "~u~Vous avez récupéré ~g~", flash = true, saveToBrief = true, color = 250},
    giveItemFish = {msg1 = "~u~Vous avez récupéré ~b~", msg2 = " ~y~x", flash = true, saveToBrief = true, color = 250},
    inventoryFull = {msg = "~u~Vous n'avez ~r~pas~u~ de place dans votre ~y~inventaire~u~!", flash = true, saveToBrief = true, color = 250},
}