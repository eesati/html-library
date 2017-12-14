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

feature -- Test routines

	document_test
			-- New test routine
		note
			testing:  "covers/{DOCUMENT}.make"
			testcase: "T.3.1.1.003"
		local
			document: DOCUMENT
		do
			create document.make (NAME)
			assert ("Document name set", document.getname.is_equal (NAME))
		end

end


