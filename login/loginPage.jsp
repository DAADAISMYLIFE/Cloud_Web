<%@ page contentType="text/html; charset=UTF-8" %>
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
        <link rel="stylesheet" href="/Cloud_Web/styles/login_styles.css">
    </head>

    <%@ include file="/Cloud_Web/default.jsp" %>

        <body>
            <div class="wrapper">
                <div class="container">
                    <h3>로그인</h3>
                    <form method="post" action="login_proc.php" id="login_form">
                        <div class="login_input">
                            <input type="text" name="id" placeholder="ID" />
                            <input type="password" name="passwd" placeholder="PASSWORD" />
                        </div>
                        <div class="submit_button">
                            <input type="submit" value="Login" />
                        </div>
                    </form>
                </div>
            </div>
        </body>
    </html>