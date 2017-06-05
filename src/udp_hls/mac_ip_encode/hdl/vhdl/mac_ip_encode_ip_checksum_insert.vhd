-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.1
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mac_ip_encode_ip_checksum_insert is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    dataStreamBuffer0_V_dout : IN STD_LOGIC_VECTOR (72 downto 0);
    dataStreamBuffer0_V_empty_n : IN STD_LOGIC;
    dataStreamBuffer0_V_read : OUT STD_LOGIC;
    checksumFifo_V_V_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    checksumFifo_V_V_empty_n : IN STD_LOGIC;
    checksumFifo_V_V_read : OUT STD_LOGIC;
    dataStreamBuffer1_V_din : OUT STD_LOGIC_VECTOR (72 downto 0);
    dataStreamBuffer1_V_full_n : IN STD_LOGIC;
    dataStreamBuffer1_V_write : OUT STD_LOGIC );
end;


architecture behav of mac_ip_encode_ip_checksum_insert is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm0_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_ST_st2_fsm1_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_ST_st0_fsm1_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm0 : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm0_0 : STD_LOGIC;
    signal ap_sig_bdd_23 : BOOLEAN;
    signal ap_CS_fsm1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding of ap_CS_fsm1 : signal is "none";
    signal ap_sig_cseq_ST_st0_fsm1_0 : STD_LOGIC;
    signal ap_sig_bdd_34 : BOOLEAN;
    signal grp_nbreadreq_fu_94_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_nbreadreq_fu_102_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_78 : BOOLEAN;
    signal ici_wordCount_V_load_reg_305 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_2_reg_309 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_reg_313 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_reg_327 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_331 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_116 : BOOLEAN;
    signal ap_sig_cseq_ST_st2_fsm1_1 : STD_LOGIC;
    signal ap_sig_bdd_122 : BOOLEAN;
    signal ici_wordCount_V : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal reg_219 : STD_LOGIC_VECTOR (72 downto 0);
    signal p_Result_s_17_fu_254_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_s_17_reg_317 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_22_reg_322 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_reg_phiprechg_ici_wordCount_V_flag_reg_129pp0_it0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ici_wordCount_V_flag_phi_fu_132_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_phiprechg_ici_wordCount_V_new_reg_143pp0_it0 : STD_LOGIC_VECTOR (3 downto 0);
    signal ici_wordCount_V_new_phi_fu_146_p6 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_reg_phiprechg_tmp_s_reg_157pp0_it0 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_phi_fu_160_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_phiprechg_ici_wordCount_V_flag_1_reg_168pp0_it0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ici_wordCount_V_flag_1_phi_fu_171_p10 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_ici_wordCount_V_flag_fu_276_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_ici_wordCount_V_new_fu_283_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_reg_phiprechg_ici_wordCount_V_new_1_reg_188pp0_it0 : STD_LOGIC_VECTOR (3 downto 0);
    signal ici_wordCount_V_new_1_phi_fu_191_p10 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_390_fu_298_p3 : STD_LOGIC_VECTOR (72 downto 0);
    signal tmp_107_fu_242_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_s_fu_232_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Val2_2_fu_228_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_21_fu_246_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm1 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_bdd_298 : BOOLEAN;
    signal ap_sig_bdd_297 : BOOLEAN;


begin




    -- the current state (ap_CS_fsm0) of the state machine. --
    ap_CS_fsm0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm0 <= ap_ST_st1_fsm0_0;
            else
                ap_CS_fsm0 <= ap_NS_fsm0;
            end if;
        end if;
    end process;


    -- the current state (ap_CS_fsm1) of the state machine. --
    ap_CS_fsm1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm1 <= ap_ST_st0_fsm1_0;
            else
                ap_CS_fsm1 <= ap_NS_fsm1;
            end if;
        end if;
    end process;


    -- ap_done_reg assign process. --
    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))) and not((ap_const_lv1_0 = ici_wordCount_V_flag_1_phi_fu_171_p10)))) then
                ici_wordCount_V <= ici_wordCount_V_new_1_phi_fu_191_p10;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                ici_wordCount_V_load_reg_305 <= ici_wordCount_V;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                p_Result_s_17_reg_317 <= p_Result_s_17_fu_254_p5;
                tmp_22_reg_322 <= dataStreamBuffer0_V_dout(72 downto 64);
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1))))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1))))))) then
                reg_219 <= dataStreamBuffer0_V_dout;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                tmp_1_reg_327 <= grp_nbreadreq_fu_94_p3;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                tmp_2_reg_309 <= grp_nbreadreq_fu_94_p3;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                tmp_3_reg_313 <= tmp_3_nbreadreq_fu_102_p3;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                tmp_reg_331 <= grp_nbreadreq_fu_94_p3;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm0) of the state machine. --
    ap_NS_fsm0_assign_proc : process (ap_done_reg, ap_CS_fsm0, ap_sig_bdd_78, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1)
    begin
        case ap_CS_fsm0 is
            when ap_ST_st1_fsm0_0 => 
                ap_NS_fsm0 <= ap_ST_st1_fsm0_0;
            when others =>  
                ap_NS_fsm0 <= "X";
        end case;
    end process;

    -- the next state (ap_NS_fsm1) of the state machine. --
    ap_NS_fsm1_assign_proc : process (ap_done_reg, ap_sig_cseq_ST_st1_fsm0_0, ap_CS_fsm1, ap_sig_bdd_78, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1)
    begin
        case ap_CS_fsm1 is
            when ap_ST_st2_fsm1_1 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116)) and not(ap_sig_bdd_78))) then
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                elsif ((not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116)) and (not((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and ap_sig_bdd_78)))) then
                    ap_NS_fsm1 <= ap_ST_st0_fsm1_0;
                else
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                end if;
            when ap_ST_st0_fsm1_0 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                else
                    ap_NS_fsm1 <= ap_ST_st0_fsm1_0;
                end if;
            when others =>  
                ap_NS_fsm1 <= "XX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, ap_sig_cseq_ST_st0_fsm1_0)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ap_const_logic_1 = ap_sig_cseq_ST_st0_fsm1_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_done_reg, ap_sig_cseq_ST_st1_fsm0_0, ap_sig_bdd_78, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_reg_phiprechg_ici_wordCount_V_flag_1_reg_168pp0_it0 <= "X";
    ap_reg_phiprechg_ici_wordCount_V_flag_reg_129pp0_it0 <= "X";
    ap_reg_phiprechg_ici_wordCount_V_new_1_reg_188pp0_it0 <= "XXXX";
    ap_reg_phiprechg_ici_wordCount_V_new_reg_143pp0_it0 <= "XXXX";
    ap_reg_phiprechg_tmp_s_reg_157pp0_it0 <= "X";

    -- ap_sig_bdd_116 assign process. --
    ap_sig_bdd_116_assign_proc : process(dataStreamBuffer1_V_full_n, ici_wordCount_V_load_reg_305, tmp_2_reg_309, tmp_3_reg_313, tmp_1_reg_327, tmp_reg_331)
    begin
                ap_sig_bdd_116 <= (((dataStreamBuffer1_V_full_n = ap_const_logic_0) and (ap_const_lv4_1 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_2_reg_309)) and not((ap_const_lv1_0 = tmp_3_reg_313))) or ((dataStreamBuffer1_V_full_n = ap_const_logic_0) and (ap_const_lv4_0 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_1_reg_327))) or ((dataStreamBuffer1_V_full_n = ap_const_logic_0) and not((ap_const_lv4_1 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv4_0 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv1_0 = tmp_reg_331))));
    end process;


    -- ap_sig_bdd_122 assign process. --
    ap_sig_bdd_122_assign_proc : process(ap_CS_fsm1)
    begin
                ap_sig_bdd_122 <= (ap_const_lv1_1 = ap_CS_fsm1(1 downto 1));
    end process;


    -- ap_sig_bdd_23 assign process. --
    ap_sig_bdd_23_assign_proc : process(ap_CS_fsm0)
    begin
                ap_sig_bdd_23 <= (ap_CS_fsm0(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_297 assign process. --
    ap_sig_bdd_297_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3)
    begin
                ap_sig_bdd_297 <= ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)));
    end process;


    -- ap_sig_bdd_298 assign process. --
    ap_sig_bdd_298_assign_proc : process(tmp_3_nbreadreq_fu_102_p3, ici_wordCount_V)
    begin
                ap_sig_bdd_298 <= ((ici_wordCount_V = ap_const_lv4_1) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)));
    end process;


    -- ap_sig_bdd_34 assign process. --
    ap_sig_bdd_34_assign_proc : process(ap_CS_fsm1)
    begin
                ap_sig_bdd_34 <= (ap_const_lv1_1 = ap_CS_fsm1(0 downto 0));
    end process;


    -- ap_sig_bdd_78 assign process. --
    ap_sig_bdd_78_assign_proc : process(ap_start, ap_done_reg, dataStreamBuffer0_V_empty_n, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, checksumFifo_V_V_empty_n, ici_wordCount_V)
    begin
                ap_sig_bdd_78 <= (((dataStreamBuffer0_V_empty_n = ap_const_logic_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3))) or ((ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)) and (checksumFifo_V_V_empty_n = ap_const_logic_0)) or ((dataStreamBuffer0_V_empty_n = ap_const_logic_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0)) or ((dataStreamBuffer0_V_empty_n = ap_const_logic_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0))) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    -- ap_sig_cseq_ST_st0_fsm1_0 assign process. --
    ap_sig_cseq_ST_st0_fsm1_0_assign_proc : process(ap_sig_bdd_34)
    begin
        if (ap_sig_bdd_34) then 
            ap_sig_cseq_ST_st0_fsm1_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st0_fsm1_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm0_0 assign process. --
    ap_sig_cseq_ST_st1_fsm0_0_assign_proc : process(ap_sig_bdd_23)
    begin
        if (ap_sig_bdd_23) then 
            ap_sig_cseq_ST_st1_fsm0_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm0_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm1_1 assign process. --
    ap_sig_cseq_ST_st2_fsm1_1_assign_proc : process(ap_sig_bdd_122)
    begin
        if (ap_sig_bdd_122) then 
            ap_sig_cseq_ST_st2_fsm1_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm1_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- checksumFifo_V_V_read assign process. --
    checksumFifo_V_V_read_assign_proc : process(ap_done_reg, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ap_sig_bdd_78, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1, ici_wordCount_V)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))))) then 
            checksumFifo_V_V_read <= ap_const_logic_1;
        else 
            checksumFifo_V_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- dataStreamBuffer0_V_read assign process. --
    dataStreamBuffer0_V_read_assign_proc : process(ap_done_reg, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ap_sig_bdd_78, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1, ici_wordCount_V)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1))))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1))))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_78 or (ap_sig_bdd_116 and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1))))))) then 
            dataStreamBuffer0_V_read <= ap_const_logic_1;
        else 
            dataStreamBuffer0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- dataStreamBuffer1_V_din assign process. --
    dataStreamBuffer1_V_din_assign_proc : process(ap_done_reg, ici_wordCount_V_load_reg_305, tmp_2_reg_309, tmp_3_reg_313, tmp_1_reg_327, tmp_reg_331, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1, reg_219, tmp_390_fu_298_p3)
    begin
        if ((((ap_const_lv4_0 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_1_reg_327)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))) or (not((ap_const_lv4_1 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv4_0 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv1_0 = tmp_reg_331)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))))) then 
            dataStreamBuffer1_V_din <= reg_219;
        elsif (((ap_const_lv4_1 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_2_reg_309)) and not((ap_const_lv1_0 = tmp_3_reg_313)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116)))) then 
            dataStreamBuffer1_V_din <= tmp_390_fu_298_p3;
        else 
            dataStreamBuffer1_V_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    -- dataStreamBuffer1_V_write assign process. --
    dataStreamBuffer1_V_write_assign_proc : process(ap_done_reg, ici_wordCount_V_load_reg_305, tmp_2_reg_309, tmp_3_reg_313, tmp_1_reg_327, tmp_reg_331, ap_sig_bdd_116, ap_sig_cseq_ST_st2_fsm1_1)
    begin
        if ((((ap_const_lv4_1 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_2_reg_309)) and not((ap_const_lv1_0 = tmp_3_reg_313)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))) or ((ap_const_lv4_0 = ici_wordCount_V_load_reg_305) and not((ap_const_lv1_0 = tmp_1_reg_327)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))) or (not((ap_const_lv4_1 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv4_0 = ici_wordCount_V_load_reg_305)) and not((ap_const_lv1_0 = tmp_reg_331)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_done_reg = ap_const_logic_1) or ap_sig_bdd_116))))) then 
            dataStreamBuffer1_V_write <= ap_const_logic_1;
        else 
            dataStreamBuffer1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_nbreadreq_fu_94_p3 <= (0=>dataStreamBuffer0_V_empty_n, others=>'-');

    -- ici_wordCount_V_flag_1_phi_fu_171_p10 assign process. --
    ici_wordCount_V_flag_1_phi_fu_171_p10_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ici_wordCount_V, ap_reg_phiprechg_ici_wordCount_V_flag_1_reg_168pp0_it0, p_ici_wordCount_V_flag_fu_276_p2)
    begin
        if (((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (((ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3))) or (not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0)) or (not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)))))) then 
            ici_wordCount_V_flag_1_phi_fu_171_p10 <= p_ici_wordCount_V_flag_fu_276_p2;
        elsif ((((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (grp_nbreadreq_fu_94_p3 = ap_const_lv1_0) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0))) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3)) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and (grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (grp_nbreadreq_fu_94_p3 = ap_const_lv1_0) and (ici_wordCount_V = ap_const_lv4_0)))) then 
            ici_wordCount_V_flag_1_phi_fu_171_p10 <= ap_const_lv1_0;
        else 
            ici_wordCount_V_flag_1_phi_fu_171_p10 <= ap_reg_phiprechg_ici_wordCount_V_flag_1_reg_168pp0_it0;
        end if; 
    end process;


    -- ici_wordCount_V_flag_phi_fu_132_p6 assign process. --
    ici_wordCount_V_flag_phi_fu_132_p6_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ici_wordCount_V, ap_reg_phiprechg_ici_wordCount_V_flag_reg_129pp0_it0)
    begin
        if ((((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3))) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0)))) then 
            ici_wordCount_V_flag_phi_fu_132_p6 <= ap_const_lv1_1;
        elsif (((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)))) then 
            ici_wordCount_V_flag_phi_fu_132_p6 <= ap_const_lv1_0;
        else 
            ici_wordCount_V_flag_phi_fu_132_p6 <= ap_reg_phiprechg_ici_wordCount_V_flag_reg_129pp0_it0;
        end if; 
    end process;


    -- ici_wordCount_V_new_1_phi_fu_191_p10 assign process. --
    ici_wordCount_V_new_1_phi_fu_191_p10_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ici_wordCount_V, p_ici_wordCount_V_new_fu_283_p3, ap_reg_phiprechg_ici_wordCount_V_new_1_reg_188pp0_it0)
    begin
        if (((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (((ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3))) or (not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0)) or (not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0)))))) then 
            ici_wordCount_V_new_1_phi_fu_191_p10 <= p_ici_wordCount_V_new_fu_283_p3;
        else 
            ici_wordCount_V_new_1_phi_fu_191_p10 <= ap_reg_phiprechg_ici_wordCount_V_new_1_reg_188pp0_it0;
        end if; 
    end process;


    -- ici_wordCount_V_new_phi_fu_146_p6 assign process. --
    ici_wordCount_V_new_phi_fu_146_p6_assign_proc : process(ici_wordCount_V, ap_reg_phiprechg_ici_wordCount_V_new_reg_143pp0_it0, ap_sig_bdd_298, ap_sig_bdd_297)
    begin
        if (ap_sig_bdd_297) then
            if ((ici_wordCount_V = ap_const_lv4_0)) then 
                ici_wordCount_V_new_phi_fu_146_p6 <= ap_const_lv4_1;
            elsif (ap_sig_bdd_298) then 
                ici_wordCount_V_new_phi_fu_146_p6 <= ap_const_lv4_2;
            else 
                ici_wordCount_V_new_phi_fu_146_p6 <= ap_reg_phiprechg_ici_wordCount_V_new_reg_143pp0_it0;
            end if;
        else 
            ici_wordCount_V_new_phi_fu_146_p6 <= ap_reg_phiprechg_ici_wordCount_V_new_reg_143pp0_it0;
        end if; 
    end process;

    p_Result_s_17_fu_254_p5 <= (p_Val2_2_fu_228_p1(63 downto 32) & tmp_21_fu_246_p3 & p_Val2_2_fu_228_p1(15 downto 0));
    p_Result_s_fu_232_p4 <= checksumFifo_V_V_dout(15 downto 8);
    p_Val2_2_fu_228_p1 <= dataStreamBuffer0_V_dout(64 - 1 downto 0);
    p_ici_wordCount_V_flag_fu_276_p2 <= (tmp_s_phi_fu_160_p6 or ici_wordCount_V_flag_phi_fu_132_p6);
    p_ici_wordCount_V_new_fu_283_p3 <= 
        ap_const_lv4_0 when (tmp_s_phi_fu_160_p6(0) = '1') else 
        ici_wordCount_V_new_phi_fu_146_p6;
    tmp_107_fu_242_p1 <= checksumFifo_V_V_dout(8 - 1 downto 0);
    tmp_21_fu_246_p3 <= (tmp_107_fu_242_p1 & p_Result_s_fu_232_p4);
    tmp_390_fu_298_p3 <= (tmp_22_reg_322 & p_Result_s_17_reg_317);
    tmp_3_nbreadreq_fu_102_p3 <= (0=>checksumFifo_V_V_empty_n, others=>'-');

    -- tmp_s_phi_fu_160_p6 assign process. --
    tmp_s_phi_fu_160_p6_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm0_0, dataStreamBuffer0_V_dout, grp_nbreadreq_fu_94_p3, tmp_3_nbreadreq_fu_102_p3, ici_wordCount_V, ap_reg_phiprechg_tmp_s_reg_157pp0_it0)
    begin
        if ((((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ici_wordCount_V = ap_const_lv4_1)) and not((ici_wordCount_V = ap_const_lv4_0))) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (ici_wordCount_V = ap_const_lv4_1) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and not((ap_const_lv1_0 = tmp_3_nbreadreq_fu_102_p3))) or ((ap_const_logic_1 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not((grp_nbreadreq_fu_94_p3 = ap_const_lv1_0)) and (ici_wordCount_V = ap_const_lv4_0)))) then 
            tmp_s_phi_fu_160_p6 <= dataStreamBuffer0_V_dout(72 downto 72);
        else 
            tmp_s_phi_fu_160_p6 <= ap_reg_phiprechg_tmp_s_reg_157pp0_it0;
        end if; 
    end process;

end behav;