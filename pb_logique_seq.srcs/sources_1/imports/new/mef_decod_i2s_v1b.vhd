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
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- pour les additions dans les compteurs

entity mef_decod_i2s_v1b is
   Port ( 
   i_bclk      : in std_logic;
   i_reset     : in    std_logic; 
   i_lrc       : in std_logic;
   i_cpt_bits  : in std_logic_vector(6 downto 0);
 --  
   o_bit_enable     : out std_logic ;  --
   o_load_left      : out std_logic ;  --
   o_load_right     : out std_logic ;  --
   o_str_dat        : out std_logic ;  --  
   o_cpt_bit_reset  : out std_logic   -- 
   
);
end mef_decod_i2s_v1b;

architecture Behavioral of mef_decod_i2s_v1b is

    signal   d_reclrc_prec  : std_logic ;  --
    
   type state_type is (st1_left, st2_right);
   signal state, next_state : state_type;


begin


--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (i_bclk,i_reset)
   begin
         if (i_reset = '1') then
            state <= st1_left;
         elsif (i_bclk' event and i_bclk = '1') then
            state <= next_state;

         end if;
   end process;

   OUTPUT_DECODE: process (state, i_lrc, i_cpt_bits)
   begin
   o_load_right    <= '0';
   o_load_left     <= '0';
   o_bit_enable    <= '0';
   o_cpt_bit_reset <= '0';
   o_str_dat       <= '0';
   
   
    case (state) is
      when st1_left =>
           if i_lrc = '1' then
              o_bit_enable <= '1';
           elsif i_cpt_bits = 24 then
              o_load_left <= '1'; o_cpt_bit_reset <= '1';
           elsif i_lrc = '0' then
              o_cpt_bit_reset <= '1';
           else
              o_cpt_bit_reset <= '1';
           end if;
           
      when st2_right =>
           if i_lrc = '0' then
              o_bit_enable <= '1';
           elsif i_cpt_bits = 24 then
              o_load_right <= '1'; o_cpt_bit_reset <= '1';
           elsif i_lrc = '1' then
              o_cpt_bit_reset <= '1'; o_str_dat <= '1';
           else
              o_cpt_bit_reset <= '1';
           end if;
           
      when others =>
         o_cpt_bit_reset <= '1';
    end case;
   end process;

   NEXT_STATE_DECODE: process (state, i_lrc)
   begin

      next_state <= state;  --default is to stay in current state

      case (state) is
         when st1_left =>
            if i_lrc = '0' then
               next_state <= st2_right;
            end if;
         when st2_right =>
            if i_lrc = '1' then
               next_state <= st1_left;
            end if;
         when others =>
            next_state <= state;
      end case;
      
   end process;
   
end Behavioral;