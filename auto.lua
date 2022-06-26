auto = Class{}

function auto:init()
	self.note = -1
	self.contents, self.size = love.filesystem.read( 'string', 'notes.txt')
	self.index = 1
	self.sleep = 0.2
end

function auto:update(dt)
	--self.note = tonumber(self.contents:sub(1))
	if self.index <= self.size then
		if string.byte(self.contents, self.index) >= 67 and string.byte(self.contents, self.index) <= 71 then
			if string.byte(self.contents, self.index + 1) == 35 then
				if string.byte(self.contents, self.index) ==70 or string.byte(self.contents, self.index) == 71 then
					self.note = 6 + string.byte(self.contents, self.index) - 67
				else
					self.note = 7 + string.byte(self.contents, self.index) - 67
				end
				self.index = self.index + 1
			else
				self.note = string.byte(self.contents, self.index) - 67
			end
		elseif string.byte(self.contents, self.index) == 65 or string.byte(self.contents, self.index) == 66 then

			if string.byte(self.contents, self.index + 1) == 35 then
				self.note = 6 + string.byte(self.contents, self.index) - 65 + 5
				self.index = self.index + 1
			else
				self.note = 7 + string.byte(self.contents, self.index) - 67
				self.note = string.byte(self.contents, self.index) - 65 + 5
			end
		elseif string.byte(self.contents, self.index) == 46 then
			self.sleep = 0.4
		end
		self.index = self.index + 1
	elseif self.index > self.size and self.index ~= 1 then
		self.sleep = 1
		self.index = 1
	end
end

function auto:render(dt)
		love.graphics.setColor(0, 0, 0, 1)
		c = 7
		love.timer.sleep(self.sleep)
		self.sleep = 0.2
		for j = 0, 6 do
			if j == self.note then
				a_w = 0.4
				a_b = 0
				audio[j]:stop()
				audio[j]:play()
				self.note = -1
			elseif self.note  == c then
				a_b = 0.4
				a_w = 0
				audio[c]:stop()
				audio[c]:play()
				self.note = -1
			else
				a_w = 0
				a_b = 0
			end
			love.graphics.setColor(0, 0, 0, 1)
			love.graphics.rectangle('line', 240 + (j) * 60, 0, 60, WIN_HEIGHT)
			love.graphics.setColor(0, 0, 0, a_w)
			love.graphics.rectangle('fill', 240 + (j) * 60, 0, 60, WIN_HEIGHT)
			if j ~= 2 and j ~= 6 then
				love.graphics.setColor(0, 0, 0, 1)
				love.graphics.rectangle('fill', 280 + (j ) * 60, 0, 40, WIN_HEIGHT - 60)
				love.graphics.setColor(1, 1, 1, a_b)
				love.graphics.rectangle('fill', 280 + (j ) * 60, 0, 40, WIN_HEIGHT - 60)
				c = c + 1
			end
		end
end