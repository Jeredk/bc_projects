// 모듈용 파일
let pi = 3.14
// 일반 모듈화 정의
exports.pi2 = 3.144

const add = () =>10
exports.sub = function(){
    return 5 + add()
}

// 대표모듈 => 객체를 모듈화
// module.exports ={}