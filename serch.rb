require'time'

def search_image(path,num)
	ary = Array.new
	dir = Dir.open(path)
	dir.each do |filename|
		ary << filename
	end
	ary[-num..-1].map do |filename|
		"#{path}/#{filename}"
	end
end
