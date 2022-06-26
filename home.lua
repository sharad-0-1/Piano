home = Class()

function home:init()
	self.icon = love.graphics.newImage('images/blue_button00.png')
	self.icon1 = love.graphics.newImage('images/blue_button04.png')
	self.background = love.graphics.newImage('images/background.jpg')
	love.graphics.setFont(love.graphics.newFont('font/button_font.ttf', 24))
	self.current = 1000
end

function home:update(dt)
	self.x, self.y = love.mouse.getPosition()
	if self.x >= WIN_WIDTH / 2 - 220 and self.x <= WIN_WIDTH / 2 - 30  and self.y >= WIN_HEIGHT / 2 - 20 and self.y <= WIN_HEIGHT / 2 + 29 then
		self.current = -250
	elseif self.x >= WIN_WIDTH / 2 + 30 and self.x <= WIN_WIDTH / 2 + 220 and self.y >= WIN_HEIGHT / 2 - 20 and self.y <= WIN_HEIGHT / 2 + 29 then
		self.current = 0
	end
	if love.mouse.waspressed(1) then
		if self.x >= WIN_WIDTH / 2 - 250 and self.x <= WIN_WIDTH / 2 - 30  and self.y >= WIN_HEIGHT / 2 - 22 and self.y <= WIN_HEIGHT / 2 + 29 then
			mousepressed = {}
			state = 'interactive'
		elseif self.x >= WIN_WIDTH / 2 + 30 and self.x <= WIN_WIDTH / 2 + 220 and self.y >= WIN_HEIGHT / 2 - 20 and self.y <= WIN_HEIGHT / 2 + 29 then
			mousepressed = {}
			state = 'auto'
		end
	end
end

function home:render()
	love.graphics.draw(self.background, 0, 0)
	love.graphics.draw(self.icon, WIN_WIDTH / 2 - 220, WIN_HEIGHT / 2 - 20)
	love.graphics.draw(self.icon, WIN_WIDTH / 2 + 30, WIN_HEIGHT / 2 - 20)
	love.graphics.draw(self.icon1, WIN_WIDTH / 2 + self.current, WIN_HEIGHT / 2 - 22, 0, 1.2,1.2)
	love.graphics.setColor(0,0,0,1)
	love.graphics.print('Interactive', WIN_WIDTH / 2 - 200, WIN_HEIGHT / 2 - 10)
	love.graphics.print('Auto', WIN_WIDTH / 2 + 90, WIN_HEIGHT / 2 - 10)
	love.graphics.setColor(1,1,1,1)
end