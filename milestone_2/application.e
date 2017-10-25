note
	description: "milestone_2 application root class"
	date: "2017-10-25"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create c.make("H1" , "text")
			print("<" + c.tag + ">" + c.content + "</" + c.tag + ">" + "%N")
		end

feature --Access

	c: COMPONENT

end
