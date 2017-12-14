note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	DOCUMENT_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "DOCUMENT-A"
	NAME2: STRING = ""

feature -- Test routines

	document_test
			-- New test routine
		note
			testing:  "covers/{DOCUMENT}.make"
			testcase: "T.3.1.1.003"
		local
			document: DOCUMENT
			document2: DOCUMENT
		do
			create document.make (NAME)
			create document2.make(NAME2)
			assert ("Document name", document.getname.is_equal (NAME))
			assert ("Document name", document2.getname.is_equal (NAME2))
		end

end


