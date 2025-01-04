#!/bin/bash

echo "termux xfce mobile"

echo "Iniciando instalacion..."
apt update && apt upgrade -y
apt install -y x11-repo
apt install -y xfce4*
apt install -y tigervnc
apt install -y xwayland

# Limpia la pantalla
clear

echo "Inserte una contraseña de acceso"
vncserver

# Mata la sesión de VNC para editar el archivo xstartup
vncserver -kill :1

# Navega al directorio .vnc
cd ~/.vnc

# Añade el nuevo contenido al archivo xstartup
echo "Editando el archivo xstartup..."
cat <<EOF > xstartup
#!/data/data/com.termux/files/usr/bin/sh
## This file is executed during VNC server
## startup.

# Launch terminal emulator Aterm.
# Requires package 'aterm'.

dbus-launch startxfce4 &
#!/bin/bash
xrandr --output default --mode 720x1280
# Launch Tab Window Manager.
# Requires package 'xorg-twm'.
twm &
EOF

# Asegura que el archivo xstartup sea ejecutable
chmod +x xstartup

# Muestra el contenido del directorio .vnc
echo "Contenido del directorio .vnc:"
ls -l

echo "Instalación y configuración completadas. Ahora puedes iniciar el servidor VNC con el comando 'vncserver'."
