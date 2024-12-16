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
        input{
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
            padding: 5px;
        }



    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
<div class="container">
    <h1>Đây là mã Hash đơn hàng của bạn:</h1>
    <p><%=request.getAttribute("hash")%></p>

    <form>
        Chữ ký của bạn:<br>
        <input type="text" name="signature" id="signature" placeholder="Nhập chữ ký của bạn"/><br>
        <div style=" text-align: right"><button id="loadSignature" type="submit">Xác nhận</button></div>
    </form>


</div>
</body>
</html>