$(function () {
    $('#Submit').click(function (e) {
        var content = $("#content").val().split('\n');
        var output = [];
        var usernames = $("#username").val().split('%');
        console.log(usernames);
        var chatspam = [
            "GET GOOD GET LMAOBOX",
            "LMAOBOX - WAY TO THE TOP",
            "WWW.LMAOBOX.​NET - BEST TF2 HACKS!",
            "NULL CORE - ",
            "BUY IT NOW AT NULLCOREPROJECT.NET!",
            "╔═══╦═══╗",
            "║▒▒▒║▒▒▒║",
            "╠═══╬═══╣",
            "╚═══╩═══╝",
            "www.AIMWARE.net | Premium TF2 Cheat",
            "www.x22cheats.com",
            "[www.ascended.cc]"
        ];
        for (var i = 0; i < content.length; i++)
		{
			main_loop:
            for (var j = 0; j < usernames.length; j++)
			{
				if (!$("#chatspam")[0].checked)
				{
					for (var k = 0; k < chatspam.length; k++)
					{
						if (content[i].toLowerCase().includes(chatspam[k].toLowerCase()))
						{
							break main_loop;
						}
						else
						{
							continue;
						}
					}
				}
				
				if (content[i].startsWith("[NCC] ") || content[i].startsWith("[Lithium] ") || content[i].startsWith("[Speedhook] ")) {
					if ($("#cheat_messages")[0].checked)
					{
						output.push(content[i]);
						break;
					}
					else
					{
						break;
					}
				}
				
				if (content[i].includes(usernames[j] + " :  "))
				{
					if ($("#chat")[0].checked)
					{
						output.push(content[i]);
						break;
					}
					else
					{
						break;
					}
				}
				
                if (content[i].startsWith("(Voice) " + usernames[j])) {
                    if ($("#voice")[0].checked)
					{
						output.push(content[i]);
						break;
					}
					else
					{
						break;
					}
                }
				
                if ($("#disconnect")[0].checked && content[i].includes(usernames[j] + " left the game ")) {
                    output.push(content[i]);
					break;
                }
                if ($("#teamchange")[0].checked && (content[i].includes(usernames[j] + " joined team "))) {
                    output.push(content[i]);
					break;
                }
                if ($("#kills")[0].checked && (content[i].includes(usernames[j] + " killed "))) {
                    output.push(content[i]);
					break;
                }
            }
        }

        $("#output")[0].value = output.join("\r\n");
    });
});