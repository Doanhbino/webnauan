document.getElementById('contactForm').addEventListener('submit', function(e) {
    e.preventDefault(); // Ngăn chặn hành động gửi mặc định

    // Lấy dữ liệu từ biểu mẫu
    const formData = new FormData(this);

    // Gửi dữ liệu đến send_email.php
    fetch('send_email.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text(); // Chuyển đổi phản hồi thành văn bản
    })
    .then(data => {
        // Hiển thị thông báo thành công
        document.getElementById('responseMessage').innerText = 'Message sent successfully!';

        // Chuyển hướng về trang data.php
        setTimeout(() => {
            window.location.href = 'data.php'; // Chuyển đến trang data.php
        }, 3000); // Thời gian chờ 3 giây
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        // Hiển thị thông báo lỗi
        document.getElementById('responseMessage').innerText = 'There was an error sending your message. Please try again.';
    });
});
