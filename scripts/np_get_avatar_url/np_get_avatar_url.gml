if (!is_string(argument0) || !is_string(argument1) || !string_length(self.argument0) || !string_length(self.argument1))
    return "";

return "https://cdn.discordapp.com/avatars/" + self.argument0 + "/" + self.argument1 + ".png";
