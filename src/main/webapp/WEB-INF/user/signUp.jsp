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
    <title>Đăng ký</title>
    <script type="text/javascript">
        var context = "${pageContext.request.contextPath}";
        $(document).ready(function() {
            $('#btnRegister').click(function (event) {
                event.preventDefault();
                var username = $('#username').val();
                var email = $('#email-forgot').val();
                var password = $('#password').val();
                var rePassword = $('#rePassword').val();
                var roleId = $('#roleId').val();
                var agree_terms = $('#agree-terms').is(':checked');

                $.ajax({
                    type: 'POST',
                    data: {
                        username: username,
                        email: email,
                        password: password,
                        rePassword: rePassword,
                        roleId: roleId,
                        agree_terms: agree_terms
                    },
                    url: 'signup',
                    success: function (result) {
                        try {
                            if (result.status !== "success") {
                                $('#errorRegister').html(result.error);
                            } else {
                                window.location.href = context + "/user/verify";
                            }
                        } catch (e) {
                            $('#errorRegister').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorRegister').html("Connection errors. Please check your network and try again!");
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
        <div class="form-container">
            <form id="form" class="signup-form">
                <h2>Đăng Ký</h2>
                <span style="color: red;margin-bottom: 10px" id="errorRegister"></span>
                <div class="input-group">
                    <input type="text" id="username" name="username" placeholder="Tên người dùng" required>
                </div>
                <div class="input-group">
                    <input type="email" id="email-forgot" name="email" placeholder="Email" required>
                </div>
                <div id="email-error" style="color: red;"></div>
                <div class="input-group">
                    <input id="password" type="password" placeholder="Nhập mật khẩu mới" name="password" required>
                </div>
                <div class="input-group">
                    <input id="rePassword" type="password" placeholder="Nhập lại mật khẩu mới" name="rePassword" required>
                </div>
                <div class="terms-checkbox">
                    <input type="checkbox" id="agree-terms" name="agree-terms" required>
                    <label for="agree-terms">Tôi đồng ý với điều khoản dịch vụ và chính sách bảo mật</label>
                </div>
                <input id="roleId" type="hidden" name="roleId" value="1">
                <button id="btnRegister" type="submit">Đăng Ký</button>
                <div class="login-link">Bạn đã có tài khoản? <a href="${request.servletContext.contextPath}/user/signin">Đăng nhập</a></div>
            </form>
        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="/assets/user/js/sign/scipts.js"></script>
</body>
</html>