--  module_commande.vhd
--  D. Dalle  30 avril 2019, 16 janv 2020, 23 avril 2020
--  module qui permet de r�unir toutes les commandes (problematique circuit sequentiels)
--  recues des boutons, avec conditionnement, et des interrupteurs

-- 23 avril 2020 elimination constante mode_seq_bouton: std_logic := '0'

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-------------------------------------------------------------------
entity module_commande IS
generic (nbtn : integer := 4;  mode_simulation: std_logic := '0');
    PORT (
          clk              : in  std_logic;
          o_reset          : out  std_logic; 
          i_btn            : in  std_logic_vector (nbtn-1 downto 0); -- signaux directs des boutons
          i_sw             : in  std_logic_vector (3 downto 0);      -- signaux directs des interrupteurs
          o_btn_cd         : out std_logic_vector (nbtn-1 downto 0); -- signaux conditionn�s 
          o_selection_fct  :  out std_logic_vector(1 downto 0);
          o_selection_par  :  out std_logic_vector(1 downto 0)
          );
end module_commande;

------------------------------------------------------------------------------

ARCHITECTURE BEHAVIOR OF module_commande IS


component conditionne_btn_v7 is
generic (nbtn : integer := nbtn;  mode_simul: std_logic := '0');
    port (
         CLK          : in std_logic;         -- devrait etre de l ordre de 50 Mhz
         i_btn        : in    std_logic_vector (nbtn-1 downto 0);
         --
         o_btn_db     : out    std_logic_vector (nbtn-1 downto 0);
         o_strobe_btn : out    std_logic_vector (nbtn-1 downto 0)
         );
end component;

    signal d_strobe_btn :    std_logic_vector (nbtn-1 downto 0);
    signal d_btn_cd     :    std_logic_vector (nbtn-1 downto 0); 
    signal d_reset      :    std_logic;

----------AVEC BOUTONS ----------------------
   type etat_type is (E0,E1,E2,E3);
   signal etat_actuel, next_etat : etat_type;
   
BEGIN
------------- AVEC SWITCH --------------------
                  
 inst_cond_btn:  conditionne_btn_v7
    generic map (nbtn => nbtn, mode_simul => mode_simulation)
    port map(
        clk           => clk,
        i_btn         => i_btn,
        o_btn_db      => d_btn_cd,
        o_strobe_btn  => d_strobe_btn  
         );
 
 process(clk)
 begin
    if(rising_edge(clk)) then
        o_reset <= d_reset;
    end if;
 end process;
 
 --------------ASSIGANTION DES SIGNAUX--------------------
  --o_btn_cd        <= d_strobe_btn;
  --o_selection_par <= d_btn_cd(2); -- mode de selection du parametre par sw
  --o_selection_fct <= d_btn_cd(1 downto 0); -- mode de selection de la fonction par sw
  d_reset         <= d_strobe_btn(3);         -- pas de contionnement particulier sur reset

-------------------AVEC BOUTON-------------------------

-------------MEF----------------

   SYNC_PROC: process (CLK, d_reset)
   begin
     if (d_reset = '1') then
            etat_actuel <= E0;
     else
            if(rising_edge(clk)) then
                    etat_actuel <= next_etat;
            end if;
      end if;
   end process;


   OUTPUT_DECODE: process (etat_actuel)
   begin

      if etat_actuel = E0 then
         o_selection_fct <= "00";
      elsif etat_actuel = E1 then
         o_selection_fct <= "01";
      elsif etat_actuel = E2 then
         o_selection_fct <= "10";
      elsif etat_actuel = E3 then
         o_selection_fct <= "11"; 
         
      else 
         o_selection_fct <= "00";     
      end if;
   end process;

   NEXT_STATE_DECODE: process (etat_actuel, i_btn,d_strobe_btn )
   begin
       next_etat <= etat_actuel;
      case (etat_actuel) is
         when E0 =>
            if d_strobe_btn(0) = '1' then
               next_etat <= E3;
            elsif d_strobe_btn(1) = '1' then
               next_etat <= E1;
            end if;
            
         when E1 =>
            if d_strobe_btn(0) = '1' then
               next_etat <= E0;
            elsif d_strobe_btn(1) = '1' then
               next_etat <= E2;
            end if;
            
         when E2 =>
            if d_strobe_btn(0) = '1' then
               next_etat <= E1;
            elsif d_strobe_btn(1) = '1' then
               next_etat <= E3;
            end if;
            
         when E3 =>
            if d_strobe_btn(0) = '1' then
               next_etat <= E2;
            elsif d_strobe_btn(1) = '1' then
               next_etat <= E0;
            end if;
            
         when others =>
            next_etat <= E0;       
          
      end case;
   end process;


END BEHAVIOR;
