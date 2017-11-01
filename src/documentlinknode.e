note
	description: "Summary description for {DOCUMENTLINKNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DOCUMENTLINKNODE

inherit
	A_LEAF

create
	make

feature {NONE}
	linkedDocument: DOCUMENT

feature {NONE}
	make(a_body: STRING; a_document: DOCUMENT)
	do
		body := a_body
		linkedDocument := a_document
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitDocumentLink(Current)
	end

	getDocument: DOCUMENT
	do
		Result := linkedDocument
	end

end
