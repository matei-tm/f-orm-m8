---
name: Publish request
about: Publish master branch
title: 'Publish version x.x.x'
labels: 'publish'
assignees: ''

---

**Publish checklist**

- [ ] Update the src/pubspec.yaml with the required version
- [ ] Update the changelog
- [ ] Update documentation
  - [ ] README.md
  - [ ] src/README.md
  - [ ] src/example.dart
- [ ] Format the code
  - [ ]  in src  ```dartfmt -w --fix src```
- [ ] Run tests 
  - [ ] ```cd src```
  - [ ] ```pub run test```
  - [ ] ```cd ..```
- [ ] Commit with message `#xxxx. Publish review completed`
- [ ] Merge develop changes into master
  - [ ] Check CI [results](https://travis-ci.org/matei-tm/f-orm-m8) 
- [ ] Dry run
  - [ ] ```cd src```
  - [ ] ```pub publish --dry-run```
- [ ] Publish ```pub publish```
- [ ] Commit empty ```git commit --allow-empty -m "Completed publish closes #xxxx."```