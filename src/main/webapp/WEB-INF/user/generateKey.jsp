<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Key</title>
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
            text-align: center;
            width: 100%;
            max-width: 400px;
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

        .alert {
            margin-top: 1rem;
            font-size: 14px;
            color: green;
        }

        .alert.error {
            color: red;
        }
    </style>
    <!-- Thêm jQuery từ CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Create Your RSA Key Pair</h1>
    <p>Click the button below to generate your RSA key pair. The public key will be stored securely on the server, while you will be able to download your private key and tools together in a zip file. Ensure you keep your private key safe!</p>

    <button id="generateKeyButton">Generate Key</button>

    <!-- Thông báo trạng thái -->
    <div id="alert" class="alert"></div>
</div>

<script>
    $(document).ready(function () {
        // Gửi yêu cầu kiểm tra trạng thái public key khi tải trang
        checkKeyStatus();

        function checkKeyStatus() {
            $.ajax({
                url: '/user/generateKey',
                method: 'GET',
                success: function (response) {
                    if (response.status === "generateKey") {
                        $('#alert').html(response.message).removeClass('error').addClass('alert');
                    } else if (response.status === "redirect") {
                        // Nếu user đã có public key, chuyển hướng về trang home
                        window.location.href = response.redirect;
                    } else if (response.status === "error") {
                        $('#alert').html(response.message).removeClass('alert').addClass('error');
                    }
                },
                error: function () {
                    $('#alert').html("An error occurred while checking the key status.").removeClass('alert').addClass('error');
                }
            });
        }

        // Xử lý sự kiện nhấn nút "Generate Key"
        $('#generateKeyButton').click(function () {
            $.ajax({
                url: '/user/generateKey?download=true',  // Điều chỉnh URL để phù hợp với phương thức Java
                method: 'POST',
                xhrFields: {
                    responseType: 'blob' // Xử lý file dưới dạng blob
                },
                success: function (blob) {
                    // Tạo một URL blob từ phản hồi server
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.style.display = 'none';
                    a.href = url;
                    a.download = 'tools_and_private_key.zip'; // Tên file khi tải về
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(url); // Xóa URL blob sau khi tải file

                    // Thông báo thành công và chuyển hướng về trang home
                    alert("Your private key and tools have been downloaded successfully. Redirecting to home...");

                    window.location.href = '/user/home'; // Chuyển hướng về trang home
                },
                error: function () {
                    $('#alert').html("An error occurred while generating the key. Please try again.")
                        .removeClass('alert').addClass('error');
                }
            });
        });
    });
</script>
</body>
</html>
