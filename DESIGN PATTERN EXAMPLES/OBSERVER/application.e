note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature  -- Initialization

	make
			-- Run application.
			local
				subject:SUBJECT

				octal:OCTAL_OBSERVER
				octal2:OCTAL_OBSERVER

		do

			create subject.make
		--	subject.mylist
		create octal.make (subject)
			print ("  STATE CHANGED TO 10  ")
		--	subject.attach (octal)
		--	subject.attach (octal)
		--	subject.attach (octal)
	--	subject.setstate (10)
		print ("  STATE CHANGED TO 20  ")
			subject.setstate (20)

	--	subject.printing

		end

end
