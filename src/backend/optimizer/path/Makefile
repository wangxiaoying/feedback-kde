#-------------------------------------------------------------------------
#
# Makefile--
#    Makefile for optimizer/path
#
# IDENTIFICATION
#    src/backend/optimizer/path/Makefile
#
#-------------------------------------------------------------------------

subdir = src/backend/optimizer/path
top_builddir = ../../../..
include $(top_builddir)/src/Makefile.global

OBJS = allpaths.o clausesel.o costsize.o equivclass.o indxpath.o \
       joinpath.o joinrels.o orindxpath.o pathkeys.o tidpath.o

SUBDIRS = gpukde

include $(top_srcdir)/src/backend/common.mk
