note
	description: "Summary description for {COMPONENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPONENT

feature --Basic operation
		perform
				--Do something
				deferred
				end

feature --Status report
		is_composite:BOOLEAN
						--Is component a composite?
					do
						Result := False
					end


end
