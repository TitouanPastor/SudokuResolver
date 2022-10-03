package TAD_Coordonnee is

   type Type_Coordonnee is private;

   NON_APPARTIENT_COORDONNEES: exception;
   NON_APPARTIENT_INDEX: exception;

   -- retourne la valeur d'une Coordonnee
   function construireCoordonnees
     (ligne   : Integer;
      colonne : Integer) return Type_Coordonnee;

   -- retourne le numero de la ligne dans lequel se trouve la coordonnee c
   function obtenirLigne (c : Type_Coordonnee) return Integer;

   -- retourne le numero de la colonne dans lequel se trouve la coordonnee c
   function obtenirColonne (c : Type_Coordonnee) return Integer;

   -- retourne le numero du carre dans lequel se trouve la coordonnee c
   function obtenirCarre (c : Type_Coordonnee) return Integer;

   -- retourne les coordonnees en haut a droite du carre numCarre
   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee;

   -- Convertie des coordonnÃ©es coord en index de sudoku i
   -- Nécessite c.ligne et c.colonne compris entre 1 et 9
   -- Lève l'exception NON_APPARTIENT_COORDONNEES si c.ligne et c.colonne pas compris entre 1 et 9
   function coord2index (c : in Type_Coordonnee) return Integer;

   -- Convertie un index i de sudoku en coordonnÃ©es coord
   -- Nécessite v compris entre 1 et 81
   -- Lève l'exception NON_APPARTIENT_INDEX si v pas compris entre 1 et 81
   function index2coord (v : in integer) return Type_Coordonnee;

private
   type Type_Coordonnee is record
      ligne   : Integer; -- ligne d'une coordonnée
      colonne : Integer; -- colonne d'une coordonnée
   end record;

end TAD_Coordonnee;
