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
        /* From Uiverse.io by MuhammadHasann */
        .button {
            --black-700: hsla(0 0% 12% / 1);
            --border_radius: 9999px;
            --transtion: 0.3s ease-in-out;
            --offset: 2px;

            cursor: pointer;
            position: relative;

            display: flex;
            align-items: center;
            gap: 0.5rem;

            transform-origin: center;

            padding: 0.5rem 1rem;
            background-color: transparent;

            border: none;
            border-radius: var(--border_radius);
            transform: scale(calc(1 + (var(--active, 0) * 0.1)));

            transition: transform var(--transtion);
        }

        .button::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            width: 100%;
            height: 100%;
            background-color: var(--black-700);

            border-radius: var(--border_radius);
            box-shadow: inset 0 0.5px hsl(0, 0%, 100%), inset 0 -1px 2px 0 hsl(0, 0%, 0%),
            0px 4px 10px -4px hsla(0 0% 0% / calc(1 - var(--active, 0))),
            0 0 0 calc(var(--active, 0) * 0.375rem) hsl(260 97% 50% / 0.75);

            transition: all var(--transtion);
            z-index: 0;
        }

        .button::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            width: 100%;
            height: 100%;
            background-color: hsla(260 97% 61% / 0.75);
            background-image: radial-gradient(
                    at 51% 89%,
                    hsla(266, 45%, 74%, 1) 0px,
                    transparent 50%
            ),
            radial-gradient(at 100% 100%, hsla(266, 36%, 60%, 1) 0px, transparent 50%),
            radial-gradient(at 22% 91%, hsla(266, 36%, 60%, 1) 0px, transparent 50%);
            background-position: top;

            opacity: var(--active, 0);
            border-radius: var(--border_radius);
            transition: opacity var(--transtion);
            z-index: 2;
        }

        .button:is(:hover, :focus-visible) {
            --active: 1;
        }
        .button:active {
            transform: scale(1);
        }

        .button .dots_border {
            --size_border: calc(100% + 2px);

            overflow: hidden;

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            width: var(--size_border);
            height: var(--size_border);
            background-color: transparent;

            border-radius: var(--border_radius);
            z-index: -10;
        }

        .button .dots_border::before {
            content: "";
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            transform-origin: left;
            transform: rotate(0deg);

            width: 100%;
            height: 2rem;
            background-color: white;

            mask: linear-gradient(transparent 0%, white 120%);
            animation: rotate 2s linear infinite;
        }

        @keyframes rotate {
            to {
                transform: rotate(360deg);
            }
        }

        .button .sparkle {
            position: relative;
            z-index: 10;

            width: 1.75rem;
        }

        .button .sparkle .path {
            fill: currentColor;
            stroke: currentColor;

            transform-origin: center;

            color: hsl(0, 0%, 100%);
        }

        .button:is(:hover, :focus) .sparkle .path {
            animation: path 1.5s linear 0.5s infinite;
        }

        .button .sparkle .path:nth-child(1) {
            --scale_path_1: 1.2;
        }
        .button .sparkle .path:nth-child(2) {
            --scale_path_2: 1.2;
        }
        .button .sparkle .path:nth-child(3) {
            --scale_path_3: 1.2;
        }

        @keyframes path {
            0%,
            34%,
            71%,
            100% {
                transform: scale(1);
            }
            17% {
                transform: scale(var(--scale_path_1, 1));
            }
            49% {
                transform: scale(var(--scale_path_2, 1));
            }
            83% {
                transform: scale(var(--scale_path_3, 1));
            }
        }

        .button .text_button {
            position: relative;
            z-index: 10;

            background-image: linear-gradient(
                    90deg,
                    hsla(0 0% 100% / 1) 0%,
                    hsla(0 0% 100% / var(--active, 0)) 120%
            );
            background-clip: text;

            font-size: 1rem;
            color: transparent;
        }
    </style>
    <!-- Thêm jQuery từ CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Create Your RSA Key Pair</h1>
    <p>Click the button below to generate your RSA key pair. The public key will be stored securely on the server, while you will be able to download your private key and tools together in a zip file. Ensure you keep your private key safe!</p>
<div style="display: flex;justify-content: center">
    <button id="generateKeyButton" class="button">
        <div class="dots_border"></div>
        <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                class="sparkle"
        >
            <path
                    class="path"
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke="black"
                    fill="black"
                    d="M14.187 8.096L15 5.25L15.813 8.096C16.0231 8.83114 16.4171 9.50062 16.9577 10.0413C17.4984 10.5819 18.1679 10.9759 18.903 11.186L21.75 12L18.904 12.813C18.1689 13.0231 17.4994 13.4171 16.9587 13.9577C16.4181 14.4984 16.0241 15.1679 15.814 15.903L15 18.75L14.187 15.904C13.9769 15.1689 13.5829 14.4994 13.0423 13.9587C12.5016 13.4181 11.8321 13.0241 11.097 12.814L8.25 12L11.096 11.187C11.8311 10.9769 12.5006 10.5829 13.0413 10.0423C13.5819 9.50162 13.9759 8.83214 14.186 8.097L14.187 8.096Z"
            ></path>
            <path
                    class="path"
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke="black"
                    fill="black"
                    d="M6 14.25L5.741 15.285C5.59267 15.8785 5.28579 16.4206 4.85319 16.8532C4.42059 17.2858 3.87853 17.5927 3.285 17.741L2.25 18L3.285 18.259C3.87853 18.4073 4.42059 18.7142 4.85319 19.1468C5.28579 19.5794 5.59267 20.1215 5.741 20.715L6 21.75L6.259 20.715C6.40725 20.1216 6.71398 19.5796 7.14639 19.147C7.5788 18.7144 8.12065 18.4075 8.714 18.259L9.75 18L8.714 17.741C8.12065 17.5925 7.5788 17.2856 7.14639 16.853C6.71398 16.4204 6.40725 15.8784 6.259 15.285L6 14.25Z"
            ></path>
            <path
                    class="path"
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke="black"
                    fill="black"
                    d="M6.5 4L6.303 4.5915C6.24777 4.75718 6.15472 4.90774 6.03123 5.03123C5.90774 5.15472 5.75718 5.24777 5.5915 5.303L5 5.5L5.5915 5.697C5.75718 5.75223 5.90774 5.84528 6.03123 5.96877C6.15472 6.09226 6.24777 6.24282 6.303 6.4085L6.5 7L6.697 6.4085C6.75223 6.24282 6.84528 6.09226 6.96877 5.96877C7.09226 5.84528 7.24282 5.75223 7.4085 5.697L8 5.5L7.4085 5.303C7.24282 5.24777 7.09226 5.15472 6.96877 5.03123C6.84528 4.90774 6.75223 4.75718 6.697 4.5915L6.5 4Z"
            ></path>
        </svg>
        <span class="text_button">Generate Key</span>
    </button>

</div>


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

        $('#generateKeyButton').click(function () {
            $.ajax({
                url: '/user/generateKey?download=true',  // Điều chỉnh URL để phù hợp với phương thức Java
                method: 'POST',
                xhrFields: {
                    responseType: 'blob' // Xử lý file dưới dạng blob
                },
                success: function (blob, textStatus, xhr) {
                    // Lấy tên file từ header Content-Disposition
                    const contentDisposition = xhr.getResponseHeader('Content-Disposition');
                    const fileNameMatch = contentDisposition.match(/filename="(.+)"/);
                    const fileName = fileNameMatch ? fileNameMatch[1] : 'default_filename.zip'; // Nếu không có tên file, đặt tên mặc định

                    // Tạo một URL blob từ phản hồi server
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.style.display = 'none';
                    a.href = url;
                    a.download = fileName; // Sử dụng tên file lấy từ header
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
