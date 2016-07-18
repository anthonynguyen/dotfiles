function fish_prompt
	set -g fish_prompt_pwd_dir_length 0

	echo -ns $colour_yellow (date +"%R")
	echo -ns $colour_black " • "
	echo -ns $colour_cyan (prompt_pwd) ""

	if test $status -eq 0
		echo -ns $colour_normal " ── "
	else
		echo -ns $colour_yellow " [" $status "] "
	end
end
