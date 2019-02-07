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
        "link": "<link-to-the-movie>"
      },
      {
        "title": "King Arthur: Legend of the Sword",
        "link": "<link-to-the-movie>"
      }
    ]

#### PART_NAME

You can supply different words that you think would match the title

    $ getmovies arthur king legend
    [
      {
        "title": "King Arthur: Legend of the Sword",
        "link": "<link-to-the-movie>"
      }
    ]
