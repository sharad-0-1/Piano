
VIR_WIDTH = 60 * 15
VIR_HEIGHT = 250

WIN_WIDTH = 60 * 15
WIN_HEIGHT = 250

Class = require 'Class'
push = require 'push'
require 'home'
require 'interactive'
require 'auto'

function love.load()
	math.randomseed(os.time())
	love.graphics.setDefaultFilter('nearest', 'nearest')
	push:setupScreen(WIN_WIDTH, WIN_HEIGHT, WIN_WIDTH, WIN_HEIGHT, {
		fullscreen = false,
		vsync = true,
		resizable = true
	})
	home = home()
	interactive = interactive()
	auto = auto()
	love.window.setTitle("Piano 2.0")
	mousepressed = {}
	audio = {}
	for i = 0, 11 do
		audio[i] = love.audio.newSource('sounds/'..tostring(i)..'.mp3', 'static')
	end
	state = "start"
	love.mouse.setCursor(love.mouse.newCursor('images/cursor_released.png'))
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.mousepressed(x, y, button)
	mousepressed[button] = true
end

function love.mouse.waspressed(button)
	return mousepressed[button]
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	if state == 'start' then
		home:update()
	end
	if state == 'interactive' then
		interactive:update(dt)
	end
	if state == 'auto' then
		auto:update(dt)
	end
	mousepressed = {}
end

function love.draw()
	push:apply('start')
	love.graphics.clear(1, 1, 1, 1)
	if state == 'start' then
		home:render()
	elseif state == 'interactive' then
		interactive:render()
	elseif state == 'auto' then
		auto:render()
	end
	push:apply('end')
end

