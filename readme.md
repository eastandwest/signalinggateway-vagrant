# Signalinggateway-vagrant

Vagrant files for building reference skyway-signaling-gateway environment

## required environment

- vagrant
 - 1.8.7 or upper
- ansible
 - 2.2.0
- virtural box
 - 5.0.30 or upper

## how to build

### Vagrant

```
$ vagrant up
```

### RaspberryPi

* Update ``provisioning/hosts``

change IP address from ``192.168.33.11`` to your RPI. A sample below assumes that IP address is 192.168.0.2.

```
[janusservers]
192.168.0.2
```

* Update ``provisioning/group_vars/all.yaml

cahge user name from ``ubuntu`` to ``pi``

```
remote_user: pi
```

* Run ansible

```
ansible-playbook -i provisioning/hosts -u pi provisioning/site.yml -k -b
```


## how to setup

```
$ vagrant ssh
$ cd signalinggateway/conf
$ cp janus.json.tmpl janus.json
$ cp skyway.json.tmpl skyway.json
```

In this reference environment, janus.json will work without any modification. However, skyway.json needs modification.

Sample of __skyway.json__

```
{
  "scheme" : "wss://",
  "serverAddr" : "skyway.io",
  "serverPort": 443,
  "path": "/",
  "apikey": "APIKEY_OF_YOUR_SKYWAY_ACCOUNT",
  "peerid": "mypeerid",
  "origin": "http://example.com"
}
```

To setup **apikey**, create it at https://skyway.io/ds/. **origin** MUST be configured for this apikey.

## how to test

Run following 4 process

* run SSG

```
$ cd ~/signalinggateway; node app
```

* run sample echo app (for datachannel)

```
$ cd ~/signalinggateway/skywayiot-sdk-test
$ node echo_data
```

* run sample voice receiving app (record it to __recorded_audio.wav__)

```
$ cd ~/signalinggateway/skywayiot-sdk-test
$ sh voice_streaming_receiving_test.sh
```

Now is the time to try example web app (use **chrome** or **firefox**)

```
$ open https://192.168.33.10:3000/examples
```

Then, do following step

1. Click **start datachannle** button (echo message will be appeared)
2. Click **start** button (sample video streaming will be displayed)
3. Click **start sending voice test** button (recorded_audio.wav will be created in ~/signalinggateway/skywayiot-sdk-test)

## run ansible-playbook manually

```
$ ansible-playbook --private-key=.vagrant/machines/default/virtualbox/private_key -i provisioning/development provisioning/site.yml
```

&copy; kensaku komatsu, 2016
