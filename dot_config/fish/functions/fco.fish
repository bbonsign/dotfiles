function fco --description 'Fuzzy-find and checkout a branch'
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end
