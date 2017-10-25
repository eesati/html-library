note
	description: "Summary description for {IMAGENODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IMAGENODE

inherit
	A_LEAF

create
	make

-- Constructor
feature {NONE}
	make
		do

		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR)
	do
		visitor.visitImage(Current)
	end

end
