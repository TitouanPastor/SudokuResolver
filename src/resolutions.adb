pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
      ligne:Boolean;
      colonne:Boolean;
      carre:Boolean;
   begin
      ligne:= appartientChiffre(obtenirChiffresDUneLigne (g, obtenirLigne (c)), v);
      colonne:=appartientChiffre(obtenirChiffresDUneColonne (g, obtenirColonne (c)), v);
      carre:=appartientChiffre (obtenirChiffresDUnCarre (g, obtenirCarre (c)), v);
      if ligne or colonne or carre then
         return False;
      else
         return True;
      end if;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         if estChiffreValable (g, i, c) then
            ajouterChiffre (e, i);
         end if;
      end loop;
      return e;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if nombreChiffres (resultats) /= 1 then
         raise PLUS_DE_UN_CHIFFRE;
      end if;
      if ensembleVide (resultats) then
         raise ENSEMBLE_VIDE;
      end if;
      for i in 1 .. 9 loop
         if appartientChiffre (resultats, i) then
            return i;
         end if;
      end loop;
      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudokuV1 (g : in out Type_Grille; trouve : out Boolean; cpt : in out Integer) is
      modif  : Boolean       := True;
      c      : Type_Coordonnee;
      resolu : Boolean       := False;
      ens    : Type_Ensemble := construireEnsemble;
   begin
      while not estRemplie (g) and not resolu and modif loop
         modif := False;
         for x in 1 .. 9 loop
            for y in 1 .. 9 loop
               c := construireCoordonnees (x, y);
               if caseVide (g, c) then
                  ens := obtenirSolutionsPossibles (g, c);
                  if nombreChiffres (ens) = 1 then
                     fixerChiffre
                       (g, c, rechercherSolutionUniqueDansEnsemble (ens),cpt);
                     modif := True;
                  end if;
               end if;
               if nombreChiffres (g) = 81 then
                  resolu := True;
               end if;
            end loop;
         end loop;
      end loop;
      trouve := resolu;
   end resoudreSudokuV1;

   function rechercheEntier
     (c : in Case_vide_enr; x : in Integer) return Boolean
   is
   begin
      for i in 1 .. c.nbelements loop
         if c.tab_int (i) = x then
            return True;
         end if;
      end loop;
      return False;
   end rechercheEntier;



   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean; cpt : in out Integer) is
      index           : Integer;
      coord           : Type_Coordonnee;
      ens             : Type_Ensemble;
      p               : Pile;
      cases           : case_enr;
      Liste_case_vide : Case_vide_enr;
   begin
      trouve := False;
      ens    := construireEnsemble;
      p      := construirePile;

      index  := 1;
      resoudreSudokuV1 (g, trouve,cpt);

      while not estRemplie (g) loop
         coord := index2coord (index);
         if caseVide (g, coord) or rechercheEntier (Liste_case_vide, index)
         then
            ens := obtenirSolutionsPossibles (g, coord);
            if plusGrand (obtenirChiffre (g, coord), ens) then
               fixerChiffre
                 (g, coord, plusGrandQueCase (obtenirChiffre (g, coord), ens),cpt);
               if not rechercheEntier (Liste_case_vide, index) then
                  Liste_case_vide.nbelements := Liste_case_vide.nbelements + 1;
                  Liste_case_vide.tab_int (Liste_case_vide.nbelements) := index;
               end if;
               cases.index                              := index;
               cases.sol_possible (taille_pile (p) + 1) := ens;
               p                                        := empile (p, cases);
               index                                    := index + 1;
            else
               fixerChiffre (g, coord, 0, cpt);
               cases := dernier (p);
               index := cases.index;
               p     := depile (p);
            end if;
         else
            index := index + 1;
         end if;
      end loop;
      trouve := True;
   end resoudreSudoku;

end resolutions;
