# PSOBB_Scripts

**mag_feeder**

Only supports a single mag, but does support more finite control over the number of items given.

eg:

     BuyAndFeed("monomate", 4)
     BuyAndFeed("dimate", 3)
     BuyAndFeed("trimate", 3)

this would feed the mag
 - 3 monomates
 - 1 monmate and 2 dimates
 - 1 dimate and 2 trimates
 - 1 trimate

**multi_mag_feeder**

 - Supports *n* number of mags.
 - Saves your progress and resumes it if you stop and start the script
 - Supports configuring mag diets via json file
 - Can only feed items in increments of 3. May change later

ctrl-J to start the script

**quick_actions**

ctrl-U : Does a very quick mag feed.
	Feeds the first mag in your inventory the top item in your inventory 3x
	Takes about 2 seconds total

ctrl-I : Swaps between character/shared bank

