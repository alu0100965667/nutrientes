module Enumerable
	
	def sort_for
		doble = self.dup
		for i in 0...doble.size do
			for j in 0...doble.size do
				if doble[i] < doble[j]
					doble[i], doble[j] = doble[j], doble[i]
				end
			end
		end
		doble
	end
	
	def sort_each
		doble = self.dup
		doble.each_index{ |i| doble.each_index{ |j| doble[i], doble[j] = doble[j], doble[i] if doble[i] < doble[j] } }
	end
	
end