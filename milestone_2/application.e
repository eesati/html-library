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
			create c.set_tag("H1")
			--c.set_content("Hello World!")
			print("<" + c.tag + ">" + c.content + "</" + c.tag + ">" + "%N")
		end

feature --Access

	c: COMPONENT

end
