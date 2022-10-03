pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;

package body TAD_ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
      ensemble : Type_Ensemble;
   begin
      for i in 1 .. 9 loop
         ensemble(i) := False;
      end loop;
      return ensemble;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
        for i in 1..9 loop
         if e(i) then
            return False;
         end if;
        end loop;
      return true;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
   is
   begin
         if e(v) then
            return true;
         else
            return false;
         end if;
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
         nb : Integer;
      begin
         nb:=0;
         for i in 1..9 loop
            if e(i) then
               nb:=nb+1;
            end if;
         end loop;
         return nb;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v) then
         raise APPARTIENT_ENSEMBLE;
      end if;
      e(v) := True;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
      begin
      if not e(v) then
         raise NON_APPARTIENT_ENSEMBLE;
      end if;
      e(v):=False;
   end retirerChiffre;

   ----------------------
   -- plusGrandQueCase --
   ----------------------

   function plusGrandQueCase (x : in integer; e : in Type_Ensemble) return Integer is
   begin
      if plusGrand(x, e) then
         for i in 1 .. 9 loop
            if e(i) then
               if i > x then
                  return i;
               end if;
            end if;
         end loop;
      end if;
      return 0;
   end plusGrandQueCase;

   ---------------
   -- plusGrand --
   ---------------

   function plusGrand (x : in integer; e : in Type_Ensemble) return Boolean is
   begin
      for i in 1 .. 9 loop
         if e(i) then
            if i > x then
               return True;
            end if;
         end if;
      end loop;
      return False;
   end plusGrand;

end TAD_ensemble;
