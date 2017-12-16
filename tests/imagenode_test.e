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
			testing:  "covers/{IMAGENODE}.make", "covers/{IMAGENODE}.makealt"
			testcase: "T.3.1.2.004"
		local
			image: IMAGENODE
			image2: IMAGENODE
		do
			create image.make (SOURCE)
			create image2.makealt (SOURCE2, ALT)
			assert ("Source correctly set 1", image.getsource.is_equal (SOURCE))
			assert ("Source correctly set 2", image2.getsource.is_equal (SOURCE2))
			assert ("Alternative image text", image2.getalt.is_equal (ALT))
		end

end


