<?php
// Bắt đầu session để kiểm tra nếu người dùng đã đăng nhập
session_start();

// Kiểm tra xem người dùng đã đăng nhập chưa
if (!isset($_SESSION['TenDangNhap'])) {
  // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
  header("Location:sign-in.php");
  exit();
}

include("../admin/connect_db.php");

// Kiểm tra nếu có dữ liệu được gửi
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = $_POST['name'];
  $email = $_POST['_replyto'];
  $message = $_POST['message'];

  // Chèn dữ liệu vào bảng contacts
  $sql = "INSERT INTO contacts (name, email, message) VALUES ('$name', '$email', '$message')";

  if ($conn->query($sql) === TRUE) {
    echo "<script>alert('Thông tin đã được gửi thành công!');</script>";
  } else {
    echo "<script>alert('Lỗi: " . $sql . "<br>" . $conn->error . "');</script>";
  }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Nấu ăn không khó</title>
  <link rel="shortcut icon" type="image/png" href="img/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&amp;display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Leckerli+One&amp;display=swap" rel="stylesheet">
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
            <li><a href="../index.php">Trang chủ</a></li>
            <li><a href="recipe.php">Công thức</a></li>
            <li><a href="search.php">Tìm kiếm</a></li>
            <li class="uk-active"><a href="contact.php">Liên hệ</a></li>
          </ul>
        </div>
        <div class="uk-navbar-right">
          <ul class="uk-navbar-nav uk-visible@m">
            <?php
            if (isset($_SESSION['TenDangNhap'])) {
              // Nếu đã đăng nhập, hiển thị nút Đăng xuất
              echo '<li><a href="../admin/logout.php">Đăng xuất</a></li>';
            } else {
              // Nếu chưa đăng nhập, hiển thị nút Đăng nhập
              echo '<li><a href="./sign-in.php">Đăng nhập</a></li>';
            }
            ?>
          </ul>
          <div class="uk-navbar-item bg">
            <div><a class="uk-button uk-button-primary" href="../admin/indexadmin.php">Quản trị viên</a></div>
          </div>
          <a class="uk-navbar-toggle uk-hidden@m" href="#offcanvas" data-uk-toggle><span
              data-uk-navbar-toggle-icon></span></a>
        </div>
  </nav>

  <div class="uk-section uk-section-default uk-padding-remove-top">
    <div class="uk-container">
      <div class="uk-grid-large" data-uk-grid>
        <div class="uk-width-1-2@m uk-flex uk-flex-middle">
          <div>
            <h1 class="uk-margin-bottom">Xin chào! Chúng tôi sẵn sàng lắng nghe bạn</h1>
            <p><b>Chào mừng bạn đến với thế giới ẩm thực!</b> Tại đây, chúng tôi không chỉ chia sẻ những công thức nấu ăn ngon mà còn mang đến trải nghiệm ẩm thực độc đáo. Hãy cùng khám phá các món ăn đa dạng từ khắp nơi trên thế giới, học hỏi kỹ thuật nấu ăn và chia sẻ đam mê ẩm thực của bạn với cộng đồng. Chúng tôi cam kết cung cấp những công thức dễ thực hiện, nguyên liệu tươi ngon và mẹo vặt hữu ích để mỗi bữa ăn trở thành một kỷ niệm đáng nhớ.</p>
          </div>
        </div>
        <form id="contactForm" method="POST" class="uk-form-stacked uk-width-1-2@m uk-margin-auto">
          <div class="uk-margin-bottom">
            <label class="uk-form-label" for="name">Name</label>
            <div class="uk-form-controls">
              <input id="name" class="uk-input uk-border-pill" name="name" type="text" required>
            </div>
          </div>
          <div class="uk-margin-bottom">
            <label class="uk-form-label" for="_replyto">Email</label>
            <div class="uk-form-controls">
              <input id="_replyto" class="uk-input uk-border-pill" name="_replyto" type="email" required>
            </div>
          </div>
          <div class="uk-margin-bottom">
            <label class="uk-form-label" for="message">Message</label>
            <div class="uk-form-controls">
              <textarea id="message" class="uk-textarea uk-border-rounded" name="message" rows="5" minlength="10" required></textarea>
            </div>
          </div>
          <div class="uk-text-center">
            <button type="submit" class="uk-button uk-button-primary uk-border-pill uk-width-1-1">Send Message</button>
          </div>
        </form>
        <div id="responseMessage"></div>
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
      <div class="uk-margin-medium-top uk-text-small uk-text-center">
        Made by group 9
      </div>
    </div>
  </footer>

</body>

</html>