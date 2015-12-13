# userdata
ucloud userdata sample code

linux_configuration 디렉토리 내용
- add_sshkey.sh : sshkey 를 신규로 생성하는 VM에 추가하는 스크립트 
- install_httpd.sh : apache httpd 를 설치하고 서비스를 시작한느 스크립트 예제 (centos 기준)
- centos_interface_up.sh : CIP 를 가진 VM 을 생성할 때 eth1 interface 를 올리고 IP를 받아오는 script (centos 기준)
- debian_interface_up.sh : CIP 를 가진 VM 을 생성할 때 eth1 interface 를 올리고 IP를 받아오는 script (debian 기준)
- partition_and_format_second_disk.sh : data disk 를 가진 상태로 VM을 생성할 때 data disk 를 파티셔닝하고 포맷하는 스크립트
- yum_update.sh : VM 생성시 전체 package 및 OS 업데이트를 실행하는 스크립트 샘플 (centos 기준)

make_server (centos 기준 예제) 디렉토리 내용
- install_elk_server : log 수집 및 분석프로그램을 설치하는 스크립트
- install_cloudmonkey : cloudmonkey 를 설치하는 스크립트
- install_munin_server : 모니터링을 위한 munin server 를 설치하는 스크립트
- install_salt_master : configuration management 를 위한 salt-master 설치 스크립트
