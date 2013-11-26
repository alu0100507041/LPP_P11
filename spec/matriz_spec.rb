require "matrizds.rb"
describe Matrizds do
 describe "Matriz" do
  before :all do
   A = Matrizds::Matriz.new(2,2,[[1,2],[2,3]])
   B = Matrizds::Matriz.new(2,2,[[1,2],[2,3]])
 end
 describe "basicas" do
    it "existe numero de filas" do
       A.n.should ==2
    end
    it "Existe una maximo y un minimo" do
       A.min.should==1
       A.max.should==3
    end
    it "existe numero de columnas" do
       A.m.should ==2
    end
    it "es una matriz cuadrada" do
       A.cuadrada.should == true
    end
    it "Se puede imprimir la matriz"do
       A.to_s.should == "[1, 2][2, 3]"
    end
  end

   describe "operaciones algebraicas" do
    it "se pueden sumar dos matrices" do

    (A+B).to_s.should=="[2, 4][4, 6]"
    end
    it "se pueden multiplicar dos matrices" do
        (A*B).to_s.should=="[5, 8][8, 13]"
    end
    it "se pueden restar dos matrices" do
       (A-B).to_s.should=="[0, 0][0, 0]"

    end
   it "Se puede dividir una matriz por un escalar" do
       (A/2).to_s.should =="[0.5, 1.0][1.0, 1.5]"
   end

    it "Se puede multiplicar una matriz por un escalar" do
        (A.mult(2)).to_s.should =="[2, 4][4, 6]"
    end

   end
 end
describe "Fracciones" do
  before :all do
      D = Matrizds::Fraccion.new(1,1)
      E = Matrizds::Fraccion.new(1,4)
    end
   it "Existe un numerador" do
     D.a.should == 1
   end
   it "Existe un denominador" do
     D.b.should == 1
   end
   it "se debe mostrar en consola de la forma a/b" do
     D.to_s.should == "1/1"
   end

   it "se debe mostrar en consola en formato flotante" do
     D.to_f.should == 1.00
   end
   it " Se debe comparar si dos fracciones son iguales con ==" do
     (D==E).should == false
   end
   it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
     D.abs.should == 1
   end
   it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
     (E.reciprocal).to_s.should == "4/1"
   end
   it "Se debe calcular el opuesto de una fraccion con -" do
     (-D).to_s.should == "-1/1" 
   end
   it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
     (D+E).to_s.should == "5/4"
   end
   it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
     (D-E).to_s.should == "3/4"
   end
   it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
     (D*E).to_s.should == "1/4"
   end
   it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
     (D/E).to_s.should == "4/1"
   end
   
   it "Se debe de poder comprobar si una fracion es menor que otra" do
     (E<D).should == true 
   end
   it "Se debe de poder comprobar si una fracion es mayor que otra" do
     (D>E).should == true
   end
   it " Se debe de poder comprobar si una fracion es menor o igual que otra" do
     (E<=D).should == true
   end
   it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
     (D>=E).should == true
   end

end
describe "Matriz con fracciones" do
  before :all do
   F = Matrizds::Matriz.new(2,2,[[Matrizds::Fraccion.new(1,2),2],[2,3]])
   G = Matrizds::Matriz.new(2,2,[[1,2],[2,3]])
  end
	it "Se imprime la matriz con fracciones" do
		F.to_s.should=="[1/2, 2][2, 3]"
	end
	it "se pueden sumar dos matrices" do

    (F+G).to_s.should=="[3/2, 4][4, 6]"
    end
    it "se pueden multiplicar dos matrices" do
        (G*F).to_s.should=="[9/2, 8][7/1, 13]"
    end
    it "se pueden restar dos matrices" do
       (G-F).to_s.should=="[-1/2, 0][0, 0]"
    end
   
 end
 describe "Matriz dispersas" do
  before :all do
   H = Matrizds::Matriz.new(2,2,[[Matrizds::Fraccion.new(1,2),2],[2,3]])
   I = Matrizds::Sparse.new(2,2,[[1,0],[2,0]])
  
   end
  it "calcula el maximo y minimo de la matriz"do
    I.min.should==0
    I.max.should==2
  end
	it "Se imprime la matriz con fracciones" do
	I.to_s.should=="[1, 0][2, 0]"
    #I.get(0,0).to_s.should=="1"
	end
	it "se pueden sumar dos matrices" do
	
    (I+H).to_s.should=="[3/2, 2][4, 3]"
    end
    it "se pueden multiplicar dos matrices" do
        (I*H).to_s.should=="[1/2, 2][1/1, 4]"
    end
    it "se pueden restar dos matrices" do
       (I-H).to_s.should=="[-1/2, -2][0, -3]"
    end
   
 end
 
end
