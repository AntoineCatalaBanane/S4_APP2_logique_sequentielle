
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

---------------------------------------------------------------------------------
-- Signaux
----------------------------------------------------------------------------------
    

---------------------------------------------------------------------------------------------
--    Description comportementale
---------------------------------------------------------------------------------------------
begin 

type state_type is (st1_<name_state>, st2_<name_state>, ...);
   signal state, next_state : state_type;
   --Declare internal signals for all outputs of the state-machine
   signal <output>_i : std_logic;  -- example output signal
   --other outputs

--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (<clock>)
   begin
      if (<clock>'event and <clock> = '1') then
         if (<reset> = '1') then
            state <= st1_<name_state>;
            <output> <= '0';
         else
            state <= next_state;
            <output> <= <output>_i;
         -- assign other outputs to internal signals
         end if;
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = st3_<name> then
         <output>_i <= '1';
      else
         <output>_i <= '0';
      end if;
   end process;

   NEXT_STATE_DECODE: process (state, <input1>, <input2>, ...)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when st1_<name> =>
            if <input_1> = '1' then
               next_state <= st2_<name>;
            end if;
         when st2_<name> =>
            if <input_2> = '1' then
               next_state <= st3_<name>;
            end if;
         when st3_<name> =>
            next_state <= st1_<name>;
         when others =>
            next_state <= st1_<name>;
      end case;
   end process;

     o_param <= x"01";    -- temporaire ...
 
end Behavioral;
