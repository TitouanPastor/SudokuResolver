with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with TAD_pile; use TAD_pile;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package resolutions is

   TAILLE_MAX : constant integer := 81;
   type Tab_integer is array (1 .. TAILLE_MAX) of integer;

   type Case_vide_enr is record
      tab_int : Tab_integer;
      nbelements : Integer;
   end record;


   PLUS_DE_UN_CHIFFRE : exception;
   CASE_NON_VIDE : exception;
   ENSEMBLE_VIDE : exception;

   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et FAUX sinon
   -- nécessite la case c est vide
   -- lève l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffreValable
     (g : in Type_Grille;
      v :    Integer;
      c :    Type_Coordonnee) return Boolean;

   -- retourne l'ensemble des valeurs possibles pour la case c de la grille g
   -- necessite que la case c soit vide
   -- lève l'exception CASE_NON_VIDE si la case étudiée n'est pas vide
   function obtenirSolutionsPossibles
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Type_Ensemble;

   -- retourne la valeur unique de v dans le tableau resultats
   -- nécessite qu'il n'y ait qu'un seul chiffre dans resultats
   -- lève l'exception PLUS_DE_UN_CHIFFRE s'il y a plus d'un chiffre dans resultats
   -- lève l'exception ENSEMBLE_VIDE si résultat est vide
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer;

   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete
   -- sinon Trouve est a FAUX et la grille n'a aucune valeur significative
   -- parcours la grille
   procedure resoudreSudokuV1
     (g      : in out Type_Grille;
      trouve :    out Boolean;
      cpt : in out integer);

   -- Recherche un entier x dans un tableau e
   function rechercheEntier
     (c : in Case_vide_enr; x : in Integer) return Boolean;


   -- Meme version que resoudre sudoku
   -- Utilisation du back-tracking
   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean;cpt : in out Integer);



end resolutions;
