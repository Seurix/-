require'./upload_media.rb'
require'./search.rb'
require'./config.rb'

print "Tag:"
tag = STDIN.gets.chomp.encode('UTF-8')
while true
	begin
		print 'Text:'
		status = STDIN.gets.chomp.encode('UTF-8')
		print 'Quantity:'
		num = STDIN.gets.chomp.to_i
		if num > 4
			num = 4
		end
		file = search_image(@path,num)
		upload_media("#{status} #{tag}",file,)
	rescue  => e
		puts e.message
		next
	end
	puts 'yay!!'
end
