var express = require('express');
var router = express.Router();
//디렉토리만 지정하면 무조건 그 밑에 index.js를 찾아서 가져온다
let db = require('./db') 

/* GET users listing. */
// ~/users
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

// url은 동일하나, method 방식으로 분기하여 처리하는 방식:restful
// GET: ~/users/login
router.get('/login', (req, res, next) => {
  res.render('login', {title : 'AstroWorld'})
});
// POST:~/users/login
router.post('/login', (req, res, next) => {
  // post방식으로 데이터가 전달되었다 -> 어떻게 추출하는가?
  // console.log(req.body.uid, req.body.upw)

  db.selectLogin(req.body.uid, req.body.upw, ( err, results )=>{
    if (results.length > 0){
        // res.send('[success]회원이다' +  results[0].name + '님 반갑습니다.')
        // 세션 생성
        console.log(results)
      req.session.uid = req.body.uid
      req.session.name = results[0].name
      res.redirect('/')
    }else
        // res.send('[fail]회원이 아니다' + '아이디나 비번을 확인하세요' )
        // console.log(err)
        res.render( 'alert' )
} )


});
router.get('/logout', (req, res, next) => {
  // 세션 종료
  req.session.uid = null
  req.session.name = null
  req.session.destroy( ()=>{
    // 홈페이지 이동
    res.redirect('/')
  } )
});
// 채팅 클라이언트
router.get('/chat',function(req,res,next){
  res.render('chat')
});
module.exports = router;
