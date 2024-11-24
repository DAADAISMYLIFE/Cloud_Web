# Cloud_Web
2024 동의대학교 클라우드웹개발 프로젝트

<h2>디렉토리 구조</h2>
<h3>폴더</h3>
1. fonts -> 폰트 폴더 <br>
2. images -> 이미지 폴더 <br>
3. styles -> CSS 스타일 폴더. 현재 nav3 적용중 <br>
4. community -> 커뮤니티 페이지 폴더 <br>

<h3>파일</h3>
1. default.jsp -> 기본 헤더/네비게이션 파일. 모든 페이지에서 include 하여 사용 가능 <br>
2. index.jsp -> 기본 홈페이지 파일 <br>
3. apply.jsp -> 신청화면 파일. 삭제 예정

<h2> ※ 주의사항 </h2>
모든 소스코드 및 이미지 파일은 다음과 같은 절대경로 형태로 표기해야 합니다 <br>
ex) /Cloud_Web/images/google.png <br>

<h3> default.jsp 파일 include 방법 </h2>
- include 를 적용하려는 파일을 .jsp로 설정. html에서는 작동 X <br>
- body 태그 내 **<%@ include file = "/Cloud_Web/default.jsp" %>** 삽입

