<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<body>

    <h1>ChatGPT API 예시</h1>

    <div>
        <label for="question">질문:</label>
        <input type="text" id="question" placeholder="질문을 입력하세요">
        <button onclick="chatGPT()">chatGPT</button>

    </div>

    <div id="answerContainer">
        <h2>답변:</h2>
        <p id="answer"></p>
    </div>

    <script>
        async function chatGPT() {
            const userMessage = document.getElementById("question").value;
            const apiEndpoint = "https://api.openai.com/v1/chat/completions";
            const apiKey = "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"; // Replace with your actual API key

            try {
                const response = await fetch(apiEndpoint, {
                    method: 'POST',
                    headers: {
                        'Authorization': 'Bearer ' + apiKey,
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        model: "gpt-3.5-turbo",
                        messages: [{ role: "user", content: userMessage }],
                    }),
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }

                const result = await response.json();
                document.getElementById("answer").innerText = result.choices[0].message.content;
            } catch (error) {
                console.error('Error:', error.message);
            }
        }

        // async function clova() {

        //     const userMessage = document.getElementById("question").value;
        //     const apiEndpoint = "https://clovastudio.stream.ntruss.com/testapp/v1/chat-completions/HCX-002";
        //     const apiKeyClovaStudio = "NTA0MjU2MWZlZTcxNDJiY2f0gpDTfMND9d90M+k2KHgN9W3euoUXUscDYyVKPu7Lzn3BYMXpE+qFAJSzDjPwhfSDlq5wun5YZ6OtjHTNRQlw+TY63LwCoMcX59dsxxRij/fhCyj/jiP6HR7zL9kv+FxH/wkjk/qjLsGH69/feaXeNQiMpRP/hk1xygRZat5F+2+P8Sy/U3mYMI7Tbr9uEf1MZcfUW128zyuuvCrEUyw="; // Clova Studio API Key
        //     const apiKeyAPIGW = "Oa6KsHO45sLXFx5zPBMUh05SfypZi6kFm8SuHE7o"; // API Gateway API Key
        //     const requestId = "59782ffce32c4493b8113c6b3602877f"; // 요청 ID

        //     try {
        //         const response = await fetch(apiEndpoint, {
        //             method: 'POST',
        //             headers: {
        //                 'X-NCP-CLOVASTUDIO-API-KEY': apiKeyClovaStudio,
        //                 'X-NCP-APIGW-API-KEY': apiKeyAPIGW,
        //                 'X-NCP-CLOVASTUDIO-REQUEST-ID': requestId,
        //                 'Content-Type': 'application/json',
        //             },
        //             body: JSON.stringify({
        //                 messages: [
        //                     { role: "user", content: userMessage }
        //                 ],
        //                 topP: 0.8,
        //                 topK: 0,
        //                 maxTokens: 200,
        //                 temperature: 0.5,
        //                 repeatPenalty: 5.0,
        //                 stopBefore: [],
        //                 includeAiFilters: true
        //             }),
        //         });

        //         if (!response.ok) {
        //             throw new Error(`HTTP error! Status: ${response.status}`);
        //         }

        //         const result = await response.json();
        //         document.getElementById("answer").innerText = result.choices[0].message.content;
        //         } catch (error) {
        //             console.error('Error:', error.message);
        //         }
        // }


    </script>


<%@ include file="layout/footer.jsp" %>