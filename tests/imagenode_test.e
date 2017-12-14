note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	IMAGENODE_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	SOURCE: STRING = "https://www.google.com"
	SOURCE2: STRING = ""
	ALT:STRING = ""

feature -- Test routines

	image_node_test
			-- New test routine
		note
			testing:  "covers/{IMAGENODE}.make", "covers/{IMAGENODE}.makealt", "covers/{DOCUMENT}.addchildren"
			testcase: "T.3.1.2.004"
		local
			image: IMAGENODE
			image2: IMAGENODE
			document: DOCUMENT
		do
			create image.make (SOURCE)
			create image2.makealt (SOURCE2, ALT)
			create document.make ("DOCUMENT-A")
			assert ("Source correctly set", image.getsource.is_equal (SOURCE))
			assert ("Source correctly set", image2.getsource.is_equal (SOURCE2))
			assert ("Alternative image text", image2.getalt.is_equal (ALT))
			assert ("Right child", document.getchildren.at (1).is_equal (image))
		end

end


