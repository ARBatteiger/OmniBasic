dim a$ as string*22
dim x as long

a$=NextArg

select case a$
	case "abc"
		print "1"
	case "xyz"
		print "2"
	case else
		print "else"
end select

x=5

select case land(x,6)
	case 1
		print 1
	case lor(x,2)
		print 2
	case val(a$)
		print 3
	case 4
		print 4
	case 5
		print 5
	case 6
		print 6
	case 7
		print 7
end select


