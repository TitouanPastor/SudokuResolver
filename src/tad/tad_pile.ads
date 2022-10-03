with TAD_ensemble; use TAD_ensemble;
      
package TAD_pile is
   PILE_VIDE : exception; -- Excepetion si la Pile est vide
   PILE_PLEINE : exception; -- Exception si la Pile est pleine
   MAX_SIZE : constant Integer := 100; -- Taille max tu tableau
   type Pile is private;
  
   type tab_Ensemble is array (1 .. MAX_SIZE) of Type_Ensemble;
   type case_enr is record
      index : integer;
      sol_possible : tab_Ensemble;
   end record;
   
   -- Permet à crée un Type Pile 
   -- Précondition : aucune 
   -- PostConditions : Pile Vide 
   function construirePile return Pile;
   
   -- Permet d'ajouter un element e dans une pile p 
   -- leve l'execption PILE_PLEINE si la pile est pleine
   function empile (p : in Pile; e : in case_enr) return Pile;
   
   -- Permet de supprimer un élément e dans une pile p
   -- necessite une pile non vide 
   -- leve l'execption PILE_VIDE si la pile est vide 
   function depile (p : in Pile) return Pile;
   
   -- Retourne Vrai si unne pile p est vide sinon Faux
   -- Préconditions : aucune 
   -- PostConditions : aucune 
   function estvide (p : in Pile) return Boolean;
   
   -- Retourne le dernier element empile dans une pile p
   -- necessite une pile non vide
   -- leve l'exeception PILE_VIDE si la pile est vide 
   function dernier (p : in Pile) return case_enr;
   
   -- Retourne la taille de la pile p
   function taille_pile (p : in Pile) return Integer;
  

private
   type tab_enr is array (1 .. MAX_SIZE) of case_enr; 
   type Pile is record 
      pile : tab_enr;
      taille_pile : Integer;
   end record;
      

end TAD_pile;
