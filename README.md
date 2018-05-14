# TCPdump Example

> Exploring http and https output with tcpdump

## HTTP

```
ruby http.rb
[2018-05-14 11:37:42] INFO  WEBrick 1.3.1
[2018-05-14 11:37:42] INFO  ruby 2.4.2 (2017-09-14) [x86_64-darwin16]
[2018-05-14 11:37:42] INFO  WEBrick::HTTPServer#start: pid=24587 port=8000
::1 - - [14/May/2018:11:39:23 PDT] "GET /secret HTTP/1.1" 200 15
- -> /secret
```

```
curl localhost:8000/secret
secret password
```

```
tcpdump -A -i lo0 'port 8000'
11:43:01.858075 IP6 localhost.irdmi > localhost.58159: Flags [P.], seq 149:164, ack 85, win 12741, options [nop,nop,TS val 211602129 ecr 211602129], length 15
`'.8./.@.................................@./,....Xc...1..7.....
........secret password
```

```
grep password httpdump.txt
..Pa..Pasecret password
```

## HTTPS

```
ruby https.rb
```

```
grep password httpsdump.txt
echo $?
1
```