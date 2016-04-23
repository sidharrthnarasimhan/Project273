/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002187257565_0267079761_init();
    work_m_00000000002247165219_2291517319_init();
    work_m_00000000003480662350_2447143353_init();
    work_m_00000000001984094260_0295474749_init();
    work_m_00000000001827144124_2377480360_init();
    work_m_00000000002867832169_3086354420_init();
    work_m_00000000003626905053_2765349527_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003626905053_2765349527");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
