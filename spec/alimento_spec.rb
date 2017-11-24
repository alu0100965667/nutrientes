require "spec_helper"

RSpec.describe Alimento::Alimento do
  
  before :all do
    @papas = Alimento::Alimento.new("Papas", 2.0, 15.4, 0.1, nil)
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

RSpec.describe Alimento::Nodo do
  before :all do
    @nodo = Alimento::Nodo.new(2, nil, nil)
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

RSpec.describe Alimento::Lista do
  before :all do
    @head = Alimento::Nodo.new(1, nil, nil)
    @tail = Alimento::Nodo.new(0, nil, nil)
    @lista = Alimento::Lista.new(@head, @tail)
  end
  
  describe "# Lista" do
    it "Existe head de la lista" do
      expect(@lista).to respond_to(:head)
    end
    it "Existe tail de la lista" do
      expect(@lista).to respond_to(:tail)
    end
    it "Insertar nodo en la lista" do
      @insert = Alimento::Nodo.new(2, nil, nil)
      @lista.insert(@insert)
      expect(@lista.head.siguiente.valor).to eq(1)
      expect(@lista.head.valor).to eq(2)
    end
    it "Extraer nodo por la cabeza" do
      @otro = Alimento::Nodo.new(3, nil, nil)
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

RSpec.describe Alimento::GrupoAlimentos do
  before :all do
    @cerdo = Alimento::GrupoAlimentos.new("Cerdo", 21.5, 0.0, 6.3, nil, "Carnes")
  end
  
  describe "# Clase, Tipo de objeto y Jerarquia" do
    it "El objeto de GrupoAlimentos es de la clase GrupoAlimentos" do
      expect(@cerdo).to be_an_instance_of(Alimento::GrupoAlimentos)
    end
    it "El objeto de GrupoAlimentos es un Alimento" do
      expect(@cerdo).to be_a_kind_of(Alimento::GrupoAlimentos)
    end
    it "El objeto de GrupoAlimentos es un Alimento" do
      expect(@cerdo).to be_a_kind_of(Alimento::Alimento)
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
      expect(Alimento::GrupoAlimentos.superclass).to eq(Alimento::Alimento)
    end
  end
  
  describe "# Métodos" do
    it "to_s funciona correctamente" do
      expect(@cerdo.to_s).to eq("Grupo: Carnes\nAlimento: Cerdo\n\tProteinas: 21.5\n\tGlucidos: 0.0\n\tLipidos: 6.3")
    end
    it "Se obtiene el valor energetico correctamente" do
      expect(@cerdo.kcal).to eq(142.7)
    end
  end
end

RSpec.describe Alimento::Alimento do
  
  before :all do
    @papas = Alimento::Alimento.new("Papas", 2.0, 15.4, 0.1, nil)
    @papasgrupo = Alimento::GrupoAlimentos.new("Papas", 2.0, 15.4, 0.1, nil, "Hidratos")
    @cerdo = Alimento::GrupoAlimentos.new("Cerdo", 21.5, 0.0, 6.3, nil, "Carnes")
    @huevofrito = Alimento::Alimento.new("Huevo frito", 14.1, 0.0, 19.5, nil)
  end
  
  describe "# Módulo Comparable en Gema" do
    it "obj < other" do
      expect(@papas<@cerdo).to eq(true)
    end
    it "obj <= other" do
      expect(@papas<=@cerdo).to eq(true)
    end
    it "obj == other" do
      expect(@papas==@papasgrupo).to eq(true)
    end
    it "obj > other" do
      expect(@papas>@cerdo).to eq(false)
    end
    it "obj >= other" do
      expect(@papas>=@cerdo).to eq(false)
    end
    it "between?(min, max)" do
      expect(@cerdo.between?(@papas, @huevofrito)).to eq(true)
      expect(@papas.between?(@cerdo, @huevofrito)).to eq(false)
    end
    it "Comparación con otros tipos de objetos" do
      expect{@papas>1}.to raise_error(ArgumentError)
    end
  end
  
end

RSpec.describe Alimento::Lista do
  
  before :all do
    @l1 = Alimento::Lista.new(Alimento::Nodo.new(1, nil, nil), Alimento::Nodo.new(0, nil, nil))
    @l1.insert(Alimento::Nodo.new(2, nil, nil))
    @l1.insert(Alimento::Nodo.new(3, nil, nil))
  end
  
  describe "# Módulo Enumerable en Lista" do
    it "Método all?" do
      expect(@l1.all?).to eq(true)
    end
    it "Método any?" do
      expect(@l1.any?).to eq(true)
    end
    it "Método collect" do
      expect(@l1.map{|i| i*i}).to eq([9, 4, 1, 0])
      expect(@l1.collect{|i| i*i}).to eq([9, 4, 1, 0])
    end
    it "Método count" do
      expect(@l1.count).to eq(4)
    end
    it "Método detect" do
      expect(@l1.detect {|i| i == 0}).to eq(0)
      expect(@l1.find {|i| i == 2}).to eq(2)
      expect(@l1.find {|i| i == 4}).to eq(nil)
    end
    it "Método drop" do
      expect(@l1.drop(2)).to eq([1, 0])
    end
    it "Método max" do
      expect(@l1.max).to eq(3)
    end
    it "Método max" do
      expect(@l1.min).to eq(0)
    end
    it "Método sort" do
      expect(@l1.sort).to eq([0, 1, 2, 3])
    end
  end
  
end

RSpec.describe Alimento::Alimento do
  before :all do
    @choco1 = [6.5,6.5,6.7,6.5,6.5,6.8,6.7,6.2,6.5,7.2,6.9,7.0,6.3,6.2,6.1,5.9,5.8,6.1,6.7,6.7,6.6,6.7,6.9,7.2,7.1]   # datos de chocolate ind 1
    @gluco1 = [4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9,6.8,6.3,6.2,6.3,6.2,6.3,6.1]   # datos de glucosa ind 1
    @choco2 = [4.6,4.6,4.7,4.7,4.8,4.7,4.8,4.8,4.6,4.4,4.7,4.7,4.8,4.7,5.2,5.9,5.9,5.7,5.4,5.3,5.1,4.8,4.8,4.9,5.9]   # datos de chocolate ind 2
    @gluco2 = [6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5] # datos de glucosa ind 2
    
    @datos_choco = [@choco1,@choco2]
    @datos_gluco = [@gluco1,@gluco2]
    
    @datos = [@datos_choco,@datos_gluco]
    
    @chocolate = Alimento::Alimento.new("Chocolate", 5.3, 47.0, 30.0, @datos)
  end
  
  describe "# Cálculo IG" do
    
    it "La clase alimento contiene datos" do
      expect(@chocolate).to respond_to(:datos)
    end
    
  end
end