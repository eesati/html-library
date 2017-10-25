note
	description: "Summary description for {HEADINGNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HEADINGNODE

inherit
	A_LEAF

create
	make

-- Fields
feature {NONE}
	level: INTEGER

-- Constructor
feature {NONE}
	make(text: STRING; a_level: INTEGER)
	do
		body := text
		level := a_level
	end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR)
	do
		visitor.visitHeading(Current)
	end

	getLevel: INTEGER
	do
		Result := level
	end


-- Private
feature {NONE}

end
