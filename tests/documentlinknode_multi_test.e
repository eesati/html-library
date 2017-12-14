note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	DOCUMENTLINKNODE_MULTI_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "DOCUEMNTLINK-A"
	NAME2: STRING = ""

feature -- Test routines

	headingnode_test
			-- New test routine
		note
			testing:  "covers/{DOCUMENT}.make", "covers/{DOCUMENTLINKNODE}.make", "covers/{DOCUMENT}.addchild"
			testcase: "T.3.1.2.002"
		local
			document: DOCUMENT
			documentlink: DOCUMENTLINKNODE
			documentlink2: DOCUMENTLINKNODE
		do
			create document.make("DOCUMENT-A")
			create documentlink.make(NAME, document)
			create documentlink2.make(NAME2, document)
			document.addchild (documentlink)
			assert ("Link name", documentlink.getbody.is_equal (NAME))
			assert ("Link name", documentlink2.getbody.is_equal (NAME2))
			assert ("Referenced document", documentlink.getdocument.is_equal (document))
			assert ("Right child", document.getchildren.at(1).is_equal (documentlink))

		end
end


