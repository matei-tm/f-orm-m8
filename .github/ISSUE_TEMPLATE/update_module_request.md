---
name: Submodules update request
about: Submodules update in master branch
title: 'Submodules update version to latest'
labels: 'enhancement'
assignees: ''

---

**Update checklist**

Get latest version:

```shell
git checkout master
git pull
```

- [ ] get latest version

Update submodules for f-orm-m8-sqlite:

```shell
cd .\f-orm-m8-sqlite\
git checkout master
git pull
cd ..
git add .\f-orm-m8-sqlite\
```

- [ ] f-orm-m8-sqlite

Update submodules for vscode-f-orm-m8:

```shell
cd .\vscode-f-orm-m8\
git checkout master
git pull
cd ..
git add .\vscode-f-orm-m8\
```

- [ ] vscode-f-orm-m8

Commit the changes: 

```shell
git commit -am '#xxxx. Updating submodules. Closes #xxxx'
```