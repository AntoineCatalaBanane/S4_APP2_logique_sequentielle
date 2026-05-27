---------------------------------------------------------------------------------------------
-- circuit mef_decod_i2s_v1b.vhd                   Version mise en oeuvre avec des compteurs
---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 1.0
-- Nomenclature    : 0.8 GRAMS
-- Date            : 7 mai 2019
-- Auteur(s)       : Daniel Dalle
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--
-- Outils          : vivado 2019.1
---------------------------------------------------------------------------------------------
-- Description:
-- MEF pour decodeur I2S version 1b
-- La MEF est substituee par un compteur
--
-- notes
-- frequences (peuvent varier un peu selon les contraintes de mise en oeuvre)
-- i_lrc        ~ 48.    KHz    (~ 20.8    us)
-- d_ac_mclk,   ~ 12.288 MHz    (~ 80,715  ns) (non utilisee dans le codeur)
-- i_bclk       ~ 3,10   MHz    (~ 322,857 ns) freq mclk/4
-- La dur�e d'une p�riode reclrc est de 64,5 p�riodes de bclk ...
--
-- Revision  
-- Revision 14 mai 2019 (version ..._v1b) composants dans entit�s et fichiers distincts
---------------------------------------------------------------------------------------------
-- � faire :
--
--
---------------------------------------------------------------------------------------------

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity mef_decod_i2s_v1b is

   Port ( 

      i_bclk           : in  std_logic;

      i_reset          : in  std_logic; 

      i_lrc            : in  std_logic;

      i_cpt_bits       : in  std_logic_vector(6 downto 0);

      o_bit_enable     : out std_logic;

      o_load_left      : out std_logic;

      o_load_right     : out std_logic;

      o_str_dat        : out std_logic;

      o_cpt_bit_reset  : out std_logic

   );

end mef_decod_i2s_v1b;
 
architecture Behavioral of mef_decod_i2s_v1b is
 
   -- Etats de la FSM Moore

   type state_type is (

      st1_left_receive,   -- reception bits canal gauche

      st2_load_left,      -- chargement registre gauche (1 cycle)

      st3_right_receive,  -- reception bits canal droit

      st4_load_right,     -- chargement registre droit (1 cycle)

      st5_str_dat         -- strobe donnees valides (1 cycle)

   );

   signal state, next_state : state_type;
 
   -- Signaux internes pour toutes les sorties (Moore)

   signal o_bit_enable_i    : std_logic;

   signal o_load_left_i     : std_logic;

   signal o_load_right_i    : std_logic;

   signal o_str_dat_i       : std_logic;

   signal o_cpt_bit_reset_i : std_logic;
 
begin
 
   -- ============================================================

   -- SYNC_PROC : registres d'etat et de sorties

   -- ============================================================

   SYNC_PROC: process (i_bclk)

   begin

      if (i_bclk'event and i_bclk = '1') then

         if (i_reset = '1') then

            state            <= st1_left_receive;

            o_bit_enable     <= '0';

            o_load_left      <= '0';

            o_load_right     <= '0';

            o_str_dat        <= '0';

            o_cpt_bit_reset  <= '1';

         else

            state            <= next_state;

            o_bit_enable     <= o_bit_enable_i;

            o_load_left      <= o_load_left_i;

            o_load_right     <= o_load_right_i;

            o_str_dat        <= o_str_dat_i;

            o_cpt_bit_reset  <= o_cpt_bit_reset_i;

         end if;

      end if;

   end process;
 
   -- ============================================================

   -- OUTPUT_DECODE : sorties basees sur l'etat seulement (Moore)

   -- ============================================================

   OUTPUT_DECODE: process (state)

   begin

      -- valeurs par defaut pour eviter les latches

      o_bit_enable_i    <= '0';

      o_load_left_i     <= '0';

      o_load_right_i    <= '0';

      o_str_dat_i       <= '0';

      o_cpt_bit_reset_i <= '0';
 
      case (state) is

         when st1_left_receive =>

            o_bit_enable_i    <= '1';

            o_cpt_bit_reset_i <= '0';
 
         when st2_load_left =>

            o_load_left_i     <= '1';

            o_cpt_bit_reset_i <= '1';
 
         when st3_right_receive =>

            o_bit_enable_i    <= '1';

            o_cpt_bit_reset_i <= '0';
 
         when st4_load_right =>

            o_load_right_i    <= '1';

            o_cpt_bit_reset_i <= '1';
 
         when st5_str_dat =>

            o_str_dat_i       <= '1';

            o_cpt_bit_reset_i <= '1';
 
         when others =>

            null;

      end case;

   end process;
 
   -- ============================================================

   -- NEXT_STATE_DECODE : transitions basees sur etat + entrees

   -- ============================================================

   NEXT_STATE_DECODE: process (state, i_lrc, i_cpt_bits)

   begin

      next_state <= state;  -- defaut : rester dans l'etat courant
 
      case (state) is
 
         when st1_left_receive =>

            if i_cpt_bits = 24 then

               next_state <= st2_load_left;    -- assez de bits, charger

            elsif i_lrc = '0' then

               next_state <= st3_right_receive; -- lrc tombe, passer au canal droit

            end if;
 
         when st2_load_left =>

            next_state <= st3_right_receive;    -- load dure 1 cycle puis on passe
 
         when st3_right_receive =>

            if i_cpt_bits = 24 then

               next_state <= st4_load_right;    -- assez de bits, charger

            elsif i_lrc = '1' then

               next_state <= st5_str_dat;       -- lrc remonte, passer au strobe

            end if;
 
         when st4_load_right =>

            next_state <= st5_str_dat;          -- load dure 1 cycle puis strobe
 
         when st5_str_dat =>

            next_state <= st1_left_receive;     -- strobe dure 1 cycle puis recommencer
 
         when others =>

            next_state <= st1_left_receive;
 
      end case;

   end process;
 
end Behavioral;
 