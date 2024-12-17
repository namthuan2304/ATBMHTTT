<%--
  Created by IntelliJ IDEA.
  User: Thanh Sang
  Date: 12/17/2024
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Generate Key Lost</title>
  </head>
  <body>
  <c:choose>
    <c:when test="${empty sessionScope.linkKey}">
      <p>Hết hạn</p>
    </c:when>

  </c:choose>

  </body>
  <script>
    // Hàm tải private key từ server
    function downloadPrivateKey() {
      // Tạo AbortController để hủy request
      const controller = new AbortController();
      const signal = controller.signal;

      // Set timeout để hủy request sau 30 giây
      const timeout = setTimeout(() => {
        controller.abort(); // Hủy request
        console.warn('Request bị hủy sau 30 giây.');
        alert('Hết thời gian tải private key.');
      }, 30000); // 30 giây

      // Thực hiện fetch request
      fetch('/user/generateKeyLost?download=true', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        signal: signal // Truyền signal từ AbortController vào fetch
      })
              .then(response => {
                if (response.ok) {
                  const contentDisposition = response.headers.get('Content-Disposition');
                  const fileNameMatch = contentDisposition && contentDisposition.match(/filename="(.+)"/);
                  const fileName = fileNameMatch ? fileNameMatch[1] : 'private_key.pem';

                  return response.blob().then(blob => ({ blob, fileName }));
                } else {
                  throw new Error('Lỗi khi tải private key.');
                }
              })
              .then(({ blob, fileName }) => {
                // Tạo URL từ blob và tải file xuống
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                a.download = fileName;
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);

                // Xóa timeout vì request đã thành công
                clearTimeout(timeout);
                alert('Private key đã được tải xuống thành công!');
              })
              .catch(error => {
                if (error.name === 'AbortError') {
                  console.error('Request đã bị hủy:', error);
                } else {
                  console.error('Error downloading private key:', error);
                  alert('Đã xảy ra lỗi khi tải private key.');
                }
              });
    }

  </script>
</html>
