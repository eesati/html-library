note
	description: "Summary description for {A_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	A_VISITOR

feature

-- Public
feature {A_COMPOSITE}
	visitCustomElement(customelement: CUSTOMELEMENT): STRING deferred end
	visitDocument(document: DOCUMENT): STRING deferred end
	visitDocumentLink(documentlink: DOCUMENTLINKNODE): STRING deferred end
	visitExternalLink(externallink: EXTERNALLINKNODE): STRING deferred end
	visitHeading(heading: HEADINGNODE): STRING deferred end
	visitImage(image: IMAGENODE): STRING deferred end
	visitList(list: LISTNODE): STRING deferred end
	visitListItem(listitem: LISTITEMNODE): STRING deferred end
	visitTable(table: TABLENODE): STRING deferred end
	visitTableRow(tableRow: TABLEROWNODE): STRING deferred end
	visitTableCell(tableCell: TABLECELLNODE): STRING deferred end
	visitText(text: TEXTNODE): STRING deferred end

-- Private
feature {NONE}


end
