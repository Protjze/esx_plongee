# esx_diving

Créator: **@Nelyo#1462** and **@SUP2Ak#3755**
Contributor: **[gomisloca](https://github.com/gomisloca)** (Compatibility esx-legacy v1.10.1 + support ox_inventory)

# How to:
 - Import the SQL file for create both item and add them to shop
 - Put esx_plongee in [esx] folder
 - Add: start esx_plongee on server.cfg
 - Enjoy

After that, you need to buy one on this item on a shop, go near water and just use.
Once you have finish diving, you will need to go to a clotheshop to change you clothes.
I will update the script later to change automatically clothe after finish diving. 

# Change diving timer?
You just have to change the value in **bold**

SetPedMaxTimeUnderwater(PlayerPedId(), **1500.00**)

# What next?
Fill free to update the script but don't forget to share or update this repository also.

# pour ox invetory item resources/[ox]/ox_inventory/data/items.lua

	["plongee1"] = {
		label = "Tenue de plongée legere",
		weight = 1000,
		stack = true,
		close = true,
	},
    
	["plongee2"] = {
		label = "Tenue de plongée lourde",
		weight = 4000,
		stack = true,
		close = true,
	},
   
	["tenu_origin"] = {
		label = "Remettre tenue origine",
		weight = 4000,
		stack = true,
		close = true,
	},

	["tresor"] = {
		label = "Trésor",
		weight = 4000,
		stack = true,
		close = true,
	},
	
pour le shop resources/[ox]/ox_inventory/data/shops.lua

	Plongee = {
		name = 'Plongee',
		blip = {
			id = 729, colour = 5, scale = 0.8
		}, inventory = {

   		{ name = 'plongee1', price = 150 },
		{ name = 'plongee2', price = 150 }
			
		}, locations = {
			vec3(-1161.0350, -2022.5441, 13.1640)
			
		}, targets = {
			{
                ped = 's_f_y_hooker_02',
                scenario = 'WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE',
                loc = vec3(-1161.0350, -2022.5441, 13.1640),
                heading = 316.8271,
            },
		}
	},

Have Fun!

```
--[[_______________________INTERDIT A LA REVENTE_______________________]]--
Si vous partager ke script envoyez le liens de mon github et venez sur discord pour les maj
--[[					__SUP2Ak__                            
    /Discord SUP2Ak FiveM-Dev : https://discord.gg/hYCR2YKgxB    /  
    /GitHub : https://github.com/SUP2Ak	                        /   
    /Youtube : https://www.youtube.com/SUPAAkHD                /
    __________________________________________________________/
    |                   __MyProject__
    |    /Serveur RP : AlphaV RP
 ___|    /FiveM      : myServerESX (qui est dans le liens Discord : FiveM-Dev)					  
]]
```
