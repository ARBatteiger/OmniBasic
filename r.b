dim addrholder as long
gosub one
gosub two
+movl $havis,_addrholder
+movl _addrholder,%eax
+jmp *%eax
end

one:
print "one"
two:
print "two"
return

havis:
print "havis"
