with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Tests_Resolutions; use Tests_Resolutions;

procedure menu is
   choix: Integer;
begin
   choix:=0;
   while choix /=100 loop
      New_Line;new_line;
      put(" --------------------- "); New_Line;
      put("----- Menu Sudoku -----"); New_line;
      put(" --------------------- "); New_Line; New_Line;
      put(" --- Entrez 100 pour sortir du menu --- "); New_Line;
      put(" --- Quel Sudoku voulez-vous Tester ? --- "); New_Line;
      put(" --- Tapez un chiffre de 1 à 9 (du plus facile au plus dur) --- "); New_Line;
      get(choix); New_Line;
      case choix is
      when 1 => if test_Resolution_Grille_1 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 2 => if test_Resolution_Grille_2 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 3 => if test_Resolution_Grille_3 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 4 => if test_Resolution_Grille_4 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 5 => if test_Resolution_Grille_5 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 6 => if test_Resolution_Grille_6 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 7 => if test_Resolution_Grille_7 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 8 => if test_Resolution_Grille_8 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 9 => if test_Resolution_Grille_9 then
            put("Grille résolue");
         else
            put("/!\ Grille non résolue /!\");
         end if;
      when 100 =>
         put("Vous avez quitté le menu");
      when others =>
         put("Nombre invalide !");
      end case;
   end loop;
end menu;
