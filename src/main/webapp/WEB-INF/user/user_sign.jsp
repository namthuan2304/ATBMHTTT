<%--
  Created by IntelliJ IDEA.
  User: Thanh Sang
  Date: 12/15/2024
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ký đơn hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 2rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            /*text-align: center;*/
            width: 100%;
            max-width: 700px;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 1rem;
        }

        p {
            font-size: 16px;
            color: #666;
            margin-bottom: 1.5rem;
        }

        button {
            align-items: center;
            margin-top: 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        input {
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
            padding: 5px;
        }


    </style>
</head>
<body>
<div class="container">
    <h1>Đây là mã Hash đơn hàng của bạn:</h1>
    <p><%=request.getAttribute("hash")%>
    </p>

    <form>
        Chữ ký của bạn <span id="error" style="color: red; font-size: 12px">acb</span><br>
        <input type="text" name="signature" id="signature" placeholder="Nhập chữ ký của bạn"/><br>
        <div style=" text-align: right">
            <button id="loadSignature">Xác nhận</button>
        </div>
    </form>


</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#loadSignature').click(function (event) {
            event.preventDefault();
            var signature = $('#signature').val();
            $.ajax({
                type: 'POST',
                data: {
                    signature: signature,
                },
                url: context + '/user/sign',
                success: handleResponse,
                error: handleError
            });
        });
        function handleResponse(response) {
            if (response.status === "success") {
                console.log(response.status);
                window.location.href = context + "/user/success";
            } else  if (response.status === "failed"){
                $('#failed').html("Chữ ký của bạn không hợp lệ!");
            }
        }
        function handleError() {
            $('#error').html("Connection errors. Please check your network and try again!");
        }
    });
</script>
</html>
