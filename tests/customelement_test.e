note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	CUSTOMELEMENT_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "DOCUMENT-A"
	CODE: STRING = "<pre>This is a sample.<br>This is also a sample.</pre>"
	CODE2: STRING = ""

feature -- Test routines

	image_node_test
			-- New test routine
		note
			testing:  "covers/{CUSTOMELEMENT}.make", "covers/{CUSTOMELEMENT}.addtext", "covers/{DOCUMENT}.addchildren"
			testcase: "T.3.1.2.010"
		local
			custom: CUSTOMELEMENT
			custom2: CUSTOMELEMENT
			document: DOCUMENT
		do
			create custom.make
			create custom2.make
			create document.make (NAME)
			custom.addtext (CODE)
			custom.addtext (CODE2)
			document.addchild (custom)
			assert ("Right custom code", custom.getbody.is_equal (CODE))
			assert ("Right custom code", custom2.getbody.is_equal (CODE2))
			assert ("Right child", document.getchildren.at(1).is_equal (custom))
		end


end


