package TAD_ensemble is

   APPARTIENT_ENSEMBLE : exception;
   NON_APPARTIENT_ENSEMBLE : exception;

   type Type_Ensemble is private;

   -- retourne un ensemble vide
   function construireEnsemble return Type_Ensemble;

   -- retourne VRAI si l'ensemble e est vide et FAUX sinon
   function ensembleVide (e : in Type_Ensemble) return Boolean;

   -- retourne VRAI si le chiffre v est present dans l'ensemble e
   function appartientChiffre
     (e : in Type_Ensemble; v :    Integer) return Boolean;

   -- retourne le nombre d'elements de l'ensemble e
   function nombreChiffres (e : in Type_Ensemble) return Integer;

   -- ajoute le chiffre v dans l'ensemble e
   -- nécessite l'element v n'existe pas dans l'ensemble e
   -- lève l'exception APPARTIENT_ENSEMBLE si v appartient à l'ensemble
   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer);

   -- supprime le chiffre v dans l'ensemble e
   -- nécessite l'element v existe dans l'ensemble e
   -- lève l'exception NON_APPARTIENT_ENSEMBLE si v n'appartient pas à l'ensemble
   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer);

   -- Renvoie le premier chiffre de l'ensemble e au dessus (plus grand) que la valeur de la case x
   function plusGrandQueCase (x : in integer; e : in Type_Ensemble) return Integer;

   --  Renvoie  VRAI si il existe un entier dans l'ensemble e plus grand que un entier x
   --  Sinon FAUX
   function plusGrand (x : in integer; e : in Type_Ensemble) return Boolean;

private
   type Type_Ensemble is array (1 .. 9) of Boolean;

end TAD_ensemble ;
