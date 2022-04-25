#!/usr/bin/env bash

cp /home/ec2-user/node-systemd-timer/services/local/sample/sample.service /usr/lib/systemd/system/sample.service
cp /home/ec2-user/node-systemd-timer/services/local/sample/sample.timer /usr/lib/systemd/system/sample.timer

systemctl daemon-reload

systemctl enable sample.timer
