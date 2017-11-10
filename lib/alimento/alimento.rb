class Alimento
	attr_reader :nombre, :proteinas, :glucidos, :lipidos
	
	def initialize(nombre, proteinas, glucidos, lipidos)
		@nombre = nombre
		@proteinas = proteinas
		@glucidos = glucidos
		@lipidos = lipidos
	end
	
	def to_s
		"Alimento: #{nombre}\n\tProteinas: #{proteinas}\n\tGlucidos: #{glucidos}\n\tLipidos: #{lipidos}"
	end
	
	def kcal
		(@proteinas*4 + @glucidos*4 + @lipidos*9)
	end
	
end