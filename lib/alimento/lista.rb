Nodo = Struct.new(:valor, :siguiente, :anterior)

class Lista
	def initialize(head, tail)
		@head = head
		@tail = tail
	end
	
	def head
		@head
	end
	def tail
		@tail
	end
end