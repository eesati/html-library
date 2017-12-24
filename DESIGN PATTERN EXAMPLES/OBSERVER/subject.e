note
	description: "Summary description for {SUBJECT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SUBJECT


create make
feature

make

do

	create {LINKED_LIST[OCTAL_OBSERVER]} mylist.make
end

feature
	mylist:LINKED_LIST[OCTAL_OBSERVER]

getState:INTEGER
	state:INTEGER



	do
	Result:=state

	end

	setState(stat:INTEGER)
	local

	do

		getState:=stat
		notifyAll

	end


	attach(observer:OCTAL_OBSERVER)
		do
			mylist.extend (observer)
		ensure
			mylist.count = old mylist.count + 1
		end





	notifyAll

	local
	--	octals1:OCTAL_OBSERVER
	--	create octals1

	do
		across mylist as obs
		loop
		obs.item.update  end

		end


printing
do

			from
				mylist.start
			until
				mylist.after
			loop
				print(mylist.index)
				mylist.forth
			end
		end








end
