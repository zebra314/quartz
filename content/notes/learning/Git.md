---
title: Git
enableToc: true
---
[[catalog/learning/software|software]]

## Make some changes
1. git clone 網址
2. Add the new files
3. git add 
4. git commit -m"...." 
5. git push

## Branch 
- List all branch ```git branch -a```
- Revert commit ```git reset HEAD^```
- Checkout to remote branch with detached HEAD ```git checkout -t branch_name```
- [Instruction - git branch naming](https://blog.kkbruce.net/2016/03/git-branch-naming-best-practices.html)
1. git branch
	- check the current branch
2. git branch  *your new branch name*
	- create new branch
3. git checkout *branch name* 
	- switch to the branch
4. purpose
	- branches allow us to work on different versions of the same files in parallel.
5. common types of the branch
	- feature branch, bugfix branch
	- develop branch
	- release brance
	- hotfix branch
	- main branch

## Before merge the branch
1. git diff *branch one* .. *branch two*
	- to see the difference between two branches
2. git branch --merged
	- check whether the current branch is merged with master
	- if the branch has merged, we can delete it.

## Merge the branch
1. git merge *branch name*
	- fast-forward merged (舊版本與新版本的branch可以直接合併)
	- merge the current branch with the *branch name*
2. Merge conflicts (不同的新版本合併可能會發生衝突)
	- edit the file (merge後git會警告, 並自動產生註解, 要編輯文件, 選擇要捨去與保留的部份)
	- git commit

## After merge
1. git branch -d *branch name*
	- delete the branch that has merged with master

## Branch management strategy
1. Githubflow
	- long-running branch:  **main**
	- short-lived: feature branches, bugfix branches
2. Gitflow
	- more structure and rules
	- long-running branches : **main + develop**
	- short-lived: feature, release, hotfixes branches
3. Determine the branching model
	-  consider project, release cycle, team

## Fetch
1. git fetch
	- 可以取得遠端數據庫的最新歷史記錄, 取得的提交會導入在自動建立的分支中, 並可以切換這個名為 FETCH_HEAD 的分支

## Pull
1. git pull = git pull + git merge FETCH_HEAD

## Log
- Log ```git log --graph --pretty=oneline --abbrev-commit```
- [Instruction - Git history](https://kejyuntw.gitbooks.io/git-learning-note/content/history/history-README.html)