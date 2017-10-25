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
	visitHeading(heading: HEADINGNODE) deferred end
	visitImage(image: IMAGENODE) deferred end
	visitText(text: TEXTNODE) deferred end

-- Private
feature {NONE}


end
