<%@ page import="cloud.UserDAO, cloud.DBConnection, cloud.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {

        request.setCharacterEncoding("UTF-8");

        // 입력 값 가져오기
        String userId = request.getParameter("id");
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
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        userDAO.createUser(user);

        // 리다이렉트
    }
%>

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="/Cloud_Web/styles/signup_styles.css">
        <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const passwordConfirm = document.getElementById("passwordCheck").value;

            if (password !== passwordConfirm) {
                alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                return false; // 폼 제출 방지
            }
            return true; // 폼 제출 진행
        }
    </script>
    </head>

    <body>
        <%@ include file = "/Cloud_Web/default.jsp" %>
        
            <section class="signupSection">

            <form class="signupForm" method="post" id="signup_form" onsubmit="return validateForm()">
                <table>
                    <tr>
                        <td colspan="2"><label><b>회원가입</b></label></td>
                    </tr>
                    <tr>
                        <td><label>아이디</label></td>
                        <td><input type="text" id="id" name="id" placeholder="아이디" value="" required></td>
                    </tr>
                    <tr>
                        <td><label>비밀번호</label></td>
                        <td><input type="password" id="password" name="password" placeholder="비밀번호" value="" required ></td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 확인</label></td>
                        <td><input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 재입력" value="" required></td>
                    </tr>
                    <tr>
                        <td><label>이름</label></td>
                        <td><input type="text" id="name" name="name" placeholder="이름" value="" required></td>
                    </tr>
                     <tr>
                        <td><label>생년월일</label></td>
                        <td><input type="date" id="birth" name="birth" placeholder="" value="" required></td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td><input type="email" id="email" name="email" placeholder="EMAIL" value="" required></td>
                    </tr>
                    <tr>
                        <td><label>전화번호</label></td>
                        <td><input type="tel" id="phone" name="phone" placeholder="010-1234-5678" value="" required></td>
                    </tr>
                    <tr>
                        <td><label>닉네임</label></td>
                        <td><input type="text" id="nickname" name="nickname" placeholder="닉네임" value="" required></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="회원가입" class="submitBtn"></td>
                    </tr>
                </table>
            </form>
            </section>

        
    </body>
    
    </html>