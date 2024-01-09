# Experiment Branch
The experiment branch is for all experimental features. **None** of these features have been **tested in any way**. After successful tests, this will be merged with main.

# Everytab-System-7
System/7 is a small DOS-Based program meant to make interacting with your computer a bit more easier. System/7 is meant to be a CUI, and **not** a GUI (Apart from Session Manager). This is just a hobbyist project, and is **not meant to be used in anything critical or mainstream**

# How to compile

## Prerequisites

- Visual Basic for MS-DOS 1.0 (Or QuickBASIC 4.5/7)
- Appropriate source files which are as follows
  * `ESSM2.BAS`
  * `SET.BAS`
  * `X.BAS`
  * `CDST.BAS`
  * `TLPM.BAS`
  * `TCM.BAS`
  * `HDST.BAS`

## Compiling
- Open Visual Basic for MS-DOS,
- Go to File > Add File and select the desired source file. (Remember to only load one source file at a time)
- To make an executable go to Run > Make an EXE. Select the following options-
  * No Debug
  * No Runtime
  * i486 Maths
- After compiling, the executable will be in the same directory as the Visual Basic IDE.

# How to make an installation media (Incomplete Guide)

## Requirements
- Compiled copies of ESSM2.BAS, CDST.BAS, TSM package from latest ISO (includes SM, OP, CALC), TLPM.BAS, TCM.BAS, and the recovery. (Please use calc.exe, op.exe and sm.exe from build 339 or later, source files will be uploaded later)
- PowerISO

## Steps (Not Complete)
- Take the latest ES/7 ISO
- Modify the ES7.zip and replace the needed files.
- Modify ES7R.zip (Recovery files), unless if its meant to be a quick build.
- Modify the boot image file of the ISO (option in PowerISO) and replace CDST at the root of the floppy.

# Files which are depricated (Useless)

- ST1 to 4 (Use CDST)
- UP1 and 2 (Use CDST)
- ES and ESSM (Use ESSM2)
- PLUSNON
- the base images

# Notes
- The code is quite messy with the GOTO functions, this will slowly be replaced with SUBs to make it easier.
- You are free to make a pull request if you want to contribute to the code.
- Please credit the System/7 developers if you are forking the System/7 as your own project.
- This uses some code from the internet (mainly the menu code). Things like the login manager (not the menu code of the login manager), preliminary multi-language support, settings etc. are made by the System/7 developers.
