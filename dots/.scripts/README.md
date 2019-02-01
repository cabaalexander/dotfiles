# ~/.scripts/

Cool stuffs I got on my PC 🤯 🎩


## [getmovies](/dots/.scripts/getmovies)

Script to fetch movies \*aarrgs\* 🏴‍☠️


### Dependencies

* [jq](https://stedolan.github.io/jq/) - Command-line JSON processor
* [vlc](https://www.videolan.org/vlc/index.html) - Cross-platform multimedia player

### Usage

    $ getmovies [OPTION]... [NAME]...

### Options

You should pass just one option at the time, otherwise only the last option will take efect

    -m      Gets movies metadata
    -q      Gets movies ID(s)
    -v      Open vlc player for the first movie (If it finds more than one)

### Names

#### COMPLETE_NAME

Complete name for the movie, it is case insensitive.

If another movie includes the same title you will get more elements in the array

    $ getmovies "King Arthur"
    [
      {
        "title": "King Arthur",
        "link": "https://onedrive.live.com/download.aspx?resid=DBC653EEBA71BD29!481&authkey=!AEvV750L-TZEdNI&ithint=video%2cmp4"
      },
      {
        "title": "King Arthur: Legend of the Sword",
        "link": "https://storage.googleapis.com/bluerey-145701.appspot.com/M/2017/King.Arthur.Leg.of.the.Sword.2017.720p.Dual-S.mp4"
      }
    ]

#### PART_NAME

You can supply different words that you think would match the title

    $ getmovies arthur king legend
    [
      {
        "title": "King Arthur: Legend of the Sword",
        "link": "https://storage.googleapis.com/bluerey-145701.appspot.com/M/2017/King.Arthur.Leg.of.the.Sword.2017.720p.Dual-S.mp4"
      }
    ]
