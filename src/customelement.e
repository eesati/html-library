note
	description: "Summary description for {CUSTOMELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CUSTOMELEMENT

inherit
	A_LEAF

create
	make

-- Constructor
feature {NONE}
	make
	do
		body := ""
	end

-- Public features
feature {ANY}
	accept(a_visitor: A_VISITOR): STRING
	do
		Result := a_visitor.visitCustomElement(Current)
	end

	addText(a_text: STRING)
	do
		body := body + a_text
	end

end
