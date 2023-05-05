# 홍현우

URL 에 권한 부여 하는 방법 :
  해당 URL 을 설정하는 컨트롤러 위에 @Auth 어노테이션 할당으로 가능.
  
  	ex)  어드민(관리자) 이상만 접근이 가능한 주소 :
       @Auth(role = Role.ADMIN) 
	     @GetMapping("/main")
       public String adminmain() { 
       return "admin/adminMainpage"; 
       }
	 
   
   
    @Auth 어노테이션 종류 :
                            @Auth(role = Role.ADMIN) : 어드민(관리자) 권한 할당
                            @Auth(role = Role.MANAGER) : 매니저 권한 할당
                            @Auth(role = Role.PREMIUM_USER) : 유저(유료회원) 권한 할당
                            @Auth(role = Role.USER) : 유저(무료회원) 권한 할당
                            
                            * @Auth 뒤에 role 을 달지않으면 기본값인 유저 (무료회원) 권한이 할당되도록 설정되어 있음.
                            @Auth
	                        @GetMapping("/main")
                            public String adminmain() { 
                            return "admin/adminMainpage"; 
                             }
                             위 예시처럼 할당하면 유저 (무료회원) 권한 = 로그인 한 모든 이용자 이상이 접근가능한 URL이 됨.
