<%@ page import="cloud.User, cloud.UserDAO, cloud.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String userId = (String) session.getAttribute("foundpw_userId");

    if (userId == null) {
        response.sendRedirect("/Cloud_Web/login/foundPw.jsp"); // 인증되지 않은 경우 뒤로 리다이렉트
        return;
    }
%>

<%
   if (request.getMethod().equalsIgnoreCase("POST")) {
        request.setCharacterEncoding("UTF-8");
        String newPassword = request.getParameter("password");

        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        User user = userDAO.getUserByUserId(userId);
        userDAO.updatePassword(newPassword, userId);
        out.println("<script>alert('비밀번호가 성공적으로 변경되었습니다.'); location.href='/Cloud_Web/login/loginPage.jsp';</script>");
   }

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/signup_styles.css">
    <script>
        function validateForm() {
                // 기존 에러 메시지 초기화
                document.querySelectorAll(".error-msg").forEach(el => {
                    el.classList.remove("visible");
                });
                
                const pwPattern = /^[a-zA-Z0-9`~!@#$%^&*()_+\-=\[\]\{}|;':",./<>?]{8,20}$/;

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

                return isValid; // 모든 검증 통과 시 제출
            }
    </script>
</head>
    <body>
        <%@ include file = "/Cloud_Web/default.jsp" %>
        
            <section class="signupSection">
            <form class="signupForm" method="post" id="signup_form" onsubmit="return validateForm()">
                <table>
                    <caption>비밀번호 재설정</caption>
                    <tr>
                        <td><label>새로운 비밀번호 </label></td>
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
                </table>
                <button type="submit" class="submitBtn">비밀번호 변경</button>

            </form>
            </section>

    </body>
</html>
