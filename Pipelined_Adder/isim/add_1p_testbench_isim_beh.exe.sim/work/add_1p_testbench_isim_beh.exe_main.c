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
    work_m_00000000002305509540_1249343090_init();
    work_m_00000000002650639277_1441221746_init();
    work_m_00000000002650639277_0062778356_init();
    work_m_00000000002305509540_2532142642_init();
    work_m_00000000002650639277_3531559101_init();
    work_m_00000000003198256226_1019187512_init();
    work_m_00000000000908744712_3824924796_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000908744712_3824924796");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
