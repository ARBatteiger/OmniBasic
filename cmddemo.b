* This shows the use of command line swithes and conditional compile
* Try compiling: ob_sw cmddemo.b and then running
* Try compiling: ob_sw cmddemo.b switch=1 and then running

#SET switch=0

#IF switch=0
 PRINT "There was no 'switch=1' when compiling me"
#ELSE
 PRINT "There was a 'switch=1' when compiling me"
#ENDIF

