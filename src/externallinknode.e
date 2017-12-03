note
	description: "Summary description for {EXTERNALLINKNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXTERNALLINKNODE

inherit
	A_LEAF

create
	make

feature {NONE}
	link: STRING

feature {NONE}
	make(a_body: STRING; a_link: STRING)
	do
		body := a_body
		link := a_link
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitExternalLink(Current)
	end

	getLink: STRING
	do
		Result := link
	end

end
