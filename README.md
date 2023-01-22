# PSOBB_Scripts

**mag_feeder**

Only supports a single mag, but does support more finite control over the number of items given.


**multi_mag_feeder**


 - Supports *n* number of mags.
 - Saves your progress and resumes it if you stop and start the script
 - Supports configuring mag diets via json file eg:

	     [
	       {
		 "name": "mag1",
		 "feedCount": 0,
		 "items": [
		   {"count": 10, "name": "monofluid"},
		   {"count": 20, "name": "difluid"},
		   {"count": 30, "name": "trifluid"}
		      ]
	       },
	       {
		 "name": "mag2",
		 "feedCount": 0,
		 "items": [
		   {"count": 3, "name": "antidote"},
		   {"count": 2, "name": "antiparalysis"},
		   {"count": 1, "name": "sol atomizer"}
		 ]
	       }
	     ]

 - Can only feed items in increments of 3. May change later

ctrl-J to start the script

**quick_actions**

ctrl-U : Does a very quick mag feed.
	Feeds the first mag in your inventory the top item in your inventory 3x
	Takes about 2 seconds total

ctrl-I : Swaps between character/shared bank

