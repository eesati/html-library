note
	description: "MarkupGenerator application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

-- Root Entry Point
feature {NONE}
	make
		local
			document: DOCUMENT
			table: TABLENODE
			tablerow: TABLEROWNODE
			custom: CUSTOMELEMENT

			image: IMAGENODE

			filewriter: FILEWRITER

			test: LEAF_TEST
		do
			create document.make("doc1.html");

			document.addchild (create {HEADINGNODE}.make ("My Header", 1))
			document.addchild (create {TEXTNODE}.make("Hallo Welt"))
			document.addchild (create {IMAGENODE}.makealt ("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/220px-Google_2015_logo.svg.png", "Logo Google"))

			create table.make

			create tablerow.make
			tablerow.addchild (create {TABLECELLNODE}.make("Test"))
			tablerow.addchild (create {TABLECELLNODE}.make ("Test2"))
			tablerow.addchild (create {TABLECELLNODE}.make ("Test2"))
			table.addchild (tablerow)

			create tablerow.make
			tablerow.addchild (create {TABLECELLNODE}.make("Test"))
			tablerow.addchild (create {TABLECELLNODE}.make ("Test2"))
			tablerow.addchild (create {TABLECELLNODE}.make ("Test2"))
			table.addchild (tablerow)

			document.addchild (table)

			create custom.make
			custom.addtext ("<p>Hallo Welt</p>")
			document.addchild (custom)

			--io.put_string(document.accept (create {HTML_VISITOR}.make))
			--io.put_new_line
			--io.put_new_line
			--io.put_string(document.accept (create {MARKDOWN_VISITOR}.make))

			--create filewriter.make ("C:/Users/besole/Desktop/")
			--filewriter.write (document, create {MARKDOWN_VISITOR}.make)

			create test.make
		end

end
