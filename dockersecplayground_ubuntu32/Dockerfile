FROM m0elnx/ubuntu-32bit

RUN apt-get update && apt-get install -y vim gcc make nano build-essential

COPY adduser.sh /adduser.sh
COPY setgw.sh /setgw.sh
COPY addctf.sh /addctf.sh
COPY exec.sh /exec.sh

LABEL \
      type="host" \
      caps_add="NET_ADMIN" \
      actions.exec.command="/exec.sh " \ 
      actions.exec.description="Execute a command in the container" \ 
      actions.exec.args.command.val="mkdir hello" \
      actions.exec.args.command.type="text" \

      actions.adduser.command="/adduser.sh" \ 
      actions.adduser.description="Add a new username : <name> <password> " \ 
      actions.adduser.args.name.val="user" \
      actions.adduser.args.name.type="text" \
      actions.adduser.args.name.rule.pattern="^[a-zA-Z0-9_-]+$" \
      actions.adduser.args.password.val="password" \
      actions.adduser.args.password.type="text" \
      actions.adduser.args.password.rule.pattern="^[a-zA-Z0-9_-]+$" \

	actions.addctf.command="/addctf.sh" \ 
      actions.addctf.description="Add a ctf in /home/<username> directory inside a secret file" \ 
      actions.addctf.args.username.val="" \
      actions.addctf.args.username.type="text" \
      actions.addctf.args.username.rule.pattern="^[a-zA-Z0-9_-]+$" \
      actions.addctf.args.ctf.val="" \
      actions.addctf.args.ctf.type="text" \

      actions.disable_aslr.command="/disable_aslr.sh" \ 
      actions.disable_aslr.description="Disable aslr from this container" \ 

      actions.disable_compiler_protection.command="/disable_compiler_protection.sh" \ 
      actions.disable_compile_protection.description="Disable compiler protection from this container and make stack executable" \ 
