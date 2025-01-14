errrm autowalk by MrFukuo or something.
-----------------------------------------------------------------
"autowalk" is an event that you place in an Objects layer in Tiled.
Below is a list of custom properties; those listed with an asterik [*] are necessary.

* direction - A string listing which direction the autowalk should take you in. (Options are "left", "right", "up", and "down")
speed - A string listing what speed the autowalk should take you at. Should be a number. If not set, the default is 5.
counterspeed - A string listing what speed the player should traverse at when walking against the autowalk. If not set, the default is speed/2.

NOTE:   The closer the counterspeed number is to the speed number, the easier it will be to walk against the autowalk.

        If one or more of your follower's "walk" folder is not directly in their path, then you will need to edit some of the code (you'll need to make an exception for them in the for loops.)

        If you set speed/counterspeed too high it might break. idk why i may fix that eventually

        
(not sure how accurate the numbers are in relation to deltarune but it gets the job done)

((this readme follows the format of AcousticJamm's spike library))