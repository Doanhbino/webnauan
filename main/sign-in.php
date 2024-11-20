<?php
session_start();
if (isset($_SESSION['TenDangNhap'])) {
  header("Location: ../index.php");
  exit();
}

include("../admin/connect_db.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {


  // Lấy dữ liệu từ form
  $TenDangNhap = $_POST['TenDangNhap'];
  $MatKhau = $_POST['MatKhau'];

  // Truy vấn lấy thông tin người dùng
  $sql = "SELECT * FROM taikhoan WHERE TenDangNhap = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("s", $TenDangNhap);  // "s" là kiểu dữ liệu chuỗi
  $stmt->execute();
  $result = $stmt->get_result();

  // Kiểm tra nếu người dùng tồn tại
  if ($result->num_rows > 0) {
    // Lấy thông tin người dùng
    $user = $result->fetch_assoc();

    // Kiểm tra mật khẩu đã mã hóa
    if (password_verify($MatKhau, $user['MatKhau'])) {
      // Đăng nhập thành công
      $_SESSION['TenDangNhap'] = $TenDangNhap; // Lưu tên đăng nhập vào session
      header("Location: ../index.php"); // Điều hướng đến trang contact.php
      exit();
    } else {
      $error_message = "Mật khẩu không đúng.";
    }
  } else {
    $error_message = "Tên đăng nhập không tồn tại.";
  }

  // Đóng kết nối
  $stmt->close();
  $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Nấu ăn không khó</title>
  <link rel="shortcut icon" type="image/png" href="img/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&amp;display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="css/style.css">
  <script src="js/uikit.js"></script>
</head>

<body>
  <!-- header -->
  <nav class="uk-navbar-container uk-letter-spacing-small">
    <div class="uk-container">
      <div class="uk-position-z-index" data-uk-navbar>
        <div class="uk-navbar-left">
          <a class="uk-navbar-item uk-logo" href="../index.php">Nấu ăn không khó</a>
          <ul class="uk-navbar-nav uk-visible@m uk-margin-large-left">
            <li><a href="../index.php">Trang chủ</a></li>
            <li><a href="recipe.php">Công thức</a></li>
            <li><a href="search.php">Tìm kiếm</a></li>
            <li><a href="contact.php">Liên hệ</a></li>
          </ul>
        </div>
        <div class="uk-navbar-right">
          <ul class="uk-navbar-nav uk-visible@m">
            <li class="uk-active"><a href="sign-in.php">Đăng nhập</a></li>
          </ul>
          <div class="uk-navbar-item">
            <div><a class="uk-button uk-button-primary" href="../admin/indexadmin.php">Quản trị viên</a></div>
          </div>
          <a class="uk-navbar-toggle uk-hidden@m" href="#offcanvas" data-uk-toggle><span
              data-uk-navbar-toggle-icon></span></a>
        </div>
      </div>
    </div>
  </nav>
  <!--  end header -->
  <div class="uk-grid-collapse" data-uk-grid>
    <div class="uk-width-1-2@m uk-padding-large uk-flex uk-flex-middle uk-flex-center" data-uk-height-viewport>
      <div class="uk-width-3-4@s">
        <div class="uk-text-center uk-margin-bottom">
          <a class="uk-logo uk-text-primary uk-text-bold" href="index-2.html">Nấu ăn không khó</a>
        </div>
        <div class="uk-text-center uk-margin-medium-bottom">
          <h1 class="uk-h2 uk-letter-spacing-small">Sign In</h1>
        </div>
        <div data-uk-grid class="uk-child-width-auto uk-grid-small uk-flex uk-flex-center uk-margin">
          <div><a href="#" data-uk-icon="icon: facebook" class="uk-icon-button uk-icon-button-large facebook"></a></div>
          <div><a href="#" data-uk-icon="icon: google-plus" class="uk-icon-button uk-icon-button-large google-plus"></a></div>
          <div><a href="#" data-uk-icon="icon: linkedin" class="uk-icon-button uk-icon-button-large linkedin"></a></div>
        </div>
        <div class="uk-text-center uk-margin">
          <p class="uk-margin-remove">Sử dụng tài khoản của bạn</p>
        </div>

        <!-- Form đăng nhập -->
        <form class="uk-text-center" method="post" action="">
          <div class="uk-width-1-1 uk-margin">
            <label class="uk-form-label" for="TenDangNhap">Tên đăng nhập</label>
            <input id="TenDangNhap" name="TenDangNhap" class="uk-input uk-form-large uk-border-pill uk-text-center" type="text" placeholder="Tên đăng nhập" required>
          </div>
          <div class="uk-width-1-1 uk-margin">
            <label class="uk-form-label" for="MatKhau">Mật khẩu</label>
            <input id="MatKhau" name="MatKhau" class="uk-input uk-form-large uk-border-pill uk-text-center" type="password" placeholder="Mật khẩu" required>
          </div>
          <div class="uk-width-1-1 uk-margin uk-text-center">
            <a class="uk-text-small uk-link-muted" href="#">Quên mật khẩu?</a>
          </div>
          <div class="uk-width-1-1 uk-text-center">
            <button class="uk-button uk-button-primary uk-button-large" type="submit">Đăng Nhập</button>
          </div>
        </form>

        <?php
        // Hiển thị thông báo lỗi nếu có
        if (isset($error_message)) {
          echo "<p style='color: red; text-align: center;'>$error_message</p>";
        }
        ?>
      </div>
    </div>
    <div class="uk-width-1-2@m uk-padding-large uk-flex uk-flex-middle uk-flex-center uk-light" data-uk-height-viewport>
      <div class="uk-background-cover uk-background-norepeat uk-background-blend-overlay uk-background-overlay uk-border-rounded-large uk-width-1-1 uk-height-xlarge uk-flex uk-flex-middle uk-flex-center" style="background-image: url(https://source.unsplash.com/7MAjXGUmaPw/600x700);">
        <div class="uk-padding-large">
          <div class="uk-text-center">
            <h2 class="uk-letter-spacing-small">Xin chào, tham gia cùng chúng tôi</h2>
          </div>
          <div class="uk-margin-top uk-margin-medium-bottom uk-text-center">
            <p>Nhập thông tin cá nhân của bạn và tham gia cộng đồng nấu ăn</p>
          </div>
          <div class="uk-width-1-1 uk-text-center">
            <a href="sign-up-hc.php" class="uk-button uk-button-primary uk-button-large">Sign Up</a>
          </div>
        </div>
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
            <li><a class="uk-link-text" href="#">Thăm chúng tôi</a></li>
          </ul>
        </div>
      </div>
      <div class="uk-margin-medium-top uk-text-small uk-text-muted">
        <div>Make by group 9</div>
      </div>
    </div>
  </footer>
  <!-- end footer  -->
</body>

</html>