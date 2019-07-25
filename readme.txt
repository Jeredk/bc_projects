[[ 리눅스기초, 노드, 블록체인 이론, 이더리움 ]]
1. aws
    - 1년간 무료 지원 (자원을 많이 사용하면 과금)
    - 아마존에서 리눅스 세팅(상용 시스템)
    - nodejs project(개발이 완료된 결과물) deploy(배포) & 운영
    - 상용서비스 관점 테스트
    - 무료로 사용서비스(리눅스 우분트 18.xx) 사용
    - 데이터베이스 1년간 무료 지원()
    - 가입후 > 콘솔에 로그인 > 서비스 > EC2 클릭시 화면이 열리면 승인완료
    -세팅
    1) 우측 상단 > zone 조절 > 서비스 > EC2 클릭시 화면이 열리면 승인완요(시간이 걸릴수있음)
    -세팅

2. 도커
    - 리눅스를 윈도수, 맥, 등등 가상환경하에 운영
    - 리눅스 -> 이미지로 제공
    - 빠른 설치!!
    - 적은 공간!!
    - 가상화쪽에서는 신흥강자 ~> : 하둡테스트, 운영

3. javascript
    - 발전진행사항
    1995 : 탄생
    1997 : ECMA 표준단체 탄생 => 이후는 바이러스의 온상이 되면서 외면~
    2005 : 구글지도 -> AJAX -> 비동기통신을 통한 화면처리기술 발전
    2008 : 크롬 브라우저 발표 및 소스 공개 => V8엔진 기반
    2009 : nodejs 등장 -> V8엔진 기반 : js기반 서버 사이드 개발 플랫폼, 스마트폰 출시
    2010 : 앱시장 확장 -> Android vs IOS 진영으로 확산 => one source multi use
            -> 하이브리드앱 시장 (html5 css3 js를 이용한 개발 방식)
    2011~ : non액티브엑스, html5 발전, 앱개발 SPA(Single Page Application) 발전
            -> Angular(구글), reactjs(페이스북), vue(커뮤니티) 개발 
            -> JS발전, 웹서비스 개발의 매커니즘이 서버사이드에서 클라이언트사이드로 전환
            -> AngularJS : typeScript(개발언어) -> transcompiile -> javascript 구조
            -> reactjs : modern javascript(표준js) -> babel(표준js->호환js 수정) 
                -> webpack(압축,소스보호) -> 최종 소스 생성
            -> 앱 개발
                1) 네이티브 : android (java or kotlin), ios(objectiv-c, swift)
                2) 하이브리드 : 1세대 : 폰갭, html, css3, js
                               2세대 : 아이오닉, 코드도바, react-native(인스타그램, 페이스북)
                               3세대 : fultter(구글 : pc, 모바일, 전방위 -> dart)
    2015 : 모던스크립트 정립, 발표 적용이 시작~
---------------------------------------------------------------------------------------------------
변수
연산자,제어문,반복문
함수
클래스
기타js만의 표현

4. nodejs
    - 본 과정에서 nodejs의 포지션
    일반유저가 블록체인에 다이렉트로 접근해서 업무를 볼 수 없으므로, 앞단에 서비스가 필요하다.
    웹기반 서비스라면, nodejs에서 제공하는 휍서비스를 통해 블록체인상에 존재하는 DApp(이더리움 기반 스마트계약(프로그램))과
    통신하여 블록체인의 특징/특성이 반영된 서비스를 제공받는다.
    -개념
    -개발환경구축
        ->nodejs.org
    -모던스크립트(필요한 표현 위주)
    -express
    -실제 프로젝트 : 개발(서버/클라이언트사이드) + 디자인 + 기획 + DB
        => 개발이 완료되면 디자인을 입히는 과정 진행
        => 템플릿을 적용하여 디자인 완성 과정
    -실시간 통신
        => socket.io를 사용

    - 배포 및 운영
    => 소스 배포 (ftp를 사용) : 파일질라
    파일 > 사이트 관리자 > 새 사이트 > SFTP, 호스트 : IP, 로그온유형 : 키파일, 사용자:ubuntu, 키파일 : xxxx.ppk
    => 프로젝트 폴더 생성
    $ mkdir server
    $ cd server
        =>파일 생성 및 에디터 예시
        $ nano text.txt
    $ mkdir notJapan or 파일질라에서 디렉토리 생성
    소스 업로드, node_modules, package-lock.json을 뺀 나머지 전부
    $ cd notJapan 
    $ npm install
    $ nano package.json
    ----------------------------------------
    nodemon ./bin/www => node ./bin/www
    ------------------------[수정 및 저장]
    $npm start
    브라우저에 접속 : IP:3000
    -> 3000번 포트가 막혀 있어서, 접속 불가 -> 서버의 인바운드에 3000번을 추가하라
    -> aws > ec2 > 인스턴스 > 하단 설명에 보안그륩 : launch-wizard-1 클릭 >
        인바운드 > 편집 > 사용자 정의  TCP > 3000번 추가, 위치무관으로 저장
        > 브라우저에 접속 : IP:3000 => 접속확인
    --------------------------------------
    [기본 구동법은 터미널 세션을 점유하고 있어서, 다른 작업이나, 퇴근이 불가하다]
    => 전문적인 프로세스 관리자 프로그램이 필요하다 -> forever, PM2, ..
    => PM2를 이용하여 관리하겠다.
    $ npm install pm2 -g
    => PM2를 이용한 서비스 가동
    $ pm2 start ./bin/www
    => 프로세스 목록 확인
    $ pm2 list
    => 중지 : pm2 stop name | id
    $ pm2 stop 0
    => 서비스 재가동 : pm2 restart name | id
    $ pm2 restart 0
    => 서비스 종료, 완전제거 => 더이상 운영하지 않는다 : pm2 delete name | id 
    $ pm2 delete 0
    -------------------------------------------------
    => 이름을 지정하여 서비스 등록 및 구동
    $ pm2 stat ./bin/www --name "notJapan"
    => 정보보기
    $ pm2 show notJapan
    => 정보보기를 통해서 에러로그, 엑세스(out)로그의 위치를 볼 수 있었다.
    => 로그 모니터링
    $ tail -f /home/ubuntu/.pm2/logs/notJapan-out.log
    $ tail -f /home/ubuntu/.pm2/logs/notJapan-error.log
    => $ 로그의 위치는 별도로 지정하지 않으면 ~/.pm2/logs 밑에 존재하다
    => 로그는 내가 지정한 위치에서 관리하고 싶다 => 위치등록
    ---------------------------------------------------
    => 리눅스에서 명령을 나열하고 싶으면 : 명령 && 명령
    => 프로젝트 폴더 내에 logs 폴더 미리 생성 해둔다
    $ pm2 delete notJapan && pm2 start ./bin/www --name "notJapan" -o ./logs/out.log -e ./logs/err.log --merge-logs
    $ tail -f ./logs/out.log
    ----------------------------------------
    => 사업이 잘되서 동접요청이 폭주를 했다 => 현 서버에서 성능을 극대화 할 것인가? => 클러스터
    => cluster 기능을 이용하여 서버를 n개로 증설하고, 별도 지정이 없다면 라운드로빈 방식으로
        요청이 들어오면 서버에 처리를 분1담시킨다 (라운드로빈:1->2->3->4...)
    => 로드밸런스 작업 Load Balancing(LB)
    $ pm2 delete notJapan && pm2 start ./bin/www --name "notJapan" -i 3 -o ./logs/cluster.log
    => 클러스터 개수를 조정하고 싶다
    $ pm2 scale notJapan 4
    => 전체 모니터
    $ pm2 monit
    => 전체 로그 모니다
    $ tail -f ./logs/cluster-*


5. 블록체인

6. 이더리움

7. 리눅스
    - 기본 세팅
    - 계정은 root(루트:소유자), ubuntu(일반사용자)
    - 기본 os 업데이트
    => sudo는 루트 권한으로 뭔가 작업할 떄 사용
        superuser do의 약자, 수퍼유저 권한으로 뭔가를 수행할 때 사용한다.
    => apt-get : ubuntu의 패키지 관리자
        -> 인덱스 정보는 /etc/apt/source.list 저장 -> 여기를 읽어서 패키지 설치시 사용
        -> node.js를 서버에 설치하기 전에 몇버전을 설치하게 구성되어 있는지 확인 후 버전이 안맞으면 버전을 맞춰서 등록후 설치
    $ sudo apt-get update
    $ sudo apt-get upgrade
    => curl이라는 모듈을 설치한다
        -> 다양한 프로토콜을 수행하는 전송 라이브러리, ftp, http...등 사용
    $ sudo apt install curl
    => nodejs 현재 설치할수 있는 버전 체크 => 패키지 정보 보기
    $ sudo apt-cache show nodejs
    =>...
      Version: 8.10.0~dfsg-2
    => nodejs의 설치 버전을 10으로 조정한다
    $ curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    => -s : 진행상태, 에러등을 보이지 않는다
    => -L : 요청 페이지가 변경되면 재요청을 진행한다
    => shell(쉘) -> 리눅스상에서 명령어 처리기, 텍스트, 한줄씩 순차적으로 수행 VS bat파일(윈도우)
        -> bash(배시), sh, zbash(좀더 이쁜)
        -> 쉘코드의 첫줄 -> #!/bin/bash : bash로 쉘스크립트를 구동해라라는 의미
    => 노드 설치
    $ sudo apt install nodejs
    => 버전 확인
    $ node -v
    => 숨김 파일까지 보기
    $ ls -a
    


8. 실전 프로젝트
    - 목적
        > 노노재팬을 카피하여 nodejs 기반으로 구축 및 배포, 운영하겠다.
        > nodejs의 서버 구성 + express(서버를 구성하는 모듈)
        > 데이터베이스(my sql) 연동 (pooling, 풀링 <-> orm(객체기반쿼리처리))
        > 데이터 구축을 위한 웹스크래핑
            => 데이터 수집 및 전처리 : 데이터 분석의 60~70% 비중
            -> 1단계(레벨) : 공공데이터, 데이터센터에서 제공, 통계제공, 국가제공,...
            -> 2단계(레벨) : openapi를 이용한 수집(포털, 특수 목적,..) => 정제된 데이터
            -> 3단계(레벨) : 웹스크래핑(webscraping) : 웹을 요청해서 사이트를 긁어서 html에서 데이터를 추출
                            => css selector가 필수 기술, DOM(Document Object Model) 조작
            -> 4단계(레벨) : 매크로, 드루킹(예를들면 약하게 사용되면), 티켓자동예매(악하게 사용되면)
                            => crawling(크롤링), 브라우저에서 사람이 하는 행위처럼 구성하여
                            자동화시켜서 데이터를 수집하는 행위(로그인, 글쓰기, 데이터 추출 다 된다)
                            => 유튜브, 로그인 후 처리해야 하는 사이트 => ajax를 사용하는 사이트가 주대상
    - 사용 모듈 : Node.js 웹 애플리케이션 프레임워크
    > expressjs 모듈이 nodejs 서버 구성의 거의 대부분을 차지
        -> 이미 서버를 구성해야 할 모든 내용이 다 갖추어 졌다.
    - 설치 : 패키지 조회하는 사이트 : npmjs.com
    npm => nodejs에 써드파트 패키지(모듈)을 설치하는 패키지 관리자
    $ npm i -g express
    -g : 시스템 전체에서 사용 가능
    i : installm, 설치해라
    => bc_projects\node> npm i -g express
    $ npm i -g express-generator
    -프로젝트 생성
    $node> express -e notJapan
    $node> cd notJapan
    $ npm install
        -> package.json을 읽어서 dependencies에 존재하는 모듈을 설치
        -> node_modules 폴더가 생기고, 관련 패키지가 이 안에 다운로드 된다
    - 실행
    $ npm start
    http://localhost:3000

// express -h 를 치면 모든 명령어help


