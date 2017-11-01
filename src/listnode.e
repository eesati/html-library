note
	description: "Summary description for {LISTNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LISTNODE

inherit
	A_CONTAINER

create
	make

feature {NONE}
	make
	do
		create children.make
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitList(Current)
	end
end
