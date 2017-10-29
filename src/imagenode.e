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
	make,
	makeAlt

-- Fields
feature {NONE}
	source: STRING
	altText: STRING


-- Constructor
feature {NONE}
	make(a_source: STRING)
		do
			source := a_source
			altText := ""
			body := ""
		end
	makeAlt(a_source: STRING; a_alt: STRING)
		do
			source := a_source
			altText := a_alt
			body := ""
		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR)
	do
		visitor.visitImage(Current)
	end

	getSource: STRING
	do
		Result := source
	end

	getAlt: STRING
	do
		Result := altText
	end
end
