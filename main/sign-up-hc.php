<?php
// Bắt đầu session để xử lý đăng ký
session_start();

// Thông tin kết nối cơ sở dữ liệu
include("../admin/connect_db.php");

// Kiểm tra nếu có dữ liệu được gửi từ form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = $_POST['TenDangNhap'];
  $password = $_POST['MatKhau'];

  // Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu
  $hashed_password = password_hash($password, PASSWORD_DEFAULT);

  // Kiểm tra nếu tên đăng nhập đã tồn tại trong cơ sở dữ liệu
  $check_username = $conn->prepare("SELECT * FROM taikhoan WHERE TenDangNhap = ?");
  $check_username->bind_param("s", $username);
  $check_username->execute();
  $result = $check_username->get_result();

  if ($result->num_rows > 0) {
    echo "<script>alert('Tên đăng nhập đã tồn tại!');</script>";
  } else {
    // Chèn dữ liệu vào bảng taikhoan
    $sql = $conn->prepare("INSERT INTO taikhoan (TenDangNhap, MatKhau) VALUES (?, ?)");
    $sql->bind_param("ss", $username, $hashed_password);

    if ($sql->execute()) {
      echo "<script>alert('Tạo tài khoản thành công!');</script>";
      header("Location: sign-in.php"); // Chuyển hướng về trang đăng nhập sau khi đăng ký thành công
      exit();
    } else {
      echo "<script>alert('Lỗi: " . $sql->error . "');</script>";
    }
  }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Đăng ký tài khoản</title>
  <link rel="shortcut icon" type="image/png" href="img/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&amp;display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="css/style.css">
  <script src="js/uikit.js"></script>
</head>

<body>

  <nav class="uk-navbar-container uk-letter-spacing-small">
    <div class="uk-container">
      <div class="uk-position-z-index" data-uk-navbar>
        <div class="uk-navbar-left">
          <a class="uk-navbar-item uk-logo" href="../index.php">Nấu ăn không khó</a>
          <ul class="uk-navbar-nav uk-visible@m uk-margin-large-left">
            <li><a href="../index.php">Trang Chủ</a></li>
            <li><a href="recipe.php">Công Thức</a></li>
            <li><a href="search.php">Tìm Kiếm</a></li>
            <li><a href="contact.php">Liên Hệ</a></li>
          </ul>
        </div>
        <div class="uk-navbar-right">
          <ul class="uk-navbar-nav uk-visible@m">
            <li><a href="sign-in.php">Sign In</a></li>
          </ul>
          <div class="uk-navbar-item">
            <div><a class="uk-button uk-button-primary" href="sign-up.php">Đăng ký</a></div>
          </div>
          <a class="uk-navbar-toggle uk-hidden@m" href="#offcanvas" data-uk-toggle><span data-uk-navbar-toggle-icon></span></a>
        </div>
      </div>
    </div>
  </nav>

  <div class="uk-section uk-section-default uk-padding-remove-top">
    <div class="uk-container">
      <div class="uk-grid-large" data-uk-grid>
        <div class="uk-width-1-2@m uk-flex uk-flex-middle">
          <div>
            <h1 class="uk-margin-bottom">Đăng ký tài khoản</h1>
            <p>Chào mừng bạn đến với trang web của chúng tôi! Hãy tạo một tài khoản để bắt đầu sử dụng các dịch vụ và chia sẻ những công thức yêu thích của bạn.</p>
          </div>
        </div>
        <form id="signupForm" method="POST" class="uk-form-stacked uk-width-1-2@m uk-margin-auto">
          <div class="uk-margin-bottom">
            <label class="uk-form-label" for="TenDangNhap">Tên đăng nhập</label>
            <div class="uk-form-controls">
              <input id="TenDangNhap" class="uk-input uk-border-pill" name="TenDangNhap" type="text" required>
            </div>
          </div>
          <div class="uk-margin-bottom">
            <label class="uk-form-label" for="MatKhau">Mật khẩu</label>
            <div class="uk-form-controls">
              <input id="MatKhau" class="uk-input uk-border-pill" name="MatKhau" type="password" required>
            </div>
          </div>
          <div class="uk-text-center">
            <button type="submit" class="uk-button uk-button-primary uk-border-pill uk-width-1-1">Đăng ký</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <footer class="uk-section uk-section-default">
    <div class="uk-container uk-text-secondary uk-text-500">
      <div class="uk-child-width-1-2@s" data-uk-grid>
        <div>
          <a href="#" class="uk-logo">Nấu ăn không khó</a>
        </div>
        <div class="uk-flex uk-flex-middle uk-flex-right@s">
          <div data-uk-grid class="uk-child-width-auto uk-grid-small">
            <div>
              <a href="https://www.facebook.com/" data-uk-icon="icon: facebook; ratio: 0.8" class="uk-icon-button facebook" target="_blank"></a>
            </div>
            <div>
              <a href="https://www.instagram.com/" data-uk-icon="icon: instagram; ratio: 0.8" class="uk-icon-button instagram" target="_blank"></a>
            </div>
            <div>
              <a href="mailto:info@blacompany.com" data-uk-icon="icon: twitter; ratio: 0.8" class="uk-icon-button twitter" target="_blank"></a>
            </div>
          </div>
        </div>
      </div>
      <div class="uk-child-width-1-2@s uk-child-width-1-4@m" data-uk-grid>
        <div>
          <ul class="uk-list uk-text-small">
            <li><a class="uk-link-text" href="#">Thuyết trình</a></li>
            <li><a class="uk-link-text" href="#">Chuyên gia</a></li>
            <li><a class="uk-link-text" href="#">Cửa hàng</a></li>
          </ul>
        </div>
        <div>
          <ul class="uk-list uk-text-small">
            <li><a class="uk-link-text" href="#">Hội thảo trực tuyến</a></li>
            <li><a class="uk-link-text" href="#">Hội thảo</a></li>
            <li><a class="uk-link-text" href="#">Gặp mặt địa phương</a></li>
          </ul>
        </div>
        <div>
          <ul class="uk-list uk-text-small">
            <li><a class="uk-link-text" href="#">Sáng kiến của chúng tôi</a></li>
            <li><a class="uk-link-text" href="#">Đóng góp</a></li>
            <li><a class="uk-link-text" href="#">Cộng đồng</a></li>
          </ul>
        </div>
        <div>
          <ul class="uk-list uk-text-small">
            <li><a class="uk-link-text" href="#">Mẫu liên hệ</a></li>
            <li><a class="uk-link-text" href="#">Hợp tác với chúng tôi</a></li>
            <li><a class="uk-link-text" href="#">Mẫu liên hệ</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

</body>

</html>