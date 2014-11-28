# sandwich.lua

*sandwich* is a resource manager made with [LÖVE](https://love2d.org). 
It allows you to avoid loading the same resource multiple times during your program execution.
It supports the "basic" LÖVE resource types (such as images, quads, fonts, audio streams), but you can add your own types easily.
     
## Quickstart
```
local sandwich = require 'sandwich'     
     
sandwich.add('image', 'my_image.png') -- adds the resource in the sandwich     
sandwich.get('image', 'my_image.png') -- gets the resource     
      
sandwich.add('quad', 'my_quad', 0,0, 32,32, 64, 64) -- adds the resource in the sandwich     
sandwich.get('quad', 'my_quad') -- gets the resource     
```

## Add resource types
```     
-- fake example with quads, same behaviour as above:
local callback = function (resource_name, ...) -- function which makes a resource
	return love.graphics.newQuad(...)
end
sandwich.addType('my_type', callback)
sandwich.add('my_type', 'resource_name', 0,0, 32,32, 64, 64)
```