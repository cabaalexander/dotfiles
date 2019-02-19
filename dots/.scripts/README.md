# ~/.scripts/

Cool stuffs I got on my PC 🤯 🎩

List of stuffs here: :point_down:

- [cdtmux](#cdtmux)
- [clipboard](#clipboard)
- [conto](#conto)
- [debug](#debug)
- [dkdoom](#dkdoom)
- [doscript](#doscript)
- [dowhile](#dowhile)
- [dsply](#dsply)
- [gcb](#gcb)
- [gdsf](#gdsf)
- [getemoji](#getemoji)
- [getip](#getip)
- [getmovies](#getmovies)
- [getpid](#getpid)
- [getresponsecode](#getresponsecode)
- [gmtm](#gmtm)
- [gpf](#gpf)
- [gprune](#gprune)
- [gtemp](#gtemp)
- [guntemp](#guntemp)
- [lstree](#lstree)
- [lvserver](#lvserver)
- [mftp](#mftp)
- [nvmc](#nvmc)
- [sourceifexists](#sourceifexists)

## [cdtmux](/dots/.scripts/cdtmux)

Creates a new tmux pane with the given path ;)

    Name
        cdtmux

    Usage:
        cdtmux [OPTION_ARG] [PATH]

    Options:
        h,l     Split the new pane horizontal
        j,k     Split the new pane vertical

## [clipboard](/dots/.scripts/clipboard)

Quick copy or paste scripterino

    Name
        clipboard

    Usage:

        clipboard [OPTION] [ARG]...

    Options
        -c, --copy
        -p, --paste

## [conto](/dots/.scripts/conto)

This `add`, `commit --amend` and `git push -f --no-verify`
all the changes in the current branch to its remote one

## [debug](/dots/.scripts/debug)

Enables debug mode on the given file and sets a custom PS4
(debug line prompt)

## [dkdoom](/dots/.scripts/dkdoom)

Deletes all docker containers and images

## [doscript](/dots/.scripts/doscript)

Create a `hello.sh` world and change the mod to add execute priviledge

## [dowhile](/dots/.scripts/dowhile)

Execute given commands invinitely (Until canceled)
with a interval of time between re-execution

## [dsply](/dots/.scripts/dsply)

Shows a notification depending on what OS you are

### Usage

    $ dsply [OPTION]... [PARAM]...

### Options

    -b      Makes a sound when the notification appears(mac)

### Parameters

    Message     Body for the notification or message to be displayed
    Title       Title for the notification (mac)

## [gcb](/dots/.scripts/gcb)

Echo the current git branch

## [gdsf](/dots/.scripts/gdsf)

Destroy a file from git history following every commit it was present

## [getemoji](/dots/.scripts/getemoji)

This script gets an emoji from an URL

This script UX is way better when you have 'fzf' installed ;)

### Usage

    $ getemoji [OPTION]... [PATTERN]

### Options

    -s [Source]     Source

### Pattern

This can be the name of the emoji or a match for it

### Sources

    luke    Get emojis from luke's repo - https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.emoji
    \*      Get emojis from unicode.org - https://unicode.org/Public/emoji/1.0/emoji-data.txt


## [getip](/dots/.scripts/getip)

Echo the ip of the current HOST

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
tk tk

## [getpid](/dots/.scripts/getpid)

Get the pid for the last backedground command i.e. job

## [getresponsecode](/dots/.scripts/getresponsecode)

Gets the response call for a given URL

## [gmtm](/dots/.scripts/gmtm)

Merges current branch on master

## [gpf](/dots/.scripts/gpf)

Git pulls "hard" from a repo ( ͡° ͜ʖ ͡°)

## [gprune](/dots/.scripts/gprune)

Deletes the git branches that are not on the remote (github)

## [gtemp](/dots/.scripts/gtemp)

Creates a git `temp` branch with the current modified and untracked files (and push it)

## [guntemp](/dots/.scripts/guntemp)

This stages all the last temp commits and change to `master` so you do what ever with those

## [lstree](/dots/.scripts/lstree)

Displays files in a tree view (My wrapper around `tree`)

## [lvserver](/dots/.scripts/lvserver)

Run node package `live-server`
my way (My wrapper aropund `live-server`)

## [mftp](/dots/.scripts/mftp)

Only god knows what this is ¯\\_(ツ)_/¯

## [nvmc](/dots/.scripts/nvmc)

My wrapper around `nvm i`

## [sourceifexists](/dots/.scripts/sourceifexists)

This as the name says, source a file if it exists. Also supports globbing

