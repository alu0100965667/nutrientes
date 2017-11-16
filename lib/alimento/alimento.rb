class Gema
	include Comparable
	attr_reader :nombre, :proteinas, :glucidos, :lipidos
	def <=>(other)
		if other.kind_of?Gema
			kcal <=> other.kcal
		end
	end
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

class GrupoAlimentos < Gema
	attr_reader :grupo
	def initialize(nombre, proteinas, glucidos, lipidos, grupo)
		super(nombre, proteinas, glucidos, lipidos)
		@grupo = grupo
	end
	
	def to_s
		s = "Grupo: #{grupo}\n"
		s << super.to_s
		s
	end
end