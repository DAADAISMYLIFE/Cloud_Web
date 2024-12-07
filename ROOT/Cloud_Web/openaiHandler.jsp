<%@ page import="java.io.*, java.net.*, org.json.JSONObject, org.json.JSONArray" %> 
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");

    try {
        // 클라이언트 요청 데이터 읽기
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        // 요청 JSON 파싱
        JSONObject inputJson = new JSONObject(sb.toString());
        String question = inputJson.getString("question");

        // OpenAI API 요청 설정
        String apiKey = ""; // OpenAI API 키
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Authorization", "Bearer " + apiKey);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        connection.setDoOutput(true);

        // OpenAI 요청 데이터 생성
        JSONObject openaiRequest = new JSONObject();
        openaiRequest.put("model", "gpt-3.5-turbo");
        JSONArray messages = new JSONArray();
        messages.put(new JSONObject().put("role", "system").put("content", "요청 내용을 처리하세요."));
        messages.put(new JSONObject().put("role", "user").put("content", question));
        openaiRequest.put("messages", messages);
        openaiRequest.put("temperature", 0.7);

        // OpenAI API 요청 전송
        OutputStream os = connection.getOutputStream();
        os.write(openaiRequest.toString().getBytes("UTF-8"));
        os.close();

        // OpenAI API 응답 받기
        int status = connection.getResponseCode();
        if (status != 200) {
            throw new RuntimeException("OpenAI API 호출 실패: HTTP " + status);
        }

        BufferedReader responseReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
        StringBuilder responseSB = new StringBuilder();
        while ((line = responseReader.readLine()) != null) {
            responseSB.append(line);
        }
        responseReader.close();

        // 응답 데이터 처리
        JSONObject openaiResponse = new JSONObject(responseSB.toString());
        String resultContent = openaiResponse.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");

        // 요약 및 키워드 분리
        String summary = "";
        String keywords = "";
        if (resultContent.contains("키워드:")) {
            String[] parts = resultContent.split("키워드:");
            summary = parts[0].replace("요약:", "").trim() ;
            keywords = parts.length > 1 ? parts[1].trim() : "키워드가 없습니다.";
        } else {
            summary = resultContent.trim();
        }

        // 클라이언트에 JSON 응답
        JSONObject outputJson = new JSONObject();
        outputJson.put("summary", summary);
        outputJson.put("keywords", keywords);
        out.print(outputJson.toString());

    } catch (Exception e) {
        e.printStackTrace();
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", e.getMessage());
        out.print(errorJson.toString());
    }
%>
