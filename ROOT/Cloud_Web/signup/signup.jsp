<%@ page import="cloud.UserDAO, cloud.DBConnection, cloud.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {

        request.setCharacterEncoding("UTF-8");

        // 입력 값 가져오기
        String userId = request.getParameter("id");

        // 중복 검사
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        boolean isDuplicate = userDAO.isUserIdExists(userId);

         if (isDuplicate) {
            out.println("<script>alert('아이디가 이미 존재합니다. 다른 아이디를 사용해주세요.'); history.back();</script>");
        } else {
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String birth = request.getParameter("birth");
            String phone = request.getParameter("phone");
            String nickname = request.getParameter("nickname");

            // 새로운 유저 객체 생성
            User user = new User();
            user.setUserId(userId);
            user.setPassword(password);
            user.setName(name);
            user.setEmail(email);
            user.setBirth(birth);
            user.setNickname(nickname);
            user.setPhone(phone);

            // DAO로 DB에 추가
            userDAO.createUser(user);

            // 리다이렉트
            out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='/Cloud_Web/login/loginPage.jsp';</script>");
        }
    }
%>

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="/Cloud_Web/styles/signup_styles.css">
        <script>
            function validateBirth(birth) {
                const birthPattern = /^\d{4}-\d{2}-\d{2}$/;
                if (!birth.match(birthPattern)) {
                    return "올바른 생년월일 형식(YYYY-MM-DD)을 입력해주세요.";
                }

                const birthDate = new Date(birth);
                const today = new Date();

                if (isNaN(birthDate.getTime())) {
                    return "유효한 날짜를 입력해주세요.";
                }

                if (birthDate > today) {
                    return "미래 날짜는 입력할 수 없습니다.";
                }

                return ""; // 유효함
            }

            function validateForm() {
                // 기존 에러 메시지 초기화
                document.querySelectorAll(".error-msg").forEach(el => {
                    el.classList.remove("visible");
                });
                
                const pwPattern = /^[a-zA-Z0-9`~!@#$%^&*()_+\-=\[\]\{}|;':",./<>?]{8,20}$/;
                const phonePattern = /^010-[0-9]{4}-[0-9]{4}$/;

                const birth = document.getElementById("birth").value;
                const phone = document.getElementById("phone").value;
                const password = document.getElementById("password").value;
                const passwordConfirm = document.getElementById("passwordCheck").value;

                let isValid = true;

                // 비밀번호 검증
                if (!pwPattern.test(password)) {
                    const errorEl = document.getElementById("passwordError");
                    errorEl.textContent = "비밀번호는 8~20자의 영문, 숫자 및 특수문자로 구성되어야 합니다.";
                    errorEl.classList.add("visible");
                    isValid = false;
                }

                if (password !== passwordConfirm) {
                    const errorEl = document.getElementById("passwordCheckError");
                    errorEl.textContent = "비밀번호가 일치하지 않습니다.";
                    errorEl.classList.add("visible");
                    isValid = false;
                }

                // 전화번호 검증
                if (!phonePattern.test(phone)) {
                    const errorEl = document.getElementById("phoneError");
                    errorEl.textContent = "전화번호는 010-XXXX-XXXX 형식으로 입력해주세요.";
                    errorEl.classList.add("visible");
                    isValid = false;
                }

                // 생년월일 검증
                const birthError = validateBirth(birth);
                if (birthError) {
                    const errorEl = document.getElementById("birthError");
                    errorEl.textContent = birthError;
                    errorEl.classList.add("visible");
                    isValid = false;
                }

                return isValid; // 모든 검증 통과 시 제출
            }
            // 입력 값 변경 시 에러 메시지 숨기기
            document.querySelectorAll("input").forEach(input => {
                input.addEventListener("input", () => {
                    const errorEl = input.nextElementSibling;
                    if (errorEl && errorEl.classList.contains("error-msg")) {
                        errorEl.classList.remove("visible");
                    }
                });
            });
        </script>
    </head>

    <body>
        <%@ include file = "/Cloud_Web/default.jsp" %>
        
            <section class="signupSection">
            <form class="signupForm" method="post" id="signup_form" onsubmit="return validateForm()">
                <table>
                    <caption>회원가입</caption>
                    <tr>
                        <td><label>아이디</label></td>
                        <td>
                            <input type="text" id="id" name="id" placeholder="아이디" value="" required>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호</label></td>
                        <td>
                            <input type="password" id="password" name="password" placeholder="비밀번호" value="" required>
                            <div id="passwordError" class="error-msg" style="color: red;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 확인</label></td>
                        <td>
                            <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 재입력" value="" required>
                            <div id="passwordCheckError" class="error-msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>이름</label></td>
                        <td>
                            <input type="text" id="name" name="name" placeholder="이름" value="" required>
                        </td>
                    </tr>
                    <tr>
                        <td><label>생년월일</label></td>
                        <td>
                            <input type="date" id="birth" name="birth" placeholder="" value="" required>
                            <div id="birthError" class="error-msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td>
                            <input type="email" id="email" name="email" placeholder="이메일" value="" required>
                        </td>
                    </tr>
                    <tr>
                        <td><label>전화번호</label></td>
                        <td>
                            <input type="tel" id="phone" name="phone" placeholder="010-1234-5678" value="" required>
                            <div id="phoneError" class="error-msg" style="color: red;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>닉네임</label></td>
                        <td>
                            <input type="text" id="nickname" name="nickname" placeholder="닉네임" value="" required>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="submitBtn">회원가입</button>

            </form>
            </section>

        
    </body>
    
    </html>