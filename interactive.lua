interactive = Class{}

function interactive:inti()
	self.x, self.y = -1, -1
end

function interactive:update(dt)
	self.x, self.y = -1, -1
	if love.mouse.waspressed(1) then
		self.x, self.y = love.mouse.getPosition()
	end
	
end

function interactive:render()
	love.graphics.setColor(0, 0, 0, 1)
	for i = 0, 2 do
		c = 7
		for j = 0, 6 do
			if self.x >= 40 + (i * 7 + j) * 60 and self.x <= 40 + (i * 7 + j) * 60 + 40 and self.y <= WIN_HEIGHT - 60 and j ~= 2 and j ~= 6 and i + j ~= 7 then
				a_b = 0.8
				a_w = 0
				audio[c]:play()
				self.x, self.y = -1, -1
			elseif self.x >= 1 + (i * 7 + j) * 60 and self.x <= 1 + (i * 7 + j) * 60 + 60 then
				a_w = 1
				a_b = 0
				audio[(i * 7 + j) % 7]:play()
			else
				a_w = 0
				a_b = 0
			end
			love.graphics.setColor(0, 0, 0, 1)
			love.graphics.rectangle('line', 1 + (i * 7 + j) * 60, 0, 60, WIN_HEIGHT)
			love.graphics.setColor(0, 0, 0, a_w)
			love.graphics.rectangle('fill', 1 + (i * 7 + j) * 60, 0, 60, WIN_HEIGHT)
			if j ~= 2 and j ~= 6 and i + j ~= 7 then
				love.graphics.setColor(0, 0, 0, 1)
				love.graphics.rectangle('fill', 40 + (i * 7 + j ) * 60, 0, 40, WIN_HEIGHT - 60)
				love.graphics.setColor(1, 1, 1, a_b)
				love.graphics.rectangle('fill', 40 + (i * 7 + j ) * 60, 0, 40, WIN_HEIGHT - 60)
				c = c + 1
			end
		end
	end
end