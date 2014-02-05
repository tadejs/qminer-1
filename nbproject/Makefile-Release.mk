#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include qminer-Makefile.mk

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/qminer/qminer_aggr.o \
	${OBJECTDIR}/src/qminer/qminer_core.o \
	${OBJECTDIR}/src/qminer/qminer_ftr.o \
	${OBJECTDIR}/src/qminer/qminer_gs.o \
	${OBJECTDIR}/src/qminer/qminer_gs_srv.o \
	${OBJECTDIR}/src/qminer/qminer_js.o \
	${OBJECTDIR}/src/qminer/qminer_op.o \
	${OBJECTDIR}/src/qminer/qminer_srv.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a

${OBJECTDIR}/src/qminer/qminer_aggr.o: src/qminer/qminer_aggr.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_aggr.o src/qminer/qminer_aggr.cpp

${OBJECTDIR}/src/qminer/qminer_core.o: src/qminer/qminer_core.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_core.o src/qminer/qminer_core.cpp

${OBJECTDIR}/src/qminer/qminer_ftr.o: src/qminer/qminer_ftr.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_ftr.o src/qminer/qminer_ftr.cpp

${OBJECTDIR}/src/qminer/qminer_gs.o: src/qminer/qminer_gs.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_gs.o src/qminer/qminer_gs.cpp

${OBJECTDIR}/src/qminer/qminer_gs_srv.o: src/qminer/qminer_gs_srv.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_gs_srv.o src/qminer/qminer_gs_srv.cpp

${OBJECTDIR}/src/qminer/qminer_js.o: src/qminer/qminer_js.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_js.o src/qminer/qminer_js.cpp

${OBJECTDIR}/src/qminer/qminer_op.o: src/qminer/qminer_op.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_op.o src/qminer/qminer_op.cpp

${OBJECTDIR}/src/qminer/qminer_srv.o: src/qminer/qminer_srv.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/qminer
	${RM} $@.d
	$(COMPILE.cc) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/qminer/qminer_srv.o src/qminer/qminer_srv.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libqminer.a

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
