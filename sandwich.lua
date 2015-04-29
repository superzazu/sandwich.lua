local sandwich = {
    _VERSION      = 'sandwich v1.0.0',
    _DESCRIPTION  = 'A LÖVE2D resource manager',
    _URL          = 'http://github.com/superzazu/sandwich.lua',
    _LICENSE      = [[
    Copyright (c) 2014 Nicolas Allemand

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    ]]
}

local prefix = ''
local resources = {}

local callbacks = {
    image = function(resource_name, ...)
        return love.graphics.newImage(resource_name)
    end,
    quad = function(resource_name, ...)
        return love.graphics.newQuad(...)
    end,
    sound = function(resource_name, ...)
        return love.audio.newSource(resource_name, 'static')
    end,
    music = function(resource_name, ...)
        return love.audio.newSource(resource_name, 'stream')
    end,
    font = function(resource_name, ...)
        return love.graphics.newFont(resource_name, ...)
    end,
    imagefont = function(resource_name, ...)
        return love.graphics.newImageFont(resource_name, ...)
    end,
    mesh = function(resource_name, ...)
        return love.graphics.newMesh(...)
    end,
    shader = function(resource_name, ...)
        return love.graphics.newShader(resource_name, ...)
    end
}

sandwich.addType = function (type, callback)
    callbacks[type] = callback
end

sandwich.get = function (type, resource_name, ...)
    if not resources[type] then
        resources[type] = {}
    end

    if not resources[type][prefix..resource_name] then
        resources[type][prefix..resource_name] = callbacks[type](prefix..resource_name, ...)
    end

    return resources[type][prefix..resource_name]
end

sandwich.setPrefix = function (p)
    prefix = p
end


return sandwich
