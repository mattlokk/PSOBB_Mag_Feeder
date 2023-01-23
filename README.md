# PSOBB_Scripts

**multi_mag_feeder**

ctrl-J to start the script  
ctrl-E to end the script

 - Supports *n* number of mags.
 - Saves your progress and resumes it if you stop and start the script
 - Supports configuring mag diets via json file
 	- name : Optional. May be used in the future for logging/output messages
 	- feedCount : Starts at 0. Increments every time the mag is fed. Used for keeping track of progress through the feed plan. 
 	- items : An array of items to feed the mag
		- count : How many times to feed the mag 3 of this item. Total items fed will be count x 3.
		- name : the name of the item to feed the mag 
			- { "monomate", "dimate", "trimate", "monofluid", "difluid", "trifluid", "antidote", "antiparalysis", "sol atomizer", "moon atomizer", "star atomizer" }



~~~
     [
       {
	 "name": "mag1",
	 "feedCount": 0,
	 "items": [
	   {"count": 10, "name": "monomate"},
	   {"count": 20, "name": "dimate"},
	   {"count": 30, "name": "trimate"}
	 ]
       },
       {
	 "name": "mag2",
	 "feedCount": 0,
	 "items": [
	   {"count": 10, "name": "monofluid"},
	   {"count": 20, "name": "difluid"},
	   {"count": 30, "name": "trifluid"}
	 ]
       },
       {
	 "name": "mag3",
	 "feedCount": 0,
	 "items": [
	   {"count": 3, "name": "antidote"},
	   {"count": 2, "name": "antiparalysis"},
	   {"count": 1, "name": "sol atomizer"}
	 ]
       }
     ]
~~~


**quick_actions**

ctrl-U : Does a very quick mag feed.
	Feeds the first mag in your inventory the top item in your inventory 3x
	Takes about 2 seconds total

ctrl-I : Swaps between character/shared bank

