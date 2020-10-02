#!/usr/bin/env sh.
set -e

before="\033[32m"
rear="\033[0m"

pull() {
  echo -e "$before ▶ 正在拉取 master 远程分支合并到本地，请稍后..... $rear"
  git pull origin master
  echo -e "$before ▶ 取成功并合并到当前分支. $rear"
}

push() {
  echo -e "$before ▶ 开始执行 push 命令. $rear"

  git status
  echo -e "$before ▶ 新文件正在提交到暂存区，请等待.... $rear"
  git add .
  echo -e "$before ▶ 文件已传送到暂存区. $rear"
  git status

  echo -e "$before ▶ 输入您的提交：$rear"
  read commit
  git commit -m "$commit"
  echo -e "$before ▶ 提交成功添加. $rear"

  echo -e "$before ▶ 正在提交 master，并合并到远程 master 分支中，请稍后.... $rear"
  git push origin master
  echo -e "$before ▶ master 分支成功推送，请到 GitHub 上查看. $rear"
}

echo -e "$before ▶ 请选择要执行的 GitHub 操作: $rear"
select var in "pull" "push" "exit";
do
  break
done

sleep 1s

case $var in
  pull)
    pull 
  ;;
  push)
    push
  ;;
  exit)
    exit
  ;;
  *)
    echo -e "$before ▶ 请输入正确的格式. $rear"
    npm run deploy
  ;;
esac

# exit the program
exit
