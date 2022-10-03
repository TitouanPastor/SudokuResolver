package body TAD_pile is

   --------------------
   -- construirePile --
   --------------------

   function construirePile return Pile is
      p : Pile;
   begin
      p.taille_pile := 0;
      return p;
   end construirePile;

   ------------
   -- empile --
   ------------

   function empile (p : in Pile; e : in case_enr) return Pile is
      p2 : Pile := p;
   begin
      if p.taille_pile >= MAX_SIZE then
         raise PILE_PLEINE;
      end if;
      p2.pile (p.taille_pile + 1) := e;
      p2.taille_pile              := p.taille_pile + 1;
      return p2;
   end empile;

   ------------
   -- depile --
   ------------

   function depile (p : in Pile) return Pile is
      p2 : Pile := p;
   begin
        if p.taille_pile <= 0 then
         raise PILE_VIDE;
      end if;
      p2.taille_pile := p.taille_pile - 1;
      return p2;

   end depile;

   -------------
   -- estvide --
   -------------

   function estvide (p : in Pile) return Boolean is
   begin
      if p.taille_pile > 0 then
         return False;
      else
         return True;
      end if;
   end estvide;

   -------------
   -- dernier --
   -------------

   function dernier (p : in Pile) return case_enr is
   begin
      if p.taille_pile <= 0 then
         raise PILE_VIDE;
      end if;
      return p.pile (p.taille_pile);
   end dernier;

   -----------------
   -- taille_pile --
   -----------------

   function taille_pile (p : in Pile) return Integer is
   begin
      return p.taille_pile;
   end taille_pile;
end TAD_pile;
