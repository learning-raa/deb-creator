arch = all

help:
	@nvim Makefile

init:
	@echo "init: $(pkg)_$(ver)_$(arch)"
	@mkdir -v src/$(pkg)_$(ver)_$(arch)
	@mkdir -v src/$(pkg)_$(ver)_$(arch)/DEBIAN
	@echo "Package: $(pkg)" >> src/$(pkg)_$(ver)_$(arch)/DEBIAN/control
	@echo "Version: $(ver)" >> src/$(pkg)_$(ver)_$(arch)/DEBIAN/control
	@echo "Architecture: all" >> src/$(pkg)_$(ver)_$(arch)/DEBIAN/control
	@echo "Maintainer: raa <raa@mail.com>" >> src/$(pkg)_$(ver)_$(arch)/DEBIAN/control
	@echo "Description: test package" >> src/$(pkg)_$(ver)_$(arch)/DEBIAN/control
	@echo "simple skeleton for <$(pkg)_$(ver)_$(arch)> ready"

build:
	@echo "build: $(pkg)_$(ver)_$(arch)"
	@cd packages; fakeroot dpkg-deb --build ../src/$(pkg)_$(ver)_$(arch)


# # # # # # # #
pull:
	@git pull

savetogit: git.pushall
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .
