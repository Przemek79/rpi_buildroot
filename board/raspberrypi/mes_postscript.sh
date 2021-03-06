#!/bin/sh
#
# Marshmallow Entertainment System
#
# Guillermo A. Amaral B. <g@maral.me>
#

TARGET="${1}"

cat << END
[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0m
[0;1;31;91mââ[0;1;33;93mââ[0m         [0;1;31;91mâ[0m         [0;1;35;95mâ[0;1;31;91mâ[0m        [0;1;34;94mâ[0m
[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mâ[0m [0;1;32;92mââ[0;1;36;96mââ[0m  [0;1;35;95mââ[0m
[0;1;32;92mââ[0m [0;1;36;96mâ[0;1;34;94mââ[0;1;35;95mââ[0m  [0;1;33;93mââ[0;1;32;92mââ[0m [0;1;36;96mâ[0;1;34;94mââ[0m [0;1;35;95mâ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mâ[0m [0;1;36;96mâ[0m [0;1;34;94mââ[0;1;35;95mââ[0m [0;1;31;91mâ[0m
[0;1;36;96mââ[0m [0;1;34;94mâ[0;1;35;95mââ[0;1;31;91mââ[0m  [0;1;32;92mââ[0m [0;1;36;96mâ[0m [0;1;34;94mâ[0;1;35;95mââ[0m [0;1;31;91mâ[0;1;33;93mââ[0;1;32;92mâ[0m [0;1;36;96mââ[0;1;34;94mââ[0m  [0;1;31;91mââ[0m [0;1;33;93mâ[0m
[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0;1;36;96mââ[0;1;34;94mââ[0;1;35;95mââ[0;1;31;91mââ[0;1;33;93mââ[0;1;32;92mââ[0m
END

cat <<END
******************************************************************************
 Init Cleanup
******************************************************************************
END

echo "* Logging"
mv ${TARGET}/etc/init.d/S01logging ${TARGET}/etc/init.d/logging 2> /dev/null
echo "* Network"
mv ${TARGET}/etc/init.d/S40network ${TARGET}/etc/init.d/network 2> /dev/null
echo "* NTP"
mv ${TARGET}/etc/init.d/S49ntp     ${TARGET}/etc/init.d/ntp     2> /dev/null
echo "* SSHD"
mv ${TARGET}/etc/init.d/S50sshd    ${TARGET}/etc/init.d/sshd    2> /dev/null

cat <<END
******************************************************************************
 MES RPI overrides
******************************************************************************
END

echo "* Remove cmdline.txt"
rm -f ${TARGET}/boot/cmdline.txt                                2> /dev/null

echo "* Override /etc/issue"
cp board/raspberrypi/mes_issue ${TARGET}/etc/issue

echo "* Default to performance instead of ondemand governor"
sed -i -e "s\ondemand\performance\g" ${TARGET}/etc/init.d/S00raspberrypi.sh

sed -i -e "s\^tty1::respawn\#tty1::respawn\g" ${TARGET}/etc/inittab

cat <<END
******************************************************************************
END
exit 0

