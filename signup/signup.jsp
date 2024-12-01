<%@ page contentType="text/html; charset=UTF-8" %>
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="/Cloud_Web/styles/signup_styles.css">
    </head>

    <body>
        <%@ include file = "/Cloud_Web/default.jsp" %>
        
            <section class="signupSection">

            <form class="signupForm">
                <table>
                    <tr>
                        <td colspan="2"><label><b>회원가입</b></label></td>
                    </tr>
                    <tr>
                        <td><label>아이디</label></td>
                        <td><input type="text" id="id" name="id" placeholder="ID"></td>
                    </tr>
                    <tr>
                        <td><label>비밀번호</label></td>
                        <td><input type="password" id="password" name="password" placeholder="PW"></td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 확인</label></td>
                        <td><input type="password" id="passwordCheck" name="passwordCheck" placeholder="PW CHECK"></td>
                    </tr>
                    <tr>
                        <td><label>이름</label></td>
                        <td><input type="text" id="name" name="name" placeholder="NAME"></td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td><input type="email" id="email" name="email" placeholder="EMAIL"></td>
                    </tr>
                    <tr>
                        <td><label>전화번호</label></td>
                        <td><input type="tel" id="phone" name="phone" placeholder="PHONE"></td>
                    </tr>
                    <tr>
                        <td><label>닉네임</label></td>
                        <td><input type="text" id="nickname" name="nickname" placeholder="NICKNAME"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="회원가입" class="submitBtn"></td>
                    </tr>
                </table>
            </form>
            </section>

        
    </body>
    
    </html>