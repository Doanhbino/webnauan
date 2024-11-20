<?php
session_start(); // Khởi tạo session
include 'connect_db.php'; // Kết nối cơ sở dữ liệu

// Kiểm tra nếu đã đăng nhập, chuyển đến index.php
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
    header("Location: indexadmin.php");
    exit;
}

// Xử lý khi người dùng gửi form đăng nhập
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Truy vấn cơ sở dữ liệu để kiểm tra thông tin đăng nhập
        $sql = "SELECT * FROM taikhoanadmin WHERE TenDangNhap = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user) {
            // Kiểm tra nếu mật khẩu trong cơ sở dữ liệu là mã hóa MD5
            if (strlen($user['MatKhau']) === 32) { // MD5 có độ dài 32 ký tự
                // So sánh với mật khẩu mã hóa MD5
                if (md5($password) === $user['MatKhau']) {
                    // Đăng nhập thành công
                    $_SESSION['loggedin'] = true;
                    $_SESSION['TenDangNhap'] = $user['TenDangNhap'];
                    header("Location: indexadmin.php"); // Chuyển hướng đến trang index.php
                    exit;
                }
            } else {
                // So sánh với mật khẩu không mã hóa
                if ($password === $user['MatKhau']) {
                    // Đăng nhập thành công
                    $_SESSION['loggedin'] = true;
                    $_SESSION['TenDangNhap'] = $user['TenDangNhap'];
                    header("Location: indexadmin.php"); // Chuyển hướng đến trang index.php
                    exit;
                }
            }
        }

        // Đăng nhập thất bại
        $login_error = "Tên đăng nhập hoặc mật khẩu không đúng.";
    } else {
        $login_error = "Vui lòng điền đầy đủ tên đăng nhập và mật khẩu.";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        .login-container {
            width: 350px;
            padding: 30px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            transform: translateY(-10%);
            border: 1px solid #ddd;
        }

        h2 {
            color: #444;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 500;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            border-color: #00bcd4;
            outline: none;
        }

        button {
            width: 100%;
            padding: 16px;
            margin-bottom: 15px;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-login {
            background-color: #00bcd4; 
        }

        .btn-login:hover {
            background-color: #0097a7; 
        }

        .btn-back {
            background-color: #f44336; 
        }

        .btn-back:hover {
            background-color: #d32f2f; 
        }
        .error {
            color: #f44336;
            margin-top: 15px;
            font-size: 14px;
        }

        .container {
            position: relative;
            background: rgba(0, 0, 0, 0.1);
            padding: 0 10px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="login-container">
            <h2>ĐĂNG NHẬP</h2>
            <form action="login.php" method="post">
                <div class="input-group">
                    <input type="text" name="username" placeholder="Tên đăng nhập" required>
                </div>
                <div class="input-group">
                    <input type="password" name="password" placeholder="Mật khẩu" required>
                </div>
                <button type="submit" class="btn-login">Đăng nhập</button>
                <button type="button" class="btn-back" onclick="window.location.href='../index.php'">Quay lại trang chủ</button>
                <?php if (!empty($login_error)) : ?>
                    <div class="error"><?php echo $login_error; ?></div>
                <?php endif; ?>
            </form>
        </div>
    </div>
</body>

</html>