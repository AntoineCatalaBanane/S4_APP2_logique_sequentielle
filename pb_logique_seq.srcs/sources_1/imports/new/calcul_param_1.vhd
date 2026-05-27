
---------------------------------------------------------------------------------------------
--    calcul_param_1.vhd
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
--    Universit� de Sherbrooke - D�partement de GEGI
--
--    Version         : 5.0
--    Nomenclature    : inspiree de la nomenclature 0.2 GRAMS
--    Date            : 16 janvier 2020, 4 mai 2020
--    Auteur(s)       : 
--    Technologie     : ZYNQ 7000 Zybo Z7-10 (xc7z010clg400-1) 
--    Outils          : vivado 2019.1 64 bits
--
---------------------------------------------------------------------------------------------
--    Description (sur une carte Zybo)
---------------------------------------------------------------------------------------------
--
---------------------------------------------------------------------------------------------
-- � FAIRE: 
-- Voir le guide de la probl�matique
---------------------------------------------------------------------------------------------
--
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- pour les additions dans les compteurs
USE ieee.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
entity calcul_param_1 is
    Port (
    i_bclk    : in   std_logic; -- bit clock (I2S)
    i_reset   : in   std_logic;
    i_en      : in   std_logic; -- un echantillon present a l'entr�e
    i_ech     : in   std_logic_vector (23 downto 0); -- echantillon en entr�e
    o_param   : out  std_logic_vector (7 downto 0)   -- param�tre calcul�
    );
end calcul_param_1;

----------------------------------------------------------------------------------

architecture Behavioral of calcul_param_1 is
component compteur_nbits is
generic (nbits : integer := 8);
   port ( clk             : in    std_logic; 
          i_en            : in    std_logic; 
          reset           : in    std_logic; 
          o_val_cpt       : out   std_logic_vector (nbits-1 downto 0)
          );
end component;
---------------------------------------------------------------------------------
-- Signaux
----------------------------------------------------------------------------------
   type state_type is (E1_idle, E2_counter, E3_reset, E4_stock);
   signal state, next_state : state_type;
   signal last_event  : std_logic_vector(3 downto 0)  := (others => '0');  -- Dernière valeur du signal
   signal reset_count,en_count, count_ok : std_logic;
   signal count_value : std_logic_vector(7 downto 0);
   
   
   
   
  

---------------------------------------------------------------------------------------------
--    Description comportementale
---------------------------------------------------------------------------------------------
begin
inst_compteur : compteur_nbits
generic map (nbits => 8)

port map(     
clk   =>   i_bclk,        
i_en  =>    en_count,      
reset  =>     reset_count,    
o_val_cpt =>    count_value
);

        
    
   SYNC_PROC: process (i_bclk)
   begin
      if (i_bclk'event and i_bclk = '1') then
         if (i_reset = '1') then
            state <= E3_reset;
            o_param <= (others => '0');
            elsif count_ok = '1' then
                state <= next_state;
                
                if state = E2_counter then
                          
                          last_event(0) <= last_event(1);
                          last_event(1) <= last_event(2);
                          last_event(2) <= last_event(3);
                          last_event(3) <= i_ech(23);
                          if last_event = "0011" then 
                            counter_reg <= counter_reg + 1;
                            
                    end if;        
                    end if;
                    
    
        
         -- assign other outputs to internal signals
         end if;
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = E1_idle then
         en_count <= '0';
         reset_count <= '1';
         count_ok <= '0';
         
      elsif state = E2_counter then
         en_count <= '1';
         reset_count <= '0';
         count_ok <= '0';
         
      elsif state = E3_reset then
         en_count <= '0';
         reset_count <= '1';
         count_ok <= '0';
      elsif state = E4_stock then
        count_ok <= '1';
        o_param <= count_value;
        en_count <= '0';
        reset_count <= '0';
      else
         en_count <= '0';
         reset_count <= '0';
         count_ok <= '0';
      end if;
      
end process;

   NEXT_STATE_DECODE: process (state, last_event)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when E1_idle =>
            if last_event = "0011" then
               next_state <= E2_counter;
            end if;
         when E2_counter =>
            if last_event = "0011" then
               next_state <= E4_stock;
            end if;
         when E3_reset =>
            next_state <= E1_idle;
         when E4_stock =>
            next_state <= E1_idle;
         when others =>
            next_state <= E1_idle;
      end case;
   end process;

     
    


     --o_param <= x"01";    -- temporaire ...
 
end Behavioral;
