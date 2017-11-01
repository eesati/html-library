note
	description: "Summary description for {TABLECELLNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TABLECELLNODE

inherit
	A_LEAF

create
	make

feature {NONE}
	make(a_body: STRING) do
		body := a_body
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitTableCell(Current)
	end

end
