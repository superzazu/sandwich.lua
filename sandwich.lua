local sandwich = {
	_VERSION 		= 'sandwich v1.0.0',
	_DESCRIPTION	= 'A LÖVE2D resource manager',
	_URL			= 'http://github.com/superzazu/sandwich.lua'
}

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

	mesh = function(resource_name, ...)
		return love.graphics.newMesh(...)
	end,

	shader = function(resource_name, ...)
		return love.graphics.newShader(resource_name, ...)
	end,


}

sandwich.addType = function (type, callback)
	callbacks[type] = callback
end

sandwich.add = function (type, resource_name, ...)
	if not resources[type] then
		resources[type] = {}
	end

	if not resources[type][resource_name] then
		resources[type][resource_name] = callbacks[type](resource_name, ...)
	end
end

sandwich.get = function (type, resource_name)
	return resources[type][resource_name]
end

return sandwich