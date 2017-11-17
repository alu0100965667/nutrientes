module Alimento

# Clase que representa a un Nodo de una lista doblemente enlazada
Nodo = Struct.new(:valor, :siguiente, :anterior)

# Clase que representa a una lista doblemente enlazada
# Se ha incluido el mixin Enumerable
class Lista
	include Enumerable
	
	# Se asignan la cabeza (@head) y la cola (@tail) y se enlazan
	def initialize(head, tail)
		@head = head
		@tail = tail
		
		@head.siguiente = @tail
		@tail.anterior = @head
	end
	
	# Getter/Setter de @head
	def head
		@head
	end
	
	# Getter/Setter de @tail
	def tail
		@tail
	end
	
	# Método que inserta un nodo en la cabeza de la lista
	def insert(nodo)
		if(nodo.is_a?Nodo) then
			aux = @head
			@head = nodo
			@head.anterior = nil
			@head.siguiente = aux
			aux.anterior = @head
		end
	end
	
	# Método que extrae/elimina el primer valor de la lista
	def head_out
		aux = @head.siguiente
		@head.siguiente = nil
		@head = aux
		@head.anterior = nil
	end
	
	# Método que extrae/elimina el último valor de la lista
	def tail_out
		aux = @tail.anterior
		@tail.anterior = nil
		@tail = aux
		@tail.siguiente = nil
	end
	
	# Se incluye el método del mixin Enumerable
	# Se define como una iteración sobre los valores de cada nodod de la lista
	def each
		tmp = @head
		while tmp != nil do
			yield tmp.valor
			tmp = tmp.siguiente
		end
	end
end

end