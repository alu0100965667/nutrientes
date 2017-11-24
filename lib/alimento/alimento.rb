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
	
	# Método auxiliar para hacer el if de la función aibc
	def if0(gij, g0, gi1)
		return 0.0 if gij < g0
		return ((((gij-g0)+(gi1-g0))/2)*5)
	end
	
	# Recibe un vector con los datos de un alimento para los individuos, devuelve un vector con los AIBC de cada individuo
	def aibc(g)
		# recibe un vector de datos del alimento
		# devuelve los aibc del alimento, o glucosa, para cada individuo
		g.map{ |gi| gi.each_with_index.map{ |gindex, i| if0(gindex, gi[0], gi[i-1]) if i > 0 } }.map{ |gi| gi.reject{ |gij| gij.class == nil::NilClass } }.map{ |ri| ri.reduce(0, :+) }
	end
	
	# Calcula los AIBC de los datos del alimento y los divide entre los AIBC de los datos de la glucosa
	# Devolviendo un vector con los IG de cada individuo
	def ig_ind
		aibc(@datos[0]).each_with_index.map{ |ind, i| (ind/aibc(@datos[1])[i])*100 }
	end
	
	# Calcula el IG del alimento haciendo la media con los IG de los individuos
	def ig
		ig_ind.reduce(0, :+)/ig_ind.size
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