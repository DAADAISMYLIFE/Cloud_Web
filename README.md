# Cloud_Web
2024 동의대학교 클라우드웹개발 프로젝트

## 프로젝트 설명
2024학년도 동의대학교 클라우드웹개발 교과목 프로젝트로
코딩 관련 동아리, 스터디 그룹 회원들을 위한 커뮤니티 사이트를 제작하였습니다.

## 개발 환경
tomcat 내부 구조의 webapps으로 이동해서 다음의 절차를 따릅니다.

```bash
git clone <주소> .
```

webapps 디렉토리 안에 git의 ROOT가 나올 수 있도록 해야합니다.

### 주의사항
모든 소스코드 및 이미지 파일은 다음과 같은 절대경로 형태로 표기해야 합니다

```
/Cloud_Web/images/images.png
```

### default.jsp 파일 include 방법
- include 를 적용하려는 파일을 .jsp로 설정. html에서는 작동 X
- body 태그 내 `<%@ include file = "/Cloud_Web/default.jsp" %>` 삽입


## 디렉토리 구조
디렉토리 구조는 다음과 같습니다. 
```
.
├── README.md
└── ROOT
    ├── Cloud_Web
    │   ├── activity
    │   ├── apply
    │   ├── community
    │   ├── default.jsp
    │   ├── fonts
    │   ├── images
    │   ├── includes
    │   ├── index.jsp
    │   ├── introduce.jsp
    │   ├── login
    │   ├── notification
    │   ├── openai
    │   ├── openai-backup.jsp
    │   ├── openaiHandler.jsp
    │   ├── signup
    │   ├── styles
    │   └── uploads
    ├── index.jsp
    └── WEB-INF
        ├── classes
        ├── lib
        ├── token.properties
        └── web.xml
```

### 디렉토리 설명
1. fonts -> 폰트 폴더
2. images -> 이미지 폴더
3. styles -> CSS 스타일 폴더. 현재 nav3 적용중
4. community, activity, notification -> 커뮤니티, 활동내역, 공지사항 페이지 폴더
5. uploads -> 사용자들이 업로드한 이미지 폴더

### 기본 파일
1. default.jsp -> 기본 헤더/네비게이션 파일. 모든 페이지에서 include 하여 사용 가능 <br>
2. index.jsp -> 기본 홈페이지 파일 <br>
