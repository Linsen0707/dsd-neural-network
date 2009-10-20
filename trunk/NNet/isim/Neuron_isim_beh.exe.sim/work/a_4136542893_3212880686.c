/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0xf1e83c0a */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/karantza/Desktop/dsd-nn/Neuron.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3620187407(char *, char *, char *, char *, char *, char *);


static void work_a_4136542893_3212880686_p_0(char *t0)
{
    char t8[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 3032);
    t3 = (t0 + 1976);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 2976U);
    t3 = (t0 + 592U);
    t4 = *((char **)t3);
    t3 = (t0 + 2912U);
    t5 = ieee_p_3620187407_sub_767668596_3620187407(IEEE_P_3620187407, t8, t2, t1, t4, t3);
    t6 = (t0 + 1976);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    memcpy(t11, t5, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 2976U);
    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 2928U);
    t5 = ieee_p_3620187407_sub_767668596_3620187407(IEEE_P_3620187407, t8, t2, t1, t4, t3);
    t6 = (t0 + 1976);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    memcpy(t11, t5, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 2976U);
    t3 = (t0 + 776U);
    t4 = *((char **)t3);
    t3 = (t0 + 2944U);
    t5 = ieee_p_3620187407_sub_767668596_3620187407(IEEE_P_3620187407, t8, t2, t1, t4, t3);
    t6 = (t0 + 1976);
    t7 = (t6 + 32U);
    t9 = *((char **)t7);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    memcpy(t11, t5, 8U);
    xsi_driver_first_trans_fast(t6);
    t1 = (t0 + 1924);
    *((int *)t1) = 1;

LAB1:    return;
}

static void work_a_4136542893_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 2012);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 1932);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4136542893_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4136542893_3212880686_p_0,(void *)work_a_4136542893_3212880686_p_1};
	xsi_register_didat("work_a_4136542893_3212880686", "isim/Neuron_isim_beh.exe.sim/work/a_4136542893_3212880686.didat");
	xsi_register_executes(pe);
}
