# PSOBB_Scripts

**multi_mag_feeder**

**installation**

- download [latest release](https://github.com/mattlokk/PSOBB_Scripts/releases/tag/v0.1)
- extract contents of .zip into a new folder
- make changes to mags.json
- run multi_mag_feeder.exe

**usage**

ctrl-J to start the script  
ctrl-E to end the script

***warning*** - *Put any items in your inventory (armor, weapons, etc) that you don't want sold into the bank in case something goes wrong.*
 
 - Start with your inventory completely empty of items, and when your mag is hungry.
 - Recommend using [Magatama](https://www.pioneer2.net/community/threads/magatama-a-modern-mag-planner-calculator-beta-9.4552/) to plan your mag builds 
 - Supports *n* number of mags.
 - Saves your progress and resumes it if you stop and start the script
 - Supports configuring mag diets via json file
	- name : Optional. May be used in the future for logging/output messages
	- feedCount : Starts at 0. Increments every time the mag is fed. Used for keeping track of progress through the feed plan. 
	- items : An array of items to feed the mag
		- name : the name of the item to feed the mag 
			- { "monomate", "dimate", "trimate", "monofluid", "difluid", "trifluid", "antidote", "antiparalysis", "sol atomizer", "moon atomizer", "star atomizer" }
		- count : How many times to feed the mag 3 of this item. Total items fed will be count x 3.



~~~
[
  {
    "name": "mag1",
    "feedCount": "0",
    "items": [
      {"name": "monofluid", "count": "10"},
      {"name": "difluid", "count": "20"},
      {"name": "trifluid", "count": "30"}
    ]
  },
  {
    "name": "mag2",
    "feedCount": "0",
    "items": [
      {"name": "antidote", "count": "3"},
      {"name": "antiparalysis", "count": "2"},
      {"name": "sol atomizer", "count": "1"}
    ]
  }
]
~~~

