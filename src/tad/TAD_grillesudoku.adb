pragma Ada_2012;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with TAD_Coordonnee; use TAD_Coordonnee;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      g : Type_Grille;
   begin
      for i in 1 .. 9 loop
         for y in 1 .. 9 loop
            g(i,y) := 0;
         end loop;
      end loop;
      return g;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      return g(obtenirLigne(c), obtenirColonne(c)) = 0;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      return g(obtenirLigne(c), obtenirColonne(c));
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      nb_chiffre : Integer;
   begin
      nb_chiffre := 0;
      for i in 1 .. 9 loop
         for y in 1 .. 9 loop
            if g(i, y) /= 0 then
               nb_chiffre := nb_chiffre + 1;
            end if;
         end loop;
      end loop;
      return nb_chiffre;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer; cpt : in out integer)
   is
   begin
      g(obtenirLigne(c), obtenirColonne(c)) := v;
      cpt := cpt + 1;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if caseVide(g,c) then
         raise VIDER_CASE_VIDE;
      end if;
      g(obtenirLigne(c), obtenirColonne(c)) := 0;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      return nombreChiffres(g) >= 81;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      e : Type_Ensemble;
      c : Type_Coordonnee;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         c := construireCoordonnees(numLigne,i);
         if not caseVide(g, c) then
            ajouterChiffre(e, obtenirChiffre(g, c));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
      c : Type_Coordonnee;
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         c := construireCoordonnees(i, numColonne);
         if not caseVide(g, c) then
            ajouterChiffre(e, obtenirChiffre(g, c));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      e : Type_Ensemble;
      coord : Type_Coordonnee;
      c : Type_Coordonnee;
      ligne : Integer;
      colonne : Integer;
   begin
      e := construireEnsemble;
      coord := obtenirCoordonneeCarre(numCarre);
      ligne :=obtenirLigne(coord);
      colonne :=obtenirColonne(coord);
      for i in ligne .. ligne+2 loop
         for y in colonne .. colonne+2 loop
            c := construireCoordonnees(i, y);
            if not caseVide(g, c) then
               ajouterChiffre(e, obtenirChiffre(g,c));
            end if;
         end loop;
      end loop;
      return e;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
