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
end