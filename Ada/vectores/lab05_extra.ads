with Laboratorio05;
use Laboratorio05;
package Lab05_Extra is
   procedure Num_Misterioso(Num:out String);
   --Post Num es el numero de 10 cifras que cumple todas las condiciones del enunciado

   procedure Incluir_Digito_Control(Tarjeta: in out T_Vector16);
   --Pre: TArjeta es un vector con los 15 primeros d�gitos definidos
   --Post: TArjeta tiene el d�gito 16 acorde a los 15 primeros

   function Es_Correcta(Tarjeta: in T_Vector16) return Boolean;
   --Pre: Tarjeta es un vector con 16 d�gitos
   --Post: REsultado = true <--> Tarjeta es un n�mero v�lido de tarjeta de cr�dito

   procedure Incluir_Digitos_IBAN(Pais: in String; BAnco, Sucursal: in Integer; Numero_Cuenta: T_Vector10;
      IBAN: out STRING);
   --Pre: Pais es el c�digo del PA�s con dos letras may�sculas: ES, FR, IT, IE, DE...
   --     Banco es un n�mero que identifica al BAnco y Sucursal a la sucursal de ese banco
   --     Numero_cuenta es un n�mero de 10 d�gitos que identifica a una cuenta en el banco indicado
   --Post: IBAN contiene los 24 caracteres que identifican en Europa a la cuenta indicada, incluyendo los d�gitos de control
end Lab05_Extra;

