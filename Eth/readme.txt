1. 블록체인 역사, 구조, 특징, 이해 등등
    - 블록체인 1.0
    1) 분산원장 시스템을 활용
    2) 탈중앙화, 작업증명, p2p 시스템 <-> client/server 
    3) 기술의 신뢰성을 높이는 쪽에 주안점을 두었다!!!
    4) 이런 기술을 증명하기 위해 -> 화폐에 적용 -> 중앙 은행으로부터 독립성을 이루는데 목적
    5) 비트코인이 탄생
    - 블록체인 2.0
    1) 디지털 화폐를 넘어서자
    2) 자산(주식, 모기지, 부동산, 계약)들에 대한 생성과 거래가 가능하게 되었다.
    3) 거래의 대상을 확장시켜서 가치가 높아졌다.
    4) ethereum, Ripple, NXT,....
    5) 블록체인 1.0에 프로그래밍이 가능한 구조로 발전
    6) 스마트 계약(스마트 컨트랙트)
        -> DApp(탈중앙화 어플리케이션, Decentralized Application)
    7) 이더리움 
        -> 2015년 7월
        -> 비탈릭 부테란
        -> 1세대 블록체인 대비(가상화폐) + 프로그래밍 기능 => 2세대(진화된)
        -> 프로그래밍이 가능하다 => 다양한 분야로 확장성을 보였다.
    - 스마트 컨트렉트
        -> 화폐의 관전보다 명령어 등 프로그램 탑재
        -> 프로그래밍이 가능한 디지털 화폐
        -> 블록체인을 통해서 작업증명을 하는 과정을 계약 당사자간의 확인으로 대신 할 수 있다.
        -> 부산 블록체인 특구
            -> https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=092&aid=0002167095
            
    - 미래
        -> 블록체인 3.0 시대 ~
        -> 화폐, 금융, 마켓, 정부, 헬스, 과학, 문화 분야 전 분야 확산 가능
        -> 각각의 디바이스를 블록체인으로 연결하는 네트워크 구성 가능
        -> 새로운 서비스들이 등장



2. 2세대 블록체인 대표주자 이더리움 구축
    - 1세대 : 비트코인 (대장주) -> 블록체인상에 화폐만 구현된 형태
    - 1단계 : 네트워크 구축 (블록체인 구현되어있다)
            이더리움 기반의 네트워크 구축 (이더리움을 구축한 언어는다양하다. 
            -> 구글의 go를 기반으로 만든 것을 가장 많이 사용 -> Geth)
            https://geth.ethereum.org/downloads 윈도우용 다운로드
    - 네트워크 설치 위치 지정
    네트워크 : 상용 <- 테스트 <- private 3가지 형대로 존재
    window
    $ mkdir C:\eth_net
    $ cd C:\eth_net
    $ mkdir C:\eth_net/Geth/
    $ mkdir C:\eth_net/Geth/ethereum
    $ mkdir C:\eth_net/Geth/ethereum/data
    
    linux
    $ mkdir ./eth_net
    $ cd ./eth_net
    $ mkdir ./eth_net/Geth/
    $ mkdir ./eth_net/Geth/ethereum
    $ mkdir ./eth_net/Geth/ethereum/data

    - geth 설치
    - 계정생성
    현재 위치는 C:\eth_net
    $ geth --datadir "./ethereum/data" account new 
    - 계정 확인
    $ geth --datadir "./ethereum/data" account list
    - ICO 행사에 투자를 받아서(예를들면) 1명이 돈을 내고 주주가 되었다.
        => 계좌를 하나 생성해 주었다.
        => 현재 계좌는 2개(소유주, 주주 1명)
        소유주   : 0xd55eb1d0387b48572e8d599e5927508dc51ee5fe
        주주 1명 : 0x9df1b13acfac267e4479399d0f9275227a50ef93
        - 네트워크 구성을 위해 제네시스 블록 구성 파일을 위치해둔다
        => 최초 블럭을 쌓게 된다.
        => C:\eth_net\Geth\Genesis.json 위치
    - 제네시스 블록을 가지고 초기 네트워크를 구축 명령 수행
    $ geth --datadir "./ethereum/data" init "./Genesis.json"
    - 네트워크 가동
    $ geth
        --identity "PrivateNetwork" : 네트워크 이름
        --datadir "./ethereum/data" : 네트워크 위치
        --port "30303"              : 네트워크 Listening Port 지정
        --rpc                       : 원격접속 및 명령 수행 OK, Enable the HTTP-RPC
        --rpcaddr 0.0.0.0           : RPC서버 주소 => 기본값 localhost
        --rpcport "8123"            : RPC서버 포트
        --rpccorsdomain "*"          : 기재하면 도메인으로도 접속 가능
        --nodiscover                : 제네시스 블럭과 네트워크 ID에 있는 블록 연결 금지
        --networkid 1900            : 네트워크 아이디
        --nat "any"                 : 외부 주소와 내부 주소간 변화 처리
        --rpcapi "db, eth, net, web3, miner, personal" : 콘솔로 오픈이 되는 api 목록, web3=>js사용
        --allow-insecure-unlock     : 계좌 언락 허가 추가
        console                     : 콘솔모드 오픈, 모든 출력은 콘솔로 진행

    네트워크 가동
    $ Geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" --allow-insecure-unlock console
    $ geth --identity "PrivateNetwork" --datadir "./ethereum/data" --port "30303" --rpc --rpcaddr 0.0.0.0 --rpcport "8123" --rpccorsdomain "*" --nodiscover --networkid 1900 --nat "any" --rpcapi "db, eth, net, web3, miner, personal" console
    - 원격 접속
    geth attach http://localhost:8123 => 파워쉘 하나 더켜서 원격접속
    - 계좌 확인
    $ eth.accounts
    - 잔고 확인
    $ eth.getBalance( eth.accounts[0] )

[리눅스상에서 네트워크 구축]
-이터리움 설치
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install ethereum

-네트워크 구축
linux
    $ mkdir ./eth_net
    $ cd ./eth_net
    $ mkdir ./eth_net/Geth/
    $ mkdir ./eth_net/Geth/ethereum
    $ mkdir ./eth_net/Geth/ethereum/data

$cd ./eth_net/Geth
$ geth --datadir "./ethereum/data" account new <= 2번 수행
    0x524cD23e2364B92D1cda544c2362c1222C7360E3 : 소유주
    0x92de51B281D05eEc9E6CcfCa53a919D4C96157A8 : 주주
$ nano Genesis.json
-파일내용보기
$ cat Genesis.json

geth --datadir "./ethereum/data" init "./Genesis.json"


3. 이더리움의 사설 네트워크 외부에서 연동하는 방법(RPC)
    -전자지갑 구현
    1) PRC 접속을 통해서 명령을 전송하여 수행
    2) MIST 브라우저(이더리움 GUI 툴) 수행
    3) nodejs 기반 cliente side에서 수행
    4) nodejs 기반 server side에서 수행 : restAPI 스타일
    5) nodejs 기반 socket.io를 이용한 실시간 통신으로 수행 : 소켓통신
        - socket.io 세팅(채팅참조)
    - 원격 접속 상황에서 -> 계좌생성
    $ personal.newAccount('1234')
    "0x49acea70d352ff6c88cf91b57606d4ab761eeff4"
    $ 송금 행위 
        -> 트랜잭션 (마이닝 작업을 통해 처리가 된다)
        -> 여기에는 이런 행위가 적합한지 블록체인의 참여자(노드)들이
           합의 원칙에 따라 검증 후 OK되면 장부에 기록이 되고, 그 때
           돈이 들어오게 된다.
    $ eth.sendTransaction({
        from:eth.accounts[0],
        to:eth.accounts[1],
        value:web3.toWei(1,'ether')
    })
    Error : authentication needed: paasword or unlock
       => 트렌젝션 수행을 위해(수수료가 발생되거나 , 송금행위 등 비용이 발생하는) 발생자(from)
         의 계정을 풀고 (비번을 입력받는다)진행시켜야 한다.
    $ personal.unlockAccount(eth.accounts[0] , '1234')
    $ eth.sendTransaction ({
        from:eth.accounts[0],
        to:eth.accounts[1],
        value: web3.toWei(1, 'ether')
    })
    "0xc230e9b7c88be0e0b594d9018dd5c2d46914cb61ba1f55639e25a18f70622e21"    
    트렌젝션 확인
    $ eth.pendingTransactions
    송금행위를 처리하기 위해 miner.start()
    miner.start() 평소에는 계속해서 가동중이기 때문에 여기서는 필요할 때만 구동하고 , 멈추는 식으로 처리
    $ miner.start()



    화폐단위
    1 ether = 1,000,000,000,000,000,000 wei(수수료 지급용:wei)
            wei < Kwei < Mwei < Gwei
    1 ether = 1,000,000,000 GWei (가장 일반적인 가스 지급단위)
    1 ether = 1,000,000 Szabo (수수료 지급용)
    1 ether = 1,000 Finney (소액 결재용)
    1 ether = 0.001 Kether
            Kether < Mether < Gether < Tether

     - MIST 브라우저
  -> 이더리움 상용/테스트/사설 네트워크에 모두 접속 가능
  -> 네트워크 구동이 없는 상태에서 접속하면 무조건 상용으로 붙게되고 노드가 동기화되면서
     저장 데이터가 커지고, 로드가 많이 걸린다(주의)
  -> 구동전에 반드시 사설 네트워크 가동시킨후에 구동한다
  -> https://github.com/ethereum/mist/releases
     Mist-installer-0-11-1.exe 다운로드
     -> 계좌생성, 송금, 트랜잭션 처리 확인
     -> 스마트 컨트랜트 빌드 -> 배포하는 위치도 확인
    - NodeJS 연동 
        -> node 프로젝트에서 web3 설치
        $ npm install web3@0.16.0       
        -> 프로젝트 생성
        $ C:\Users\501_7\Desktop\test.git\bc_projects\Eth\DApp
        $ express -e mini_wallet
        $ cd mini_wallet
        $ npm install
        $ npm install web3@0.16.0
        $ package.json에서 node ./bin/www => nodemon ./bin/www
        $ npm start
        web3는 이더리움 네트워크에 접속하여 RPC 커맨드를 사용 할 수 있ㄷ사.
        사용관련 api는 네트워크 가동시 허가된 모듈만 사용가능
        [클라이언트사용을 위해]
        node_modules/web3/dist/web3-light.min.js 이 파일을
        public.lib(새로생성)/ web3-light.min.js

        node_modules/binnumber.js/binnumber.min.js 이 파일을
        public.lib(새로생성)/ binnumber.min.js
        -> 코드에서 확인


4. 솔리디티 언어 이해(이더리움 네트워크 상에 프로그램이 가미된 앱을 개발하는 언어)
    - 에디터 : remix
    https://remix.ethereum.org

5. DApp 구성 ( Node 기반, 사설 네트워크 + node 서비스 )
    - 전자지갑
    - 전자투표
    1) 기능
        - 후보자 등록 : 원래는 선관위에서 진행해야 하나, 편의상 어떤 계정이던 추가 할 수 있게 처리
        - 후보자 별 득표수 조회
        - 계좌(선거구 주민, 국민,..)별 투표가 가능
        - 중복 투표는 거절(한사람은 한번의 투표만 가능)
    2) 절차
        - vote.sol를 생성 및 작성 및 테스트 : remix진행
        - contact를 MIST 브라우저를 통해 네트워크로 배포
            1) MIST브라우저로 배포
            2) solc라는 컴파일러를 직접 설치하여(리눅스가 편함) 직접 빌드 후 배포까지
            3) 터틀이라는 nodejs의 모듈을 이용하여 자동화 하는 방법
        - 이런 contract를 nodejs에서 연결하여, 투표 사이트를 구축
        - socket.io를 이용한 실시간 통신을 통한 투표 시스템의 오퍼레이션을 구성하겠다.

    - 배팅시스템..
    -