
---------------------------------------------------------------------------------------------
--    calcul_param_2.vhd   (temporaire)
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
entity calcul_param_2 is
    Port (
    i_bclk    : in   std_logic;   -- bit clock
    i_reset   : in   std_logic;
    i_en      : in   std_logic;   -- un echantillon present
    i_ech     : in   std_logic_vector (23 downto 0);
    o_param   : out  std_logic_vector (7 downto 0)                                     
    );
end calcul_param_2;

----------------------------------------------------------------------------------

architecture Behavioral of calcul_param_2 is
    constant REG_WIDTH : integer := 32; -- 24 bits entrée + 8 bits croissance
---------------------------------------------------------------------------------
-- Signaux
----------------------------------------------------------------------------------
    -- MEF
    type state_type is (st1_standby, st2_reset, st3_calc);
    signal state, next_state : state_type;

    -- Intégrateur fuyant
    signal reg_y       : unsigned(REG_WIDTH - 1 downto 0);
   signal output : std_logic_vector(7 downto 0);  
  

---------------------------------------------------------------------------------------------
--    Description comportementale
---------------------------------------------------------------------------------------------
begin

    process(i_bclk, i_reset)
        variable v_alpha_y : unsigned(REG_WIDTH - 1 downto 0);
        variable v_x       : unsigned(23 downto 0);
        variable v_x2      : unsigned(47 downto 0);
    begin
        if i_reset = '1' then
            reg_y <= (others => '0');

        elsif rising_edge(i_bclk) then
            if i_en = '1' then
                v_x  := unsigned(i_ech);
                v_x2 := (others => '0');

-- x²
            for i in 0 to 23 loop 
                    if v_x(i) = '1' then
                        v_x2 := v_x2 + shift_left(resize(v_x, 48), i);
                    end if;
                end loop;

-- multiplication de alpha
                v_alpha_y := reg_y - shift_right(reg_y, 5);

                -- y[n] = alpha * y[n-1] + x[n]²
                reg_y <= v_alpha_y + resize(v_x2, REG_WIDTH);
            end if;
        end if;
    end process;

-- 8 bits de sortie
    o_param <= std_logic_vector(reg_y(REG_WIDTH - 1 downto REG_WIDTH - 8));
    




--Insert the following in the architecture after the begin keyword
--   SYNC_PROC: process (i_bclk, i_reset)
--        variable v_alpha_y : unsigned(REG_WIDTH - 1 downto 0);
--        variable v_x       : unsigned(23 downto 0);
--        variable v_x2      : unsigned(47 downto 0);
--        begin
--            if i_reset = '1' then
--                state <= st1_standby;
--                reg_y <= (others => '0');
            
--            elsif rising_edge(i_bclk) then
--                state <= next_state;
                
--                -- CALC pour state 3 --
                
--                if state = st3_calc then
--                    v_x := unsigned(i_ech);
--                    v_x2 := (others => '0');
                    
--                    --x^2
--                    for i in 0 to 23 loop
--                       if v_x(i) = '1' then
--                       v_x2 := v_x2 + shift_left(RESIZE(v_x, 48), i);
--                       end if;
--                    end loop;
--                -- calcul alpha
--               v_alpha_y := reg_y - shift_right(reg_y, 5); -- division par 32
--               -- J'ajoute la valeur X^2 avec la valeur de y
--               reg_y <= v_alpha_y + resize(v_x2, 48); 
               
--               elsif state = st2_reset then
--                    reg_y <= (others => '0');
--               end if;
--            end if;
--            end process; 
 

--   NEXT_STATE_DECODE: process (state, i_en, i_reset)
--   begin
--      --declare default state for next_state to avoid latches
--      next_state <= state;  --default is to stay in current state
--      --insert statements to decode next_state
--      --below is a simple example
--      case (state) is
--         when st1_standby =>
--            if i_reset = '1' then
--               next_state <= st2_reset;
--            elsif i_en = '1' then
--                next_state <= st3_calc;
--            end if;
--         when st2_reset =>
--            next_state <= st1_standby;
--         when st3_calc =>
--            next_state <= st1_standby;
--         when others =>
--            next_state <= st1_standby;
--      end case;
--   end process;


     o_param <= x"02";    -- temporaire ...

end Behavioral;
