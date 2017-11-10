require "spec_helper"

RSpec.describe Alimento do
  
  before :all do
    @papas = Alimento.new("Papas", 2.0, 15.4, 0.1)
  end
  
  describe "# almacenamiento de variables" do
    it "Se almacena correctamente el nombre" do
      expect(@papas.nombre).to eq("Papas")
    end
    it "Se almacena correctamente la cantidad de proteinas" do
      expect(@papas.proteinas).to eq(2.0)
    end
    it "Se almacena correctamente la cantidad de glucidos" do
      expect(@papas.glucidos).to eq(15.4)
    end
    it "Se almacena correctamente la cantidad de lipidos" do
      expect(@papas.lipidos).to eq(0.1)
    end
  end
  
  describe "# objeto formateado" do
    it "to_s funciona correctamente" do
      expect(@papas.to_s).to eq("Alimento: Papas\n\tProteinas: 2.0\n\tGlucidos: 15.4\n\tLipidos: 0.1")
    end
  end
  
  describe "# valor energetico" do
    it "Se obtiene el valor energético correctamente" do
      expect(@papas.kcal).to eq(70.5)
    end
  end
  
end

RSpec.describe Nodo do
  before :all do
    @nodo = Nodo.new(2, nil, nil)
  end
  
  describe "# Nodo" do
    it "Existe el valor de un Nodo" do
      expect(@nodo).to respond_to(:valor)
    end
    it "Existe el siguiente de un Nodo" do
      expect(@nodo).to respond_to(:siguiente)
    end
    it "Existe el anterior de un Nodo" do
      expect(@nodo).to respond_to(:anterior)
    end
  end
end

RSpec.describe Lista do
  before :all do
    @head = Nodo.new(1, nil, nil)
    @tail = Nodo.new(0, nil, nil)
    @lista = Lista.new(@head, @tail)
  end
  
  describe "# Lista" do
    it "Existe head de la lista" do
      expect(@lista).to respond_to(:head)
    end
    it "Existe tail de la lista" do
      expect(@lista).to respond_to(:tail)
    end
    it "Insertar nodo en la lista" do
      @insert = Nodo.new(2, nil, nil)
      @lista.insert(@insert)
      expect(@lista.head.siguiente.valor).to eq(1)
      expect(@lista.head.valor).to eq(2)
    end
    it "Extraer nodo por la cabeza" do
      @otro = Nodo.new(3, nil, nil)
      @lista.insert(@otro)
      @lista.head_out
      expect(@lista.head.valor).to eq(2)
      expect(@lista.head.anterior).to eq(nil)
    end
    it "Extraer nodo por la cola" do
      @lista.tail_out
      expect(@lista.tail.valor).to eq(1)
      expect(@lista.tail.siguiente).to eq(nil)
    end
  end
end

RSpec.describe GrupoAlimentos do
  before :all do
    @cerdo = GrupoAlimentos.new("Cerdo", 21.5, 0.0, 6.3, "Carnes")
  end
  
  describe "# Clase, Tipo de objeto y Jerarquia" do
    it "El objeto de GrupoAlimentos es de la clase GrupoAlimentos" do
      expect(@cerdo).to be_an_instance_of(GrupoAlimentos)
    end
    it "El objeto de GrupoAlimentos es un Alimento" do
      expect(@cerdo).to be_a_kind_of(GrupoAlimentos)
    end
    it "El objeto de GrupoAlimentos es un Alimento" do
      expect(@cerdo).to be_a_kind_of(Alimento)
    end
    it "El objeto de GrupoAlimentos responde a proteinas" do
      expect(@cerdo).to respond_to(:proteinas)
    end
    it "El objeto de GrupoAlimentos responde a glucidos" do
      expect(@cerdo).to respond_to(:glucidos)
    end
    it "El objeto de GrupoAlimentos responde a lipidos" do
      expect(@cerdo).to respond_to(:lipidos)
    end
    it "El objeto de GrupoAlimentos responde a grupo" do
      expect(@cerdo).to respond_to(:grupo)
    end
    it "La superclase de GrupoAlimentos es Alimento" do
      expect(GrupoAlimentos.superclass).to eq(Alimento)
    end
  end
end