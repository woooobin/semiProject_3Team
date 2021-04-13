onload = function(){
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d2cc856fd683da85b775d0d7fcce39ce');
	// 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: { // meta태그의 해당하는 값을 가지고 와서카카오 링크 공유시에 보여줄 수 있도록 한다. 
        title: $('meta[property="og:title"]').attr( 'content' ),
        description: $('meta[property="og:description"]').attr( 'content' ),
        imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
        link: {
          mobileWebUrl:mobileWebUrl,
          webUrl:webUrl
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            webUrl:webUrl
          }
        }
      ]
    });
  
  }