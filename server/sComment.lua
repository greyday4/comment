Events:Subscribe("PlayerChat", function(args)
	local words = args.text:split(" ")
	if words[1] == "/comment" and words[2] == nil then
		Chat:Send(args.player, "Use '/comment [your comment here]' to leave a request for me to fix or improve!", Color.Cyan)
	elseif words[1] == "/comment" then
		local f = io.open("comments.txt", "a")
		local string = string.format("%q %s", string.sub(args.text, 10), " - "..args.player:GetName().." ["..os.date().."]")
		f:write(string.."\n")
		f:close()
		Chat:Send(args.player, "Comment left: ", Color.Cyan, string, Color.White)
	elseif args.text == "/read" then
		Chat:Send(args.player, "--Comments--", Color.Cyan)
		local count = 1
    	for line in io.lines("comments.txt") do
    		Chat:Send(args.player, count..". ", Color.Cyan, line, Color.White)
    		count = count + 1
    	end
    end
end)