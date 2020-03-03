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
static const char *ng0 = "X=%d, Y=%d, sum=%d";
static const char *ng1 = "A:/Cloud/Git/Verilog_Lab/Pipelined_Adder/testbench.v";
static const char *ng2 = "dump.vcd";
static int ng3[] = {0, 0};
static unsigned int ng4[] = {10U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {1001U, 0U};
static unsigned int ng7[] = {15383U, 0U};
static unsigned int ng8[] = {15402U, 0U};
static unsigned int ng9[] = {16003U, 0U};
static unsigned int ng10[] = {1023U, 0U};

void Monitor_12_2(char *);
void Monitor_12_2(char *);


static void Monitor_12_2_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 1448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    xsi_vlogfile_write(1, 0, 3, ng0, 4, t0, (char)118, t3, 15, (char)118, t6, 15, (char)118, t8, 15);

LAB1:    return;
}

static void Always_9_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(9, ng1);
    t2 = (t0 + 2496);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(9, ng1);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_11_1(char *t0)
{

LAB0:    xsi_set_current_line(11, ng1);

LAB2:    xsi_set_current_line(12, ng1);
    Monitor_12_2(t0);

LAB1:    return;
}

static void Initial_15_3(char *t0)
{

LAB0:    xsi_set_current_line(15, ng1);

LAB2:    xsi_set_current_line(16, ng1);
    xsi_vcd_dumpfile(ng2);
    xsi_set_current_line(17, ng1);
    xsi_vcd_dumpvars(t0);

LAB1:    return;
}

static void Initial_20_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(20, ng1);

LAB4:    xsi_set_current_line(21, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(22, ng1);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(23, ng1);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(24, ng1);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(25, ng1);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(26, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(27, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(28, ng1);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(29, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(30, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(31, ng1);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(32, ng1);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(33, ng1);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 15);
    xsi_set_current_line(34, ng1);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, 1000000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(35, ng1);
    xsi_vlog_finish(1);
    goto LAB1;

}

void Monitor_12_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 3488);
    t2 = (t0 + 4000);
    xsi_vlogfile_monitor((void *)Monitor_12_2_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000000908744712_3824924796_init()
{
	static char *pe[] = {(void *)Always_9_0,(void *)Initial_11_1,(void *)Initial_15_3,(void *)Initial_20_4,(void *)Monitor_12_2};
	xsi_register_didat("work_m_00000000000908744712_3824924796", "isim/add_1p_testbench_isim_beh.exe.sim/work/m_00000000000908744712_3824924796.didat");
	xsi_register_executes(pe);
}
