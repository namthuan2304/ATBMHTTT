<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/sign/form.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Đăng nhập</title>
    <script type="text/javascript">
        var context = "${pageContext.request.contextPath}";

        // Toggle password visibility function
        function togglePassword() {
            var passwordInput = document.getElementById('password');
            var toggleIcon = document.getElementById('toggle-password-icon');
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = "password";
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        $(document).ready(function() {
            $('#btnLogin').click(function (event) {
                event.preventDefault();
                var email = $('#email').val();
                var password = $('#password').val();
                var rememberMe = $('#remember-me').is(':checked');

                $.ajax({
                    type: 'POST',
                    url: 'signin',
                    data: {
                        email: email,
                        password: password,
                        rememberMe: rememberMe
                    },
                    success: function (result) {
                        try {
                            if (result.status === "error") {
                                $('#errorLogin').html(result.message);
                                $('#success').html("");
                            } else if (result.status === "generateKey") {
                                window.location.href = context + "/user/generateKey";
                            } else if (result.status === "success") {
                                window.location.href = context + "/" + result.redirect;
                            } else {
                                console.error("Unexpected response: ", result);
                            }
                        } catch (e) {
                            console.error("Error processing response: ", e);
                            $('#errorLogin').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorLogin').html("Connection errors. Please check your network and try again!");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="body">
        <div class="form-container" style="height: 560px">
            <form id="form" class="sign-in-form" style="margin-top: 14%; transform: translateY(-20%)">
                <h2>Đăng Nhập</h2>
                <span style="color: #66b840;margin-bottom: 10px" id="success">${empty sessionScope.success?'': sessionScope.success}</span>
                <span style="color: red;margin-bottom: 10px" id="errorLogin">${empty loginFail? '': loginFail}</span>
                <div class="input-group">
                    <input type="email" id="email" name="email" placeholder="Email" value="${empty email ? '' : email}" required>
                    <div id="email-error" style="color: red;"></div>
                </div>
                <div style="position: relative" class="input-group position-relative">
                    <input type="password" id="password" name="password" placeholder="Mật khẩu" value="${empty password ? '' : password}" required>
                    <i id="toggle-password-icon" class="fas fa-eye" onclick="togglePassword()" style="cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);"></i>
                    <div id="password-error" style="color: red;"></div>
                </div>
                <div class="terms-checkbox">
                    <input type="checkbox" id="remember-me" name="remember-me" required>
                    <label for="remember-me">Remember me</label>
                </div>
                <button id="btnLogin" type="submit">Đăng Nhập</button>
                <div class="forgot-password">
                    <a href="verify?action=reset" style="color: #66b840">Quên mật khẩu?</a>   |   <a href="verify?action=activated" style="color: #66b840">Chưa xác thực?</a>   |   <a href="verify?action=unlocked" style="color: #66b840">Mở khoá đăng nhập?</a>
                </div>
                <div class="or"><span>Hoặc</span></div>

                <div class="social-icons">
                    <a id="facebook-login-link" href="#">
                        <img src="/assets/user/img/formIcon/facebook-color-icon-2048x2048-bfly1vxr.png" alt="Facebook">
                    </a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/user/signin?apis=Google&response_type=code&client_id=612393162835-dp8fc3bvhdt9g8139uv41umfu0bbgefv.apps.googleusercontent.com&prompt=select_account">
                        <img src="/assets/user/img/formIcon/gg.png" alt="Google">
                    </a>
                    <a href="https://discord.com/oauth2/authorize?client_id=1255854814747689012&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2Fsignin%3Fapis%3DDiscord&scope=email+identify+connections+guilds+gdm.join+guilds.join">
                        <img src="/assets/user/img/formIcon/images.png" alt="Discord">
                    </a>
                    <a id="x-login-link" href="#">
                        <img src="/assets/user/img/formIcon/1707222563twitter-logo-png.png" alt="Twitter">
                    </a>
                    <a href="https://github.com/login/oauth/authorize?client_id=Ov23liEQTsu7hXzeN2mH">
                        <img src="/assets/user/img/formIcon/25231.png" alt="Github">
                    </a>
                </div>

                <div class="register-link">
                    Bạn chưa có tài khoản? <a href="signup">Đăng ký</a>
                </div>
            </form>

        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>

<script src="/assets/user/js/sign/scipts.js"></script>
</body>
</html>
