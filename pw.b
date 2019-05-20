dim a$ as string*32

loop
	print "1) Pig"
	print "2) Dog"
	print "3) Frog"
	print "4) Quit"
	input "Enter Choice",a$
	select case a$
		case "1"
			playwave "pig.wav"
		case "2"
			playwave "dog.wav"
		case "3"
			playwave "frog.wav"
		case "4"
			end
		case else
			print "Invalid choice... re-enter"
	end select
end loop



