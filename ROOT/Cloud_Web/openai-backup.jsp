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
                    <textarea id="codeInput" placeholder="문제에 대해 궁금한 점을 물어보세요" required></textarea>
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

      const apiKey = ''; // OpenAI API 키
      const endpoint = 'https://api.openai.com/v1/chat/completions';

      if (!usercode) {
        alert('질문을 입력하세요.'); // 경고창 표시
        return;
      }

      // 버튼 비활성화
      button.disabled = true;
      summaryElement.textContent = '요청을 처리 중입니다...';
      keywordsElement.textContent = '';

      const requestBody = {
        model: 'gpt-3.5-turbo',
        messages: [
          {
            role: 'system',
            content: `당신은 한국어로만 응답하는 유능한 비서입니다. 사용자에게 다음 질문에 대해서 답변하세요:
            {
              "요약": [사용자가 코딩 문제에 대해 질문을 할 때, 문제의 풀이에 대해 사용자가 직접 생각할 수 있도록 간접적으로 문제점을 지적하시오. 절대 정답 제공 금지. 단, 사용자가 코드를 올렸을 때는 리팩토링 등을 하지 말고, 문제점에 대해서 지적해줄것],
              "키워드": [해당 질문에 대해 적용 가능한 핵심적인 알고리즘 키워드(힌트)를 쉼표로 구분된 한글 키워드 3개 이하로 작성하세요. 꼭 3개 이하로 제한해야 합니다.]

	예외사항 : 코딩 또는 컴퓨터공학과 관련없는 질문일 경우 [코딩과 관련없는 질문 입니다] 라고 답할것.
            }`
          },
          {
            role: 'user',
            content: `다음 질문에 대해 요약하고 키워드를 생성하세요: ${usercode}`
          }
        ],
        temperature: 0.7
      };

      try {
        const response = await fetch(endpoint, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`
          },
          body: JSON.stringify(requestBody)
        });
        console.log(JSON.stringify(requestBody));
        console.log(response);
        if (!response.ok) {
          console.error(`API 호출 실패: ${response.status} ${response.statusText}`);
          summaryElement.innerText = `API 호출 실패: ${response.status}`;
          return;
        }

        const data = await response.json();

        // 요약 및 키워드 분리
        const result = data.choices[0].message.content;

        let summary = '';
        let keywords = '';

        if (result.includes('키워드:')) {
          const parts = result.split('키워드:');
          summary = parts[0].replace('요약:', '').trim();
          keywords = parts[1] ? parts[1].trim() : '키워드가 생성되지 않았습니다.';
        } else {
          summary = result.trim(); // 요약만 있을 경우
        }

        summaryElement.innerText = summary;
        keywordsElement.innerText = keywords;

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