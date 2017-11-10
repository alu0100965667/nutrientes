Nodo = Struct.new(:valor, :siguiente, :anterior)

class Lista
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
end