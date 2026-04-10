#!/bin/sh
[ "$1" = "pre" ] || exit 0

# adjust username if needed
USER=msi
DISPLAY=:0
XAUTHORITY=/home/$USER/.Xauthority

su $USER -c "DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY xsecurelock auth_pam_x11 saver_blank &"

# small delay so lock actually grabs screen before suspend
sleep 1
