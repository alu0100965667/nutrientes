module Alimento

# Esta clase representa a un alimento con sus nutrientes
# Se ha incluido el mixin Comparable
class Alimento
	include Comparable
	attr_reader :nombre, :proteinas, :glucidos, :lipidos, :datos
	
	# Pa incluir el mixin Comparable se utiliza el valor energético
	def <=>(other)
		if other.kind_of?Alimento
			kcal <=> other.kcal
		end
	end
	
	# Se asignan todas las variables de la clase
	def initialize(nombre, proteinas, glucidos, lipidos, datos)
		@nombre = nombre
		@proteinas = proteinas
		@glucidos = glucidos
		@lipidos = lipidos
		@datos = datos
	end
	
	# Devuelve el alimento formateado
	def to_s
		"Alimento: #{nombre}\n\tProteinas: #{proteinas}\n\tGlucidos: #{glucidos}\n\tLipidos: #{lipidos}"
	end
	
	# Devuelve el valor energético del alimento según sus nutrientes
	def kcal
		(@proteinas*4 + @glucidos*4 + @lipidos*9)
	end
	
	def aibc
		
	end
	
end

# Clase que hereda de alimento, extendiéndola, añadiéndole
# el nombre del grupo de alimentos al que pertenece
class GrupoAlimentos < Alimento
	attr_reader :grupo
	
	# Se llama al contructor de la clase madre y se asigna el valor de la nueva variable
	def initialize(nombre, proteinas, glucidos, lipidos, datos, grupo)
		super(nombre, proteinas, glucidos, lipidos, datos)
		@grupo = grupo
	end
	
	# Devuelve el Alimento formateado añadiéndole el nombre del grupo
	def to_s
		s = "Grupo: #{grupo}\n"
		s << super.to_s
		s
	end
end

end