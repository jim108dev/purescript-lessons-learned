files := .config/Code/User/extensions.json\
 .config/Code/User/keybindings.json\
 .config/Code/User/settings.json\
 .config/Code/User/snippets/ bin/git-push.sh\
 bin/purty-fix.js

CP := rsync -a --delete

all:
	@echo "Please choose explicitly a target."

backup:
	$(foreach file,$(files),$(CP) ~/$(file) ./$(file);)

restore:
	$(foreach file,$(files),$(CP) ./$(file) ~/$(file);) 
