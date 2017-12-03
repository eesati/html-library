note
	description: "Summary description for {TABLEROWNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TABLEROWNODE

inherit
	A_CONTAINER

create
	make

feature {NONE}
	make do
		create children.make
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitTableRow(Current)
	end

end
