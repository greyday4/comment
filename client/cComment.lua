Events:Subscribe("ModulesLoad", function()
	Events:Fire("HelpAddItem",
        {
            name = "Comment/Request/Bug Report",
            text = 
                "Type '/comment [your comment here]' to leave me a bug report/request!"
        })

end)

Events:Subscribe("ModuleUnload", function()
	Events:Fire("HelpRemoveItem",
        {
            name = "Comment/Request/Bug Report"
        })

end)