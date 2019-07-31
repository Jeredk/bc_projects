pragma solidity ^0.5.7;

contract VoteContract
{
    // 1. 상태변수 구성 : 자료구조 세팅
    // 1-1. 후보자 리스트를 담는 자료구조
    // 키 : 후보자번호 혹은 , 인덱스, 값 : 후보자명
    mapping(uint8=>string) candidates;
    // 1-2. 후보자 정보를 담는 자료구조
    // 후보자별 득표수를 값, 키 : 후보자명(단, 중복경우는 일단 배제, 향후 대체가 필요)
    mapping(string=>uint) candidateScores;
    // 1-3. 투표자는 계좌별 1개, 1회만 투표가능(투표 했는가?안했는가?)
    mapping(address=>bool) votes;
    // 1-4. 전체 투표수
    uint numVote;
    // 1-5. 전체 후보자수 => 후보자의 등록번호로도 같이 사용가능(선착순)
    uint8 numCandidate;
    // 1-6. event : 이미 투표를 하셨습니다. 라는 메시지 전송(중복투표 체크용)
    event sendMsg(string msg);
    event regiSuccess( bool state );
    //--------------------------------------------
    
    // 2. 기능을 분석하여 함수 목록을 세팅
    constructor () public {}
    // 2-1. 후보자 등록
    function addcandidate(string memory name) public 
    {
        bool isAdded = false;
        // 기존에 추가된 후보자가 존재하는가? 있다면 불가
        // isexsit => isAdded = true;
        for(uint8 i=0;i<numCandidate;i++){
            // check it using hash function 
            if(keccak256(bytes(candidates[i])) == keccak256(bytes(name)))
            {
                isAdded = true; // dup
            }
        }
        
	    // 없다면 => 추가, 후보자 수 증가, 득표 수는 0
	    if(!isAdded){
	        // 추가
	        candidates[numCandidate] = name; 
	    	// 후보자 수 증가,
	    	numCandidate++;
    		// 득표수는 0
    		candidateScores[name] = 0;
	    }
    }
    
    // 2-2. 투표 : 이름으로 투표하는데, 번호 투표도 고려
    function vote( string memory name ) public 
    {
        if( dupVote() ){ //이미 투표 했다.
            // event send
            emit sendMsg("이미 투표 했다.");
        }else{
            // 내가 투표를 했다.
            votes[msg.sender] = true;
            // 득표수 증가
            candidateScores[ name ]++;
        }
    }
    
    // 2-3. 중복 투표 체크
    function dupVote(  ) public view returns (bool) 
    {
        return votes[msg.sender];
    }
    
    // 2-4. 후보자 수 리턴
    function getNumOfCandidate() public view returns(uint8)
    {
        return numCandidate;
    }
    
    // 2-5. 후보자별 득표수
    function getScoreOfCandidate (string memory name) public view returns (uint)
    {
        return candidateScores[name];
    }
    
    // 2-6. 번호를 넣으면 후보자의 이름을 획득
    function getCandidateName(uint8 id)
    public view returns (string memory )
    {
    return candidates[id];
    }
}