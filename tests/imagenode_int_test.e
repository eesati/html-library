note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	IMAGENODE_INT_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	SOURCE: STRING = "/output/panda.jpg"
	ALT:STRING = "Alternative image text"

feature -- Test routines

	image_node_int_test
			-- New test routine
		note
			testing:  "covers/{IMAGENODE}.make", "covers/{IMAGENODE}.makealt", "covers/{DOCUMENT}.addchildren"
			testcase: "T.3.1.2.004"
		local
			image: IMAGENODE
			document: DOCUMENT
		do
			create image.makealt (SOURCE, ALT)
			create document.make ("DOCUMENT-A")
			assert ("Source correctly set", image.getsource.is_equal (SOURCE))
			assert ("Alternative image text", image.getalt.is_equal (ALT))
			assert ("Right child", document.getchildren.at (1).is_equal (image))
		end

end


