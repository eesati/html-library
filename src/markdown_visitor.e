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

	visitDocumentLink(documentlink: DOCUMENTLINKNODE)
	do

	end

	visitExternalLink(externallink: EXTERNALLINKNODE)
	do

	end

	visitHeading(heading: HEADINGNODE)
	do

	end

	visitImage(image: IMAGENODE)
	do
		content := content + "<![Alt text](/>"
	end

	visitList(list: LISTNODE)
	do

	end

	visitListItem(listitem: LISTITEMNODE)
	do
		
	end

	visitTable(table: TABLENODE)
	do

	end

	visitTableRow(tablerow: TABLEROWNODE)
	do

	end

	visitTableCell(tablecell: TABLECELLNODE)
	do

	end

	visitText(text: TEXTNODE)
	do
		content := content + "<p>" + text.getBody + "</p>"
	end

end
