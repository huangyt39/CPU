@echo off
set xv_path=E:\\Vivado\\2016.4\\bin
call %xv_path%/xsim CPU_test_behav -key {Behavioral:sim_1:Functional:CPU_test} -tclbatch CPU_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
