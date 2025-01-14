FootprintsLib (by crocokuo/HUECYCLES, ft. TweenManager lib by Sam/sjl057)

Adds a "footprint" event that shows footprints trailing behind the player/party.
In TILED, it takes up to 3 custom properties;

    "color":    A Tiled Color property. This is the color the footprints will appear as.
                Defaults to (1, 1, 1), or white.

    "player":   A boolean property. If true, footprints with only appear for the leader
                party member. Defaults to false.

    "time":     An interger/float property. This is the amount of time it will take for
                to footprints to fade away. (WARNING: If there are too many footprints
                on screen at a time, you may experience lag.)

    "type":     A string property. This allows you to use unique footprints for different
                areas. To utilize this, create a "footprints" folder in your actor's path.
                Then, inside that folder, create a sprite named <type>. If done correctly,
                the footprint sprite should change.

                For example, if your actor is Kris, and your "type" custom property is
                "sandy", in "assets/sprites/party/kris/dark/footprints", create a "sandy"
                sprite. Alternatively, you can create a sprite named "footprints" in the
                actor's folder for global usage.

                Defaults to "default".