#pragma GCC diagnostic ignored "-Wdeprecated-declarations" 
#include "xsim.dir/simul_module_sig_tb_behav/obj/sysc_interface.h"
#include <map>
#include <list>


extern "C" { std::vector<void*> *_glb_hdl_sc_channel_map; } 



extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bv_1(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<1, sc_dt::sc_bv<1> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_uint_1(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<1, sc_dt::sc_uint<1> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_bigint_1(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<1, sc_dt::sc_bigint<1> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_biguint_1(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<1, sc_dt::sc_biguint<1> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bv_2(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<2, sc_dt::sc_bv<2> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_uint_2(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<2, sc_dt::sc_uint<2> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_bigint_2(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<2, sc_dt::sc_bigint<2> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_biguint_2(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<2, sc_dt::sc_biguint<2> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bv_8(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<8, sc_dt::sc_bv<8> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_uint_8(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<8, sc_dt::sc_uint<8> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_bigint_8(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<8, sc_dt::sc_bigint<8> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_biguint_8(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<8, sc_dt::sc_biguint<8> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bv_24(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<24, sc_dt::sc_bv<24> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_uint_24(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<24, sc_dt::sc_uint<24> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_bigint_24(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<24, sc_dt::sc_bigint<24> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_sc_biguint_24(unsigned int sc_net_index, char* pval)
    {
          ((xsim_sc_channel<24, sc_dt::sc_biguint<24> >*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(pval);
    } 


extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_int(unsigned int sc_net_index, char* pval)
    {
          int val = *((int*)(pval));
          ((xsim_sc_channel<0, int>*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(val);
    } 



extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bit(unsigned int sc_net_index, char* pval)
    {
            sc_dt::sc_bit val  =  (sc_dt::sc_bit)((*((int*)(pval)) & 0x1));
          ((xsim_sc_channel<0, sc_dt::sc_bit>*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(val);
    } 



extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_logic(unsigned int sc_net_index, char* pval)
    {
          sc_dt::sc_logic val  =  (sc_dt::sc_logic_value_t) (((*((int*)(pval)+1) & 0x1) << 1) | (*((int*)(pval)) & 0x1));
          ((xsim_sc_channel<0, sc_dt::sc_logic>*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(val);
    } 



extern "C"
__declspec(dllexport)
    void call_HDL_SC_WRITE_bool(unsigned int sc_net_index, char* pval)
    {
          bool val = *((bool*)(pval));
          ((xsim_sc_channel<0, bool>*)(*_glb_hdl_sc_channel_map)[sc_net_index])->update_from_hdl(val);
    } 



extern "C"
__declspec(dllexport)
    void implicit_HDL_SCinstantiate()
    {
        _glb_hdl_sc_channel_map = new std::vector<void*> ();
        sc_inst_1 = new design_1_xlconcat_0_0(".simul_module_sig_tb.UUT_codeur.xlconcat_0");
        sc_inst_1->xsim_set_dbg_index(31);
        sc_inst_1->xsim_set_dbg_parent_index(3);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_1_In0 = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_1->In0.bind(*p_1_In0);
        (*_glb_hdl_sc_channel_map).push_back(p_1_In0);
        p_1_In0->set_sv_net_offsetfromdp(51472);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_1_In1 = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_1->In1.bind(*p_1_In1);
        (*_glb_hdl_sc_channel_map).push_back(p_1_In1);
        p_1_In1->set_sv_net_offsetfromdp(51696);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_1_dout = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_1->dout.bind(*p_1_dout);
        p_1_dout->set_sv_netview_offsetfromdp(86184);
        p_1_dout->set_sv_net_offsetfromdp(51920);
        sc_inst_2 = new design_1_xlconcat_0_0(".simul_module_sig_tb.UUT_mod_sig.M9_codeur_i2s.xlconcat_0");
        sc_inst_2->xsim_set_dbg_index(114);
        sc_inst_2->xsim_set_dbg_parent_index(49);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_2_In0 = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_2->In0.bind(*p_2_In0);
        (*_glb_hdl_sc_channel_map).push_back(p_2_In0);
        p_2_In0->set_sv_net_offsetfromdp(63736);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_2_In1 = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_2->In1.bind(*p_2_In1);
        (*_glb_hdl_sc_channel_map).push_back(p_2_In1);
        p_2_In1->set_sv_net_offsetfromdp(63960);
        xsim_sc_channel<2, sc_dt::sc_bv<2> > *p_2_dout = new xsim_sc_channel<2, sc_dt::sc_bv<2> >();
        sc_inst_2->dout.bind(*p_2_dout);
        p_2_dout->set_sv_netview_offsetfromdp(112776);
        p_2_dout->set_sv_net_offsetfromdp(64184);
        sc_inst_3 = new design_1_xlconstant_0_1(".simul_module_sig_tb.UUT_codeur.xlconstant_0");
        sc_inst_3->xsim_set_dbg_index(32);
        sc_inst_3->xsim_set_dbg_parent_index(3);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_3_dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_3->dout.bind(*p_3_dout);
        p_3_dout->set_sv_netview_offsetfromdp(86288);
        p_3_dout->set_sv_net_offsetfromdp(52144);
        sc_inst_4 = new design_1_xlconstant_0_1(".simul_module_sig_tb.UUT_mod_sig.M9_codeur_i2s.xlconstant_0");
        sc_inst_4->xsim_set_dbg_index(115);
        sc_inst_4->xsim_set_dbg_parent_index(49);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_4_dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_4->dout.bind(*p_4_dout);
        p_4_dout->set_sv_netview_offsetfromdp(112880);
        p_4_dout->set_sv_net_offsetfromdp(64408);
        sc_inst_5 = new design_1_xlslice_0_0(".simul_module_sig_tb.UUT_codeur.xlslice_0");
        sc_inst_5->xsim_set_dbg_index(33);
        sc_inst_5->xsim_set_dbg_parent_index(3);
        xsim_sc_channel<24, sc_dt::sc_bv<24> > *p_5_Din = new xsim_sc_channel<24, sc_dt::sc_bv<24> >();
        sc_inst_5->Din.bind(*p_5_Din);
        (*_glb_hdl_sc_channel_map).push_back(p_5_Din);
        p_5_Din->set_sv_net_offsetfromdp(52408);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_5_Dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_5->Dout.bind(*p_5_Dout);
        p_5_Dout->set_sv_netview_offsetfromdp(86448);
        p_5_Dout->set_sv_net_offsetfromdp(52632);
        sc_inst_6 = new design_1_xlslice_0_0(".simul_module_sig_tb.UUT_mod_sig.M9_codeur_i2s.xlslice_0");
        sc_inst_6->xsim_set_dbg_index(116);
        sc_inst_6->xsim_set_dbg_parent_index(49);
        xsim_sc_channel<24, sc_dt::sc_bv<24> > *p_6_Din = new xsim_sc_channel<24, sc_dt::sc_bv<24> >();
        sc_inst_6->Din.bind(*p_6_Din);
        (*_glb_hdl_sc_channel_map).push_back(p_6_Din);
        p_6_Din->set_sv_net_offsetfromdp(64672);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_6_Dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_6->Dout.bind(*p_6_Dout);
        p_6_Dout->set_sv_netview_offsetfromdp(113040);
        p_6_Dout->set_sv_net_offsetfromdp(64896);
        sc_inst_7 = new design_1_xlconstant_0_2(".simul_module_sig_tb.UUT_mod_sig.M1_decodeur_i2s.xlconstant_0");
        sc_inst_7->xsim_set_dbg_index(83);
        sc_inst_7->xsim_set_dbg_parent_index(41);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_7_dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_7->dout.bind(*p_7_dout);
        p_7_dout->set_sv_netview_offsetfromdp(96656);
        p_7_dout->set_sv_net_offsetfromdp(56072);
        sc_inst_8 = new design_1_xlconstant_0_2(".simul_module_sig_tb.UUT_decodeur.xlconstant_0");
        sc_inst_8->xsim_set_dbg_index(68);
        sc_inst_8->xsim_set_dbg_parent_index(5);
        xsim_sc_channel<1, sc_dt::sc_bv<1> > *p_8_dout = new xsim_sc_channel<1, sc_dt::sc_bv<1> >();
        sc_inst_8->dout.bind(*p_8_dout);
        p_8_dout->set_sv_netview_offsetfromdp(120648);
        p_8_dout->set_sv_net_offsetfromdp(69896);
        sc_inst_9 = new design_1_xlconstant_0_3(".simul_module_sig_tb.UUT_mod_sig.M1_decodeur_i2s.xlconstant_1");
        sc_inst_9->xsim_set_dbg_index(84);
        sc_inst_9->xsim_set_dbg_parent_index(41);
        xsim_sc_channel<24, sc_dt::sc_bv<24> > *p_9_dout = new xsim_sc_channel<24, sc_dt::sc_bv<24> >();
        sc_inst_9->dout.bind(*p_9_dout);
        p_9_dout->set_sv_netview_offsetfromdp(96760);
        p_9_dout->set_sv_net_offsetfromdp(56336);
        sc_inst_10 = new design_1_xlconstant_0_3(".simul_module_sig_tb.UUT_decodeur.xlconstant_1");
        sc_inst_10->xsim_set_dbg_index(69);
        sc_inst_10->xsim_set_dbg_parent_index(5);
        xsim_sc_channel<24, sc_dt::sc_bv<24> > *p_10_dout = new xsim_sc_channel<24, sc_dt::sc_bv<24> >();
        sc_inst_10->dout.bind(*p_10_dout);
        p_10_dout->set_sv_netview_offsetfromdp(120752);
        p_10_dout->set_sv_net_offsetfromdp(70160);
        sc_inst_11 = new design_1_xlconstant_0_0(".simul_module_sig_tb.UUT_mod_sig.parametre_0");
        sc_inst_11->xsim_set_dbg_index(52);
        sc_inst_11->xsim_set_dbg_parent_index(4);
        xsim_sc_channel<8, sc_dt::sc_bv<8> > *p_11_dout = new xsim_sc_channel<8, sc_dt::sc_bv<8> >();
        sc_inst_11->dout.bind(*p_11_dout);
        p_11_dout->set_sv_netview_offsetfromdp(114040);
        p_11_dout->set_sv_net_offsetfromdp(67816);
    }


extern "C"
__declspec(dllexport)
    void implicit_HDL_SCcleanup()
    {
        delete sc_inst_1;
        delete sc_inst_2;
        delete sc_inst_3;
        delete sc_inst_4;
        delete sc_inst_5;
        delete sc_inst_6;
        delete sc_inst_7;
        delete sc_inst_8;
        delete sc_inst_9;
        delete sc_inst_10;
        delete sc_inst_11;
    }
