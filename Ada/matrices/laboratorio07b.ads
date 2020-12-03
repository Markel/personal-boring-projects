package Laboratorio07b is
  subtype T_Dia is Integer range 1..31;
  type T_mes is (Enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);
  type T_Fecha is record
    Dia: T_Dia;
    Mes: T_Mes;
    anno: Positive;
  end record;
  type T_Complejo_Tri is record
    A,B:Float;
  end record;
  type T_Complejo_Polar is record
    Argumento, Angulo: Float;
  end record;

  type T_Vector_Enteros is array (Integer range <>) of Integer;
  type T_Matriz_Enteros is array (Integer range <>, Integer range <>) of Integer;

  --------------------
  -- Nivel Avanzado --
  --------------------


  function Trigon (C: in T_Complejo_Polar) return T_Complejo_Tri;
  --post: resultado es el complejo C en forma trigonometrica
  procedure Dia_Siguiente(F: in out T_Fecha);
  --pre:  F es una fecha v�lida
  --post: F es la fecha del d�a siguiente a la valor dado de F

  type T_Ano_Lluvias is array(T_Mes) of T_Vector_enteros(1..31);
  type T_Datos_Pluviometricos is array(2001..2020) of T_Ano_Lluvias;
  procedure Maximo(Lluvia: in T_Datos_Pluviometricos; F1, F2: T_Fecha; F: out T_Fecha);
  --pre: F1 y F2 dos fechas y F1 anterior a F2
  --post: Mes y ano contienen el mes y el a�o que mas llovio entre esas fechas
  --      contando solo los d�as incluidos de cada mes

  --Lista est�tica de carreteras
  Max_Car: constant Integer := 110;
  Max_Carreteras: constant Integer := 40;
  Max_Puntos: constant Integer:=1000;
  type T_Punto is record
    X, Y: Float;
  end record;
  CENTINELA: Constant T_Punto := (-1.0, -1.0);
  type V_Puntos is array (Integer range <>)of T_Punto;
  type T_Estatica_Puntos is record
    Ptos: V_Puntos(1..Max_puntos);
    Num: Natural;
  end record;
  type T_Carretera is record
    Codigo, Inicio, Final: String(1..Max_Car);
    Peaje_km: Float;
    Trazado: T_Estatica_Puntos;
  end record;
  type V_Carreteras is array (Integer range <>) of T_Carretera;
  type T_Estatica_Carreteras is record
    Ctras: V_Carreteras(1..Max_Carreteras);
    Cont: Natural;
  end record;

  procedure Simplificar(L:  in out T_Estatica_Carreteras;
                        Peaje: out T_Estatica_Carreteras);
  --pre: Lista de carreteras
  --post: Peaje = cinco primeras carreteras de peaje de L (o menos si no hay 5)
  --      L = vector original sin las cinco primeras carreteras de peaje (o las que haya)
  procedure Simplificar(L: in out T_Estatica_Puntos);
  --pre: Lista de puntos ordenada
  --post: Misma lista de puntos eliminando 3 de cada cuatro conservando los extremos
  --      cuantos indica cuantos puntos quedan en la lista.
  procedure Simplificar(L: in out T_Estatica_Carreteras);
  --pre: Lista de carreteras con muchos puntos
  --post: Lista de carreteras con los puntos cercanos eliminados


  type T_Identificacion is record
    Nom, Apel: String (1 .. 20);
    Dni: Integer;
  end record;
  type T_Info_Apartamento is record
    Precio : Integer;
    Propietario_Actual: T_Identificacion;
    Propietario_Anterior: T_Identificacion;
  end record;
  Max_Apartamentos_Por_Planta: constant Integer:= 8;
  type T_Tabla_Apartamentos is array (Integer range <>) of T_Info_Apartamento;
  type T_Planta is record
    Apartamentos: T_Tabla_Apartamentos(1 .. Max_Apartamentos_Por_Planta);
    Num_Apartamentos: Integer; -- valor entre 1 y 8
  end record;
  Max_Plantas : constant Integer := 10;
  type T_Edificio is array (Integer range <>) of T_Planta;
  Num_Bloques : constant Integer := 20;
  type T_Urbanizacion is array (1 .. Num_Bloques) of T_Edificio(1 .. Max_Plantas);
  function DNI_Mayor_Patrimonio(U: in T_Urbanizacion) return Integer;
  -- pre:
  -- post: resultado = el DNI de la persona de la urbanizaci�n que tiene
  -- un mayor patrimonio (el patrimonio es la suma de los valores
  -- de los pisos que posee)

  N: constant integer:=9;
  M: constant integer:=3;
  VACIO: constant integer := 0;
  type T_Puzle is array (1..N,1..N) of integer;
  type T_Ficha is array (1..M, 1..M) of natural;
  procedure encontrar_espacio_blanco(P: in T_Puzle; F, C: out Integer);
  --pre: P tiene un espacio en blanco para una �nica ficha.
  --post: 1<=F,C<=9. F y C son las coordenadas de la esquina superior izquierda del sudoku donde se encuentra su espacio en blanco
  procedure rotar_matriz_derecha_90 (F: in out T_Ficha);
  --post: F contiene la ficha de la entrada rotada 90� a la derecha
  function filas_correctas (P: in T_Puzle; Ficha: in T_Ficha; F, C: in Integer) return Boolean;
  --Pre: Los n�meros ya colocados en el sudoku son correctos. La ficha est� a�n sin colocar. El sudoku tiene un �nico espacio en blanco para una ficha
  --post: El resultado es true sii las filas de P cumplen los requisitos de las filas una vez a�adida la ficha F en el espacio cuya esquina superior izquierda es la fila F y la columna C (y 2 siguientes).
end Laboratorio07b;

