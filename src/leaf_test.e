note
	description: "Summary description for {LEAF_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LEAF_TEST

create
	make

feature
	make
		local
			file_out: PLAIN_TEXT_FILE
			document, document2: DOCUMENT
			documentlink: DOCUMENTLINKNODE
			externallink: EXTERNALLINKNODE
			bol1: BOOLEAN
			bol2: BOOLEAN
			bol3: BOOLEAN
		do
			create file_out.make_open_write("output/testing.txt")
			file_out.put_string("Testing%N%N")
			file_out.put_string("Test Case")
			file_out.put_string("%T Success%N")

			create document.make("Test")
			bol1 := "Test" ~ document.getname
			create document.make("")
			bol2 := "" ~ document.getname

			--Test Case T.3.1.1.003

			file_out.put_string("T.3.1.1.003%T")
			if bol1 and bol2 then
				file_out.put_string("TRUE%N")
			else
				file_out.put_string ("FALSE%N")
			end

			--T.3.1.2.001 HOW??

			--T.3.1.2.002
			create documentlink.make("testlink", document)
			document.addchild (documentlink)
			bol1 := documentlink ~ document.getchildren.at (1)
			bol2 := documentlink.getbody ~ "testlink"

			file_out.put_string("T.3.1.2.002%T")
			if bol1 and bol2 then
				file_out.put_string("TRUE%N")
			else
				file_out.put_string ("FALSE%N")
			end

			--T.3.1.2.003
			create externallink.make("testlink", "https://www.google.ch")
			document.addchild (externallink)
			bol1 := externallink.getbody ~ "testlink"
			bol2 := externallink.getlink ~ "https://www.google.ch"
			bol3 := externallink ~ document.getchildren.at (2)

			file_out.put_string("T.3.1.2.003%T")
			if bol1 and bol2 and bol3 then
				file_out.put_string("TRUE%N")
			else
				file_out.put_string ("FALSE%N")
			end


			file_out.close

		end


end
