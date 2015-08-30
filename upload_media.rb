require'RTwitter'
require'base64'

def upload_media(status,paths)
	obj = RTwitter::OAuth.new(@ck,@cks,@at,@ats)
	file_ids = Hash.new
	threads = Array.new
	paths.each do |path|
		threads  << Thread.fork(path) do |file|
			media = Base64.strict_encode64(File.open(file,'r+b').read)
			res = obj.post('media/upload',{'media'=>media})
			file_ids[file] =  res['media_id_string']
		end
	end
	threads.each do |thread|
	  thread.join
	end
	media_ids = paths.map do |file|
		file_ids[file]
	end
	obj.post('statuses/update',{'status'=>status,'media_ids'=>media_ids.join(',')})
end
