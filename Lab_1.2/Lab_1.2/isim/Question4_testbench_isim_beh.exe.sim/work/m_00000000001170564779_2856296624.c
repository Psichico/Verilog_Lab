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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/n input = %b,  output = %h ";
static const char *ng1 = "A:/Cloud/Git/Verilog_Lab/Lab_1.2/Lab_1.2/Question4.v";

void Monitor_18_1(char *);
void Monitor_18_1(char *);


static void Monitor_18_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 1048U);
    t2 = *((char **)t1);
    t1 = (t0 + 1208U);
    t3 = *((char **)t1);
    xsi_vlogfile_write(1, 0, 3, ng0, 3, t0, (char)118, t2, 16, (char)118, t3, 4);

LAB1:    return;
}

static void Initial_17_0(char *t0)
{

LAB0:    xsi_set_current_line(17, ng1);

LAB2:    xsi_set_current_line(18, ng1);
    Monitor_18_1(t0);

LAB1:    return;
}

void Monitor_18_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 2584);
    t2 = (t0 + 3096);
    xsi_vlogfile_monitor((void *)Monitor_18_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000001170564779_2856296624_init()
{
	static char *pe[] = {(void *)Initial_17_0,(void *)Monitor_18_1};
	xsi_register_didat("work_m_00000000001170564779_2856296624", "isim/Question4_testbench_isim_beh.exe.sim/work/m_00000000001170564779_2856296624.didat");
	xsi_register_executes(pe);
}
