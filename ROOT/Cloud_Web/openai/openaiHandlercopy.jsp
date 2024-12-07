<%@ page import="java.io.*, java.net.*, java.util.Properties, org.json.JSONObject, org.json.JSONArray" %> 
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");

    // 토큰 파일 경로 설정
    String tokenFilePath = application.getRealPath("/WEB-INF/token.properties");
    Properties properties = new Properties();
    String apiKey = "";

    // 토큰 파일 읽기
    try (FileInputStream fis = new FileInputStream(tokenFilePath)) {
        properties.load(fis);
        apiKey = properties.getProperty("openai.api.key");
        if (apiKey == null || apiKey.isEmpty()) {
            throw new RuntimeException("API 키가 token.properties 파일에 설정되지 않았습니다.");
        }
    } catch (IOException e) {
        e.printStackTrace();
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", "토큰 파일을 읽는 동안 오류가 발생했습니다: " + e.getMessage());
        out.print(errorJson.toString());
        return;
    }

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
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Authorization", "Bearer " + apiKey);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        connection.setDoOutput(true);

        // OpenAI 요청 데이터 생성
        JSONObject openaiRequest = new JSONObject();
        openaiRequest.put("model", "gpt-4o");
        JSONArray messages = new JSONArray();
        messages.put(new JSONObject().put("role", "system").put("content", 
    "당신은 한국어로만 응답하는 유능한 비서입니다. 사용자 질문에 대해 반드시 아래 형식으로 응답하세요.\n" +
    "형식:\n" +
    "요약: [사용자의 질문에 대한 문제점을 지적해주고, 정답을 알려주세요. 코드형태로 정답을 제공해도 됩니다.]\n" +
    "키워드: [질문에 적용 가능한 알고리즘 키워드를 쉼표로 구분하여 최대 3개 작성]\n\n" +
    "주의: 반드시 위의 형식을 유지하고 다른 불필요한 텍스트를 포함하지 마세요."));


        messages.put(new JSONObject().put("role", "user").put("content", 
    "다음 질문에 대해 요약과 키워드를 생성해주세요. 반드시 아래 형식을 따르세요.\n" +
    "질문: " + question + "\n\n" +
    "형식:\n" +
    "요약: [간단한 요약 작성]\n" +
    "키워드: [알고리즘 키워드]"));


        openaiRequest.put("messages", messages);
        openaiRequest.put("temperature", 0.7);

        // OpenAI API 요청 전송
        OutputStream os = connection.getOutputStream();
        os.write(openaiRequest.toString().getBytes("UTF-8"));
        os.close();

        // OpenAI API 응답 받기
        int status = connection.getResponseCode();
        if (status != 200) {
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "UTF-8"));
            StringBuilder errorResponse = new StringBuilder();
            while ((line = errorReader.readLine()) != null) {
                errorResponse.append(line);
            }
            errorReader.close();
            throw new RuntimeException("OpenAI API 호출 실패: HTTP " + status + " - " + errorResponse);
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
        // 요약 및 키워드 분리
String summary = "";
String keywords = "";

if (resultContent.contains("키워드:")) {
    String[] parts = resultContent.split("키워드:");
    if (parts.length > 0) {
        summary = parts[0].replace("요약:", "").trim(); // 요약 부분 추출
    }
    if (parts.length > 1) {
        keywords = parts[1].trim(); // 키워드 부분 추출
    }
} else {
    summary = resultContent.trim(); // 만약 키워드가 없을 경우 전체 응답을 요약으로 처리
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
