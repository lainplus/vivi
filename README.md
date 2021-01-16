# vivi
### set wallpapers according to the current time

vivi is a bash script that sets wallpapers themed according to the current time, using a cron job scheduler

### features
- 25+ different types of wallpaper themes (hd/uhd/4k/5k)
- pywal support
- add your own wallpapers if you like
- with cron, wallpaper changes according to the time, throughout the day

### dependencies

install these before you use vivi:

- feh
- cron
- xrandr
- pywal (optional)

### installation

```
$ git clone https://github.com/lainplus/vivi
$ cd vivi
$ chmod +x *.sh
$ ./install.sh
```

### setting up cron job

since vivi is specifically created to use with a time-based job scheduler such as cron or systemd/Timers, after installing it,
you need to set up a cron job using crontab on your system. these instructions are for Arch Linux, but you should be able to find a way to
do it on other distros, it shouldn't be too different.

```
$ sudo systemctl enable cronie.service --now
```

cron doesn't run on the xorg server, so you have to define env vars.

```
$ echo "$SHELL | $PATH | $DISPLAY | $DESKTOP_SESSION | $DBUS_SESSION_BUS_ADDRESS | $XDG_RUNTIME_DIR"
```

copy the output of that, you'll need it.

create an hourly cron job for vivi using crontab:

```
$ export EDITOR=vim
$ crontab -e

# here, replace the values of the env variables and styles to your own
0 * * * * env PATH=/usr/local/bin:/usr/bin DISPLAY=:0 DESKTOP_SESSION=Openbox DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/vivi -s tokyo

# check if the job is created on your crontab
$ crontab -l
0 * * * * env PATH=/usr/local/bin:/usr/bin DISPLAY=:0 DESKTOP_SESSION=Openbox DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/vivi -s tokyo
```

now vivi is added to your crontab and will change the wallpaper every hour. if you want to change the wallpaper style, just remove the previous job and add a new one with a different style by replacing 'tokyo' with something else

### adding your own wallpapers

- download a wallpaper set you like
- rename the wallpapers to the numbers from 0-23. if you don't have enough images, symlink them or something. these also have to be jpg/png files
- make a directory in /usr/share/vivi/images and copy your wallpapers there
- run vivi, select the style and apply it



enjoy yourself
