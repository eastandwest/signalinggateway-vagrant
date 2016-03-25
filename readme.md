# Vagrant files for building skyway-signaling-gateway development env

## how to build

```
$ vagrant up
```

## how to connect

```
$ vagrant ssh
```

please note that when 1st, execute vim and type

```
:PluginInstall
```

## test janus streaming plugin

* execute sample gstreamer on VM.

```
$ sh streams/test_gstreamer_1.sh
```

* open url from Host OS (must be chrome or firefox)

```
$ open http://192.168.33.10/streamingtest.html
```

1. Click **Start** button
2. Select **Opus/VP8...** from Streams list menu
3. Click **Watch or Listen**

you'll see the color bar type video stream ;)

## run ansible-playbook manually

```
$ ansible-playbook --private-key=.vagrant/machines/default/virtualbox/private_key -i provisioning/development provisioning/site.yml
```

&copy; kensaku.komatsu@gmail.com
