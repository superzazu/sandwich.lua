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
```     
-- fake example with quads, same behaviour as above:
local callback = function (resource_name, ...) -- function which makes a resource
	return love.graphics.newQuad(...)
end
sandwich.addType('my_type', callback)
my_resource = sandwich.get('my_type', 'my_resource', 0,0, 32,32, 64, 64)
```