note
	description: "Summary description for {HTMLVISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMLVISITOR

inherit
	A_VISITOR

create
	make

feature
	indent: INTEGER
	indentSequence: STRING

feature
	make
	do
		content := ""
		indent := 0
		indentSequence := "  "
	end

	visitDocument(document: DOCUMENT)
	do
		content := content + getIndent + "<!DOCTYPE html>"
		content := content + getIndent + "<html>"

		indent := indent + 1
		across document.getChildren as child loop
			child.item.accept(Current)
		end
		indent := indent - 1

		content := content + getIndent+ "</html>"
	end

	visitHeading(heading: HEADINGNODE)
	do
		content := content + getIndent + "<h" + heading.getLevel.out + ">" + heading.getBody + "</h" + heading.getLevel.out + ">"
	end

	visitImage(image: IMAGENODE)
	do
		content := content + getIndent + "<img alt=%"" + image.getAlt + "%" src=%"" + image.getSource + "%" />"
	end

	visitText(text: TEXTNODE)
	do
		content := content + getIndent + "<p>" + text.getBody + "</p>"
	end



	getIndent: STRING
	local
		counter: INTEGER
	do
		if content.is_equal("") then
			Result := ""
		else
			Result := "%N"
		end

		from
			counter := 0
		until
			counter >= indent
		loop
			Result := Result + indentSequence
			counter := counter + 1
		end
	end

end
