<%@ page import="java.io.*, java.net.*, org.json.JSONObject, org.json.JSONArray" %>
<%@ include file="/Cloud_Web/includes/sessionCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OpenAI</title>
  <link rel="stylesheet" href="/Cloud_Web/styles/openai_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
  <%@ include file="/Cloud_Web/default.jsp" %>
  <main>
    <h1>OpenAI 기반 코딩 풀이 도우미</h1>

    <div class="content-container">
      <textarea id="codeInput" value = "" placeholder="문제에 대해 궁금한 점을 물어보세요" required></textarea>
      <button id="generateKeywords">키워드 생성</button>
    </div>

    <div class="response">
      <h3>요약 내용</h3>
      <p id="summary">요약 내용이 여기에 표시됩니다.</p>

      <h3>알고리즘 핵심 키워드</h3>
      <p id="keywords">키워드가 여기에 표시됩니다.</p>
    </div>
  </main>

  <script>
    document.getElementById('generateKeywords').addEventListener('click', async () => {
      const usercode = document.getElementById('codeInput').value;
      const button = document.getElementById('generateKeywords');
      const summaryElement = document.getElementById('summary');
      const keywordsElement = document.getElementById('keywords');

      if (!usercode) {
        alert('질문을 입력하세요.');
        return;
      }

      // 버튼 비활성화
      button.disabled = true;
      summaryElement.textContent = '요청을 처리 중입니다...';
      keywordsElement.textContent = '';

      try {
        
        const response = await fetch('/Cloud_Web/openai/openaiHandlercopy.jsp', { // JSP 파일에 POST 요청
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ question: usercode }), 
        });

        if (!response.ok) {
          console.error(`API 호출 실패: ${response.status} ${response.statusText}`);
          summaryElement.innerText = `API 호출 실패: ${response.status}`;
          return;
        }

        const data = await response.json(); // JSP 응답 JSON 데이터 파싱
        summaryElement.innerText = data.summary || '요약 생성 실패';
        keywordsElement.innerText = data.keywords || '키워드 생성 실패';

      } catch (error) {
        console.error('Error:', error);
        summaryElement.innerText = '오류가 발생했습니다. 다시 시도하세요.';
        keywordsElement.innerText = '';
      } finally {
        button.disabled = false; // 버튼 활성화
      }
    });
  </script>
</body>

</html>
