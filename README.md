# Config
carpetas de configuracion, nvim, aspell, ...

sockets ssh:

~/.config/systemd/user/ssh-agent.socket
~/.config/systemd/user/ssh-agent.service

systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.socket

2) Haz visible el socket a tus shells
Opción A (simple, portátil): en tu ~/.profile o ~/.bash_profile/~/.zprofile:

export ssh_auth_sock="$xdg_runtime_dir/ssh-agent.socket"

3) Carga la clave solo la primera vez que la uses
En ~/.ssh/config:

    Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_ed25519
        AddKeysToAgent yes
        IdentitiesOnly yes

