#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-prod.mk)" "nbproject/Makefile-local-prod.mk"
include nbproject/Makefile-local-prod.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=prod
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c main.c i2c.c i2c_async.c eeprom.c eeprom_async.c pod.c pod_manager.c pod_manager_async.c relay_pwm_manager.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/main.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/i2c_async.o ${OBJECTDIR}/eeprom.o ${OBJECTDIR}/eeprom_async.o ${OBJECTDIR}/pod.o ${OBJECTDIR}/pod_manager.o ${OBJECTDIR}/pod_manager_async.o ${OBJECTDIR}/relay_pwm_manager.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/i2c.o.d ${OBJECTDIR}/i2c_async.o.d ${OBJECTDIR}/eeprom.o.d ${OBJECTDIR}/eeprom_async.o.d ${OBJECTDIR}/pod.o.d ${OBJECTDIR}/pod_manager.o.d ${OBJECTDIR}/pod_manager_async.o.d ${OBJECTDIR}/relay_pwm_manager.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/main.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/i2c_async.o ${OBJECTDIR}/eeprom.o ${OBJECTDIR}/eeprom_async.o ${OBJECTDIR}/pod.o ${OBJECTDIR}/pod_manager.o ${OBJECTDIR}/pod_manager_async.o ${OBJECTDIR}/relay_pwm_manager.o

# Source Files
SOURCEFILES=mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c main.c i2c.c i2c_async.c eeprom.c eeprom_async.c pod.c pod_manager.c pod_manager_async.c relay_pwm_manager.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-prod.mk ${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GL306
MP_LINKER_FILE_OPTION=,--script=p24FJ128GL306.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/prod/201f36605529927da0ac49174a9fcd632e049137 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/prod/f34c74434c96a16c43679d3d0702fe6f2cac80bf .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/prod/ca213f1240829c8e46d81c0975e7c7c77bf87af2 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/prod/21d424bc1ec49cb69ff3d3d5858a4a3e6de99743 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/prod/e560b3fb29afcd33100635da06941a6ea9e72b0 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/prod/9f3f5624328e08fa1cc4db0a9129acdd488c701a .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/prod/13486be8683c89ca54243f85008768a42742c7ca .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/prod/9756962cd01d56e81c069b38243972fb9cbead5d .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c_async.o: i2c_async.c  .generated_files/flags/prod/70c49ee0c4155668762e770fa9ebb2004ffdbc5b .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_async.o.d 
	@${RM} ${OBJECTDIR}/i2c_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c_async.c  -o ${OBJECTDIR}/i2c_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c_async.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/eeprom.o: eeprom.c  .generated_files/flags/prod/9ab66de43cebd2f19c4cdf16375217cc27b7ba21 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom.o.d 
	@${RM} ${OBJECTDIR}/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom.c  -o ${OBJECTDIR}/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/eeprom.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/eeprom_async.o: eeprom_async.c  .generated_files/flags/prod/c95034bce2b1cf1456cc58c86f7f1bd2d231ba69 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom_async.o.d 
	@${RM} ${OBJECTDIR}/eeprom_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom_async.c  -o ${OBJECTDIR}/eeprom_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/eeprom_async.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod.o: pod.c  .generated_files/flags/prod/2fdb9e4e2585c6da78e01e0cb81bd05db075a85c .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod.o.d 
	@${RM} ${OBJECTDIR}/pod.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod.c  -o ${OBJECTDIR}/pod.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod_manager.o: pod_manager.c  .generated_files/flags/prod/5198c79d800d72982a00d0684c8c1d298225799e .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod_manager.o.d 
	@${RM} ${OBJECTDIR}/pod_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod_manager.c  -o ${OBJECTDIR}/pod_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod_manager_async.o: pod_manager_async.c  .generated_files/flags/prod/80695de1dd17b9ad78fa23e636fefa6453d9d4e3 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod_manager_async.o.d 
	@${RM} ${OBJECTDIR}/pod_manager_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod_manager_async.c  -o ${OBJECTDIR}/pod_manager_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod_manager_async.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/relay_pwm_manager.o: relay_pwm_manager.c  .generated_files/flags/prod/c7558190f10c58153f0535c5d9fa6290956637e2 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/relay_pwm_manager.o.d 
	@${RM} ${OBJECTDIR}/relay_pwm_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  relay_pwm_manager.c  -o ${OBJECTDIR}/relay_pwm_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/relay_pwm_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/prod/a360475af5556a335143da5215a561981ef801be .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/prod/9b1001e8bd2684cf5ffe559df416d7eb7f773f43 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/prod/9167cd7d0de278af843a71e7ad897e713972a1ae .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/prod/b838e8e0ab38c528eb87e598e340c26c036643a2 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/prod/a445cdd25af086fcdd4f364f7b20d661dd2ee3 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/prod/e0157c09b0ac9add20b4f269899db3bcacbc9403 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/prod/3ff1d67bdcd5553b18b4482f46d3172636480468 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/prod/2cd29876a54e66ad6d44573e23491dac5ab3b2cc .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c_async.o: i2c_async.c  .generated_files/flags/prod/3d6a04a5bf8c0f59b4a5ba862f8ce463694bad51 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_async.o.d 
	@${RM} ${OBJECTDIR}/i2c_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c_async.c  -o ${OBJECTDIR}/i2c_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c_async.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/eeprom.o: eeprom.c  .generated_files/flags/prod/6c7a89f983aa332992bbd14233b70a5275aedd91 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom.o.d 
	@${RM} ${OBJECTDIR}/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom.c  -o ${OBJECTDIR}/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/eeprom.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/eeprom_async.o: eeprom_async.c  .generated_files/flags/prod/c77866f206261b5bf3f05da3f30e57788f2501c4 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom_async.o.d 
	@${RM} ${OBJECTDIR}/eeprom_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom_async.c  -o ${OBJECTDIR}/eeprom_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/eeprom_async.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod.o: pod.c  .generated_files/flags/prod/8351b6448a32fb1dc26eba15b21ac5c32a50bb3e .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod.o.d 
	@${RM} ${OBJECTDIR}/pod.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod.c  -o ${OBJECTDIR}/pod.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod_manager.o: pod_manager.c  .generated_files/flags/prod/7ae770564b0fd87d9c658591ae97d51df20fd37b .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod_manager.o.d 
	@${RM} ${OBJECTDIR}/pod_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod_manager.c  -o ${OBJECTDIR}/pod_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pod_manager_async.o: pod_manager_async.c  .generated_files/flags/prod/f8c88c793a6fbffb3c3f872354228b9082cedbfd .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pod_manager_async.o.d 
	@${RM} ${OBJECTDIR}/pod_manager_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pod_manager_async.c  -o ${OBJECTDIR}/pod_manager_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pod_manager_async.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/relay_pwm_manager.o: relay_pwm_manager.c  .generated_files/flags/prod/9c42ae4a9467e13ca6ab93a677bc5c74a0e04346 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/relay_pwm_manager.o.d 
	@${RM} ${OBJECTDIR}/relay_pwm_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  relay_pwm_manager.c  -o ${OBJECTDIR}/relay_pwm_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/relay_pwm_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/prod/eaccb48a11010c456e3c279e346685c9dc06d3c0 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_prod=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/prod/edeec56a892b627f54a1f3165a67856a606fde73 .generated_files/flags/prod/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_prod=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_prod=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/i2c_test3.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
