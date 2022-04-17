# bunny
A simple profanity filter for GameMaker. Inspired by [leo-profanity](https://github.com/jojoee/leo-profanity), and using a modified dictionary from [Shutterstock](https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words).

## Dictionaries
Bad word dictionaries are placed in the '/filter' folder and end with '.dic'. Currently dictionaries only support 1 word per line. To prevent shipping your game filled with plain-text profanity they are then encoded with [Base64](https://en.wikipedia.org/wiki/Base64).

## Setup
Import the project, and at game start run `bunny_init()`

## Use

### bunny_loadDictionary(dictionaryName)
loads `/filter/{dictionaryName}.dic`

### bunny_check(string)
returns true if profanity detected in string

### bunny_clean(string, [replaceKey])
returns string with profane word characters replaced by replaceKey (defaults to `*`)
