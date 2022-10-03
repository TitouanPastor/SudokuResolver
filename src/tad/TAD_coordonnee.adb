pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
package body TAD_Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
      Coor: Type_Coordonnee;
   begin
      Coor.ligne:=ligne;
      Coor.colonne:=colonne;
   return Coor;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      return c.ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      return c.colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
   begin
      return ((3* ((c.ligne-1) / 3)) + (c.colonne-1) / 3) +1 ;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
      c: Type_Coordonnee;
   begin
   case numCarre is
      when 1 =>
         c.ligne:=1;
         c.colonne:=1;
      when 2 =>
         c.ligne:=1;
         c.colonne:=4;
      when 3 =>
         c.ligne:=1;
         c.colonne:=7;
      when 4 =>
         c.ligne:=4;
         c.colonne:=1;
      when 5 =>
         c.ligne:=4;
         c.colonne:=4;
      when 6 =>
         c.ligne:=4;
         c.colonne:=7;
      when 7 =>
         c.ligne:=7;
         c.colonne:=1;
      when 8 =>
         c.ligne:=7;
         c.colonne:=4;
      when 9 =>
         c.ligne:=7;
         c.colonne:=7;
      when others =>
         Put("Il y a une erreur");
      end case;
      return c;
   end obtenirCoordonneeCarre;

   ------------------
   -- coord2index ---
   ------------------
   function coord2index (c : in Type_Coordonnee) return Integer is
   begin
      if c.ligne < 1 or c.ligne > 9 or c.colonne < 1 or c.colonne > 9 then
         raise NON_APPARTIENT_COORDONNEES;
      end if;
      return 9 * (c.ligne - 1) + c.colonne;
   end coord2index;

   ------------------
   -- index2coord --
   ------------------

   function index2coord (v : in integer) return Type_Coordonnee is
   begin
      if v < 1 or v > 81 then
         raise NON_APPARTIENT_INDEX;
      end if;
      if v mod 9 /= 0 then
         return construireCoordonnees(v / 9 + 1,v mod 9);
      else
         return construireCoordonnees(v /9, 9);
      end if;

   end index2coord;


end TAD_Coordonnee;
