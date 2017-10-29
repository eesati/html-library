note
	description: "Summary description for {A_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	A_VISITOR

feature
	content: STRING

-- Public
feature {ANY}
	visitDocument(document: DOCUMENT) deferred end
	visitDocumentLink(documentlink: DOCUMENTLINKNODE) deferred end
	visitExternalLink(externallink: EXTERNALLINKNODE) deferred end
	visitHeading(heading: HEADINGNODE) deferred end
	visitImage(image: IMAGENODE) deferred end
	visitList(list: LISTNODE) deferred end
	visitListItem(listitem: LISTITEMNODE) deferred end
	visitTable(table: TABLENODE) deferred end
	visitTableRow(tableRow: TABLEROWNODE) deferred end
	visitTableCell(tableCell: TABLECELLNODE) deferred end
	visitText(text: TEXTNODE) deferred end

-- Private
feature {NONE}


end
