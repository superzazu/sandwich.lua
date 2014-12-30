# sandwich.lua

*sandwich* is a resource manager made with [LÖVE](https://love2d.org). 
It prevents you from loading the same resource multiple times during your program execution.
It supports the "basic" LÖVE resource types (such as images, quads, fonts, audio streams), but you can add your own types easily.
     
## Quickstart
```
local sandwich = require 'sandwich'     
     
my_image = sandwich.get('image', 'my_image.png')     
my_quad = sandwich.get('quad', 'my_quad', 0,0, 32,32, 64,64)     
```

## Add resource types
Example with [bump.lua](https://github.com/kikito/bump.lua) worlds:
```     
-- note: you only do that once, at the beginning of your program
local bump = require 'lib.bump'
local sandwich = require 'lib.sandwich'
     
local callback_bumpworld = function (resource_name, ...) -- function that makes a resource
	return bump.newWorld(...)
end
sandwich.addType('bumpworld', callback_bumpworld)

my_world = sandwich.get('bumpworld', 'my_world', 32) -- creating a world
```
