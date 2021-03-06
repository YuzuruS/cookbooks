#!/bin/bash
PASS=`head -n 1 /root/.mysql_secret |awk '{print $(NF - 0)}'`
expect -c "
  spawn mysql -p
    expect \"Enter Password:\"
    send \"${PASS}\n\"
    expect \"mysql>\"
    send \"SET PASSWORD FOR root@localhost=PASSWORD('');\n\"
    expect \"mysql>\"
    send \"exit\n\"
  interact
"
rm -f /root/.mysql_secret

exit 0
