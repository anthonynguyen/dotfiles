function fish_right_prompt
	if git branch > /dev/null 2>/dev/null
		echo -ns $colour_magenta "± " (git_branch) (git_files_prompt) " "
	else
		echo ""
	end
end

function git_branch
	echo -ns (git branch | sed -n '/\* /s///p')
end

function git_num_staged
	echo -ns (git status --porcelain | grep "^[MADR]" | wc -l)
end

function git_num_unstaged
	echo -ns (git status --porcelain | grep "^.[MADR]" | wc -l)
end

function git_num_untracked
	echo -ns (git status --porcelain | grep "^??" | wc -l)
end

function git_staged_prompt
	if test (git_num_staged) -gt 0
		echo "+"
	end
end

function git_unstaged_prompt
	if test (git_num_unstaged) -gt 0
		echo "!"
	end
end

function git_untracked_prompt
	if test (git_num_untracked) -gt 0
		echo "?"
	end
end

function git_files_prompt
	set -l num_staged (git_num_staged)
	set -l num_unstaged (git_num_unstaged)
	set -l num_untracked (git_num_untracked)
	if math "$num_staged+$num_unstaged+$num_untracked > 0" > /dev/null
		echo -ns " [" (git_staged_prompt) (git_unstaged_prompt) (git_untracked_prompt) "]"
	end
end
