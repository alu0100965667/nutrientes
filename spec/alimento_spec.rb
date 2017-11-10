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