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

			image: IMAGENODE
		do
			create document.make

			document.addchild (create {HEADINGNODE}.make ("My Header", 1))
			document.addchild (create {TEXTNODE}.make("Hallo Welt"))
			document.addchild (create {IMAGENODE}.makealt ("//besole.ch/pictograms/logo.png", "Logo Besole"))

			create table.make
			create tablerow.make
			tablerow.addchild (create {TABLECELLNODE}.make("Test"))
			table.addchild (tablerow)

			document.addchild (table)

			print(document.accept (create {HTML_VISITOR}.make))
			print(document.accept (create {MARKDOWN_VISITOR}.make))

			--create {MARKDOWN_VISITOR} visitor.make
		end

end
