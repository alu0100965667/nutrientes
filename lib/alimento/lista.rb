module Alimento

Nodo = Struct.new(:valor, :siguiente, :anterior)

class Lista
	include Enumerable
	def initialize(head, tail)
		@head = head
		@tail = tail
		
		@head.siguiente = @tail
		@tail.anterior = @head
	end
	
	def head
		@head
	end
	def tail
		@tail
	end
	
	def insert(nodo)
		if(nodo.is_a?Nodo) then
			aux = @head
			@head = nodo
			@head.anterior = nil
			@head.siguiente = aux
			aux.anterior = @head
		end
	end
	
	def head_out
		aux = @head.siguiente
		@head.siguiente = nil
		@head = aux
		@head.anterior = nil
	end
	
	def tail_out
		aux = @tail.anterior
		@tail.anterior = nil
		@tail = aux
		@tail.siguiente = nil
	end
	
	def each
		tmp = @head
		while tmp != nil do
			yield tmp.valor
			tmp = tmp.siguiente
		end
	end
end

end