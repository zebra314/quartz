---
title: Makefile
---
[[software]]

## `.PHONY`

[Reference - GNU Phony Targets](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)

預設情況下，Makefile的目標是實體檔案，ex:
```sh
foo: bar
  create_one_from_the_other foo bar
```

但有時我們想要的Makefile command名稱不一定有對應的實體檔案，ex:
```sh
clean:
	...
run:
	...
```

這裡的clean和run沒有對應的實體檔案，為了不讓Make把command與檔案名稱搞混，便藉由設定`.PHONY`來區別兩者


