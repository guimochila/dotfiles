#!/usr/bin/env bash

languages=$(echo "golang typescript rust javascript" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query > " query

if echo "$languages" | grep -qs $selected; then
  query=`echo $query | tr ' ' '+'`
  tmux split-window -p 40 -h bash -c "curl -s cht.sh/$selected/$query | less -R"
else
  tmux split-window -p 40 -h bash -c "(curl -s cht.sh/$selected~$query; tldr $selected --search "$query") | less -R"
fi
