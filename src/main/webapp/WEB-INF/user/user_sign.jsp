
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ký đơn hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="/assets/user/css/header&footer.css">
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

        .container1 {
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
        /* From Uiverse.io by vinodjangid07 */
        .Btn {
            width: 100px;
            height: 40px;
            background-color: rgb(65, 64, 64);
            border: none;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.342);
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            position: relative;
            overflow: hidden;
            transition-duration: .5s;
        }

        .text {
            color: rgb(184, 236, 104);
            font-weight: 800;
            letter-spacing: 1.1px;
            z-index: 2;
        }

        .svgIcon {
            z-index: 2;
        }

        .svgIcon path {
            fill: rgb(184, 236, 104);
        }

        .Btn:hover {
            color: rgb(230, 255, 193);
        }

        .effect {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: rgb(184, 236, 104);
            border-radius: 50%;
            z-index: 1;
            opacity: 0;
            transition-duration: .5s;
        }

        .Btn:hover .effect {
            transform: scale(15);
            transform-origin: center;
            opacity: 1;
            transition-duration: .5s;
        }

        .Btn:hover {
            box-shadow: 0px 0px 5px rgb(184, 236, 104),
            0px 0px 10px rgb(184, 236, 104),
            0px 0px 30px rgb(184, 236, 104);
            transition-duration: .7s;
        }

        .Btn:hover .text {
            color: rgb(65, 64, 64);
        }

        .Btn:hover .svgIcon path {
            fill: rgb(65, 64, 64);
        }

        div {
            position: relative;
        }

        input {
            width: 100%;
            color: #ff3e00;
            font-size: inherit;
            font-family: inherit;
            background-color: transparent;
            padding: 1em 0.45em;
            border: 1px solid lightgrey;
            transition: background-color 0.3s ease-in-out;
        }

        input:focus {
            outline: none;
        }

        span {
            position: absolute;
            background-color: #ff3e00;
            transition: transform 0.5s ease;
        }

        .bottom,
        .top {
            height: 1px;
            left: 0;
            right: 0;
            transform: scaleX(0);
        }

        .left,
        .right {
            width: 1px;
            top: 0;
            bottom: 0;
            transform: scaleY(0);
        }

        .bottom {
            bottom: 0;
            transform-origin: bottom right;
        }

        input:focus ~ .bottom {
            transform-origin: bottom left;
            transform: scaleX(1);
        }

        .right {
            right: 0;
            transform-origin: top right;
        }

        input:focus ~ .right {
            transform-origin: bottom right;
            transform: scaleY(1);
        }

        .top {
            top: 0;
            transform-origin: top left;
        }

        input:focus ~ .top {
            transform-origin: top right;
            transform: scaleX(1);
        }

        .left {
            left: 0;
            transform-origin: bottom left;
        }

        input:focus ~ .left {
            transform-origin: top left;
            transform: scaleY(1);
        }


        .button {
            position: relative;
            padding: 8px 16px;
            display: block;
            overflow: hidden;
        }

        .button span {
            position: relative;
            color: #fff;
            z-index: 1;
        }

        .button > div {
            position: absolute;
            top: -80px;
            left: 0;
            width: 200px;
            height: 200px;
            background: #ff3e00;
            transition: 0.5s;
        }

        .button > div::after,
        .button > div::before {
            content: '';
            width: 200%;
            height: 200%;
            position: absolute;
        }

        .button > div::before {
            border-radius: 45%;
            background: rgba(20, 20, 20, 1);
            animation: animate 5s linear infinite;
        }

        .button > div::after {
            border-radius: 40%;
            background: rgba(20, 20, 20, 0.5);
            animation: animate 10s linear infinite;
        }

        .button:hover > div {
            top: -150px;
        }

        @keyframes animate {
            0% {
                transform: translate(-50%, -75%) rotate(0deg);
            }
            100% {
                transform: translate(-50%, -75%) rotate(360deg);
            }
        }


    </style>
</head>
<body>
<%--<%@include file="/WEB-INF/user/include/header.jsp" %>--%>
<div class="container1">

    <h1 style="text-align: center">Đây là mã Hash đơn hàng của bạn:</h1>
    <div style="display: flex;align-items: center;gap: 10px;justify-content: center">
        <p style="font-size: 18px;font-weight: 600;background-color: #aaa;color: #0b51c5;border-radius: 6px;padding: 5px 10px">
            <%=request.getAttribute("hash")%>
        </p>
        <button style="margin-top: 0;height: 32px;transform: translateY(-10px)" class="Btn" id="copyButton">
            <svg viewBox="0 0 512 512" class="svgIcon" height="1em"><path d="M288 448H64V224h64V160H64c-35.3 0-64 28.7-64 64V448c0 35.3 28.7 64 64 64H288c35.3 0 64-28.7 64-64V384H288v64zm-64-96H448c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H224c-35.3 0-64 28.7-64 64V288c0 35.3 28.7 64 64 64z"></path></svg>
            <p style="font-size: 12px;transform: translateY(10px)" class="text">COPY</p>
            <span class="effect"></span>
        </button>
    </div>


    <form>
        <h2 style="text-align: center">Chữ ký của bạn</h2>
       <br>
        <div>
            <input type="text" name="signature" id="signature" placeholder="Nhập chữ ký của bạn"/>
            <span class="bottom" />
            <span class="right" />
            <span class="top" />
            <span class="left" />
        </div>
        <div style=" text-align: center">
            <span id="errorSign" style="color: red;"></span><br>
            <div style="display: flex;justify-content: center">
                <button class="button" type="submit" id="loadSignature">
                    <span style="background-color: transparent">Xác nhận</span>
                    <div />
                </button>
            </div>
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
        // Handle the copy functionality
        $('#copyButton').click(function(event) {
            event.preventDefault();
            var hashText = $('p').text().trim(); // Lấy nội dung của thẻ <p>

            // Sao chép văn bản vào clipboard
            navigator.clipboard.writeText(hashText.trim().replace("COPY","").trim()).then(function() {
                console.log("Text successfully copied to clipboard!");
                alert("Mã Hash đã được sao chép vào clipboard!");
            }).catch(function(err) {
                console.error("Error copying text: ", err);
                alert("Có lỗi xảy ra khi sao chép!");
            });
        });

        // Handle the signature form submission
        $('#loadSignature').click(function (event) {
            event.preventDefault();
            var signature = $('#signature').val();
            $.ajax({
                type: 'POST',
                data: { signature: signature },
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
                $('#errorSign').html("Chữ ký của bạn không hợp lệ!");
            }
        }

        function handleError() {
            $('#errorSign').html("Connection errors. Please check your network and try again!");
        }
    });
</script>
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
                $('#errorSign').html("Chữ ký của bạn không hợp lệ!");
            }
        }
        function handleError() {
            $('#errorSign').html("Connection errors. Please check your network and try again!");
        }
    });
</script>
</html>
