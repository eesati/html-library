note
	description: "Summary description for {MARKDOWN_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARKDOWN_VISITOR

inherit
	A_VISITOR

	create make

feature
	make
	do
		content := ""
	end

	visitDocument(document: DOCUMENT)
	do
		content := content + "<!DOCTYPE html>"
		content := content + "<html>"

		across document.getChildren as child loop
			child.item.accept(Current)
		end

		content := content + "</html>"
	end

	visitImage(image: IMAGENODE)
	do
		content := content + "<![Alt text](/>"
	end

	visitText(text: TEXTNODE)
	do
		content := content + "<p>" + text.getText + "</p>"
	end

end
