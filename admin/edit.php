<?php
// edit.php - Chỉnh sửa món ăn
include 'connect_db.php';

// Kiểm tra nếu có ID món ăn
if (isset($_GET['id'])) $maCongThuc = $_GET['id'];

// Lấy thông tin món ăn từ cơ sở dữ liệu
$sql = "SELECT * FROM congthuc WHERE MaCongThuc = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $maCongThuc);
$stmt->execute();
$result = $stmt->get_result();
$monAn = $result->fetch_assoc();

if (isset($_POST['add']) && $_POST['add']) {
    // Kiểm tra và xử lý ảnh mới nếu có
    if ($_FILES['anh']['name'] != "") {
        $hinhanh_path = basename($_FILES['anh']['name']);
        // Upload file
        $target_dir = "../main/img/";
        $target_file = $target_dir . $hinhanh_path;
        move_uploaded_file($_FILES["anh"]["tmp_name"], $target_file);
        $anhChiTiet = $hinhanh_path; // Cập nhật ảnh mới
    } else {
        $anhChiTiet = $monAn['AnhChiTiet']; // Giữ ảnh cũ nếu không thay đổi
    }
}

// Nếu form được gửi, cập nhật món ăn
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tenCongThuc = $_POST['tenCongThuc'];
    $moTa = $_POST['moTa'];
    $thoiGianChuanBi = $_POST['thoiGianChuanBi'];
    $tongThoiGianNau = $_POST['tongThoiGianNau'];
    $phucVu = $_POST['phucVu'];
    $tacGia = $_POST['tacGia'];


    // Cập nhật thông tin vào database
    $sqlUpdate = "UPDATE congthuc SET TenCongThuc = ?, MoTa = ?, ThoiGianChuanBi = ?, TongThoiGianNau = ?, PhucVu = ?, TacGia = ?, AnhChiTiet = ? WHERE MaCongThuc = ?";
    $stmtUpdate = $conn->prepare($sqlUpdate);
    $stmtUpdate->bind_param('ssiisssi', $tenCongThuc, $moTa, $thoiGianChuanBi, $tongThoiGianNau, $phucVu, $tacGia, $anhChiTiet, $maCongThuc);
    $stmtUpdate->execute();

    // Feedback message
    $successMessage = $stmtUpdate->affected_rows > 0 ? "Món ăn đã được cập nhật thành công!" : "Có lỗi xảy ra! Vui lòng thử lại.";

    // Redirect to the homepage after successful update
    if ($stmtUpdate->affected_rows > 0) {
        header("Location: indexadmin.php"); // Replace 'index.php' with the homepage URL
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa món ăn</title>
    <link rel="stylesheet" href="./css/styleedit.css">
</head>

<body>

    <div class="container">
        <h1>Chỉnh sửa món ăn</h1>

        <!-- Success or Error Message -->
        <?php if (isset($successMessage)): ?>
            <div class="alert <?= strpos($successMessage, 'thành công') !== false ? 'success' : 'error' ?>">
                <?= $successMessage ?>
            </div>
        <?php endif; ?>

        <!-- Nút đóng -->
        <button class="close-btn" onclick="window.location.href = '<?php echo $_SERVER['HTTP_REFERER'] ?? 'indexadmin.php'; ?>';">X</button>

        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="tenCongThuc">Tên món ăn:</label>
                <input type="text" name="tenCongThuc" value="<?= htmlspecialchars($monAn['TenCongThuc']) ?>" required>
            </div>

            <div class="form-group">
                <label for="moTa">Mô tả:</label>
                <textarea name="moTa" required><?= htmlspecialchars($monAn['MoTa']) ?></textarea>
            </div>

            <div class="form-group row">
                <div>
                    <label for="thoiGianChuanBi">Thời gian chuẩn bị (phút):</label>
                    <input type="number" name="thoiGianChuanBi" value="<?= $monAn['ThoiGianChuanBi'] ?>" required>
                </div>
                <div>
                    <label for="tongThoiGianNau">Tổng thời gian nấu (phút):</label>
                    <input type="number" name="tongThoiGianNau" value="<?= $monAn['TongThoiGianNau'] ?>" required>
                </div>
            </div>

            <div class="form-group row">
                <div>
                    <label for="phucVu">Số phần ăn:</label>
                    <input type="number" name="phucVu" value="<?= $monAn['PhucVu'] ?>" required>
                </div>
                <div>
                    <label for="tacGia">Tác giả:</label>
                    <input type="text" name="tacGia" value="<?= htmlspecialchars($monAn['TacGia']) ?>" required>
                </div>
            </div>
            <div class="show-image">
                <?php
                $sql2 = "SELECT AnhChiTiet FROM congthuc WHERE MaCongThuc = $maCongThuc";
                $kq = mysqli_query($conn, $sql2);
                while ($d = mysqli_fetch_array($kq)) {
                ?>
                    <img src="../main/img/<?php echo $d['AnhChiTiet']; ?>" alt="AnhChitTiet" width="150px">
                <?php } ?>
            </div>
            <div class="form-group">
                <label for="anh">Thay đổi ảnh:</label>
                <input type="file" name="anh" value="<?= htmlspecialchars($monAn['AnhChiTiet']) ?>">
            </div>

            <input type="submit" name="add" value="Cập nhật món ăn">
        </form>

        <div class="form-footer">
            <p><span class="highlight">Lưu ý:</span> Mọi thay đổi sẽ được lưu lại ngay khi bạn nhấn "Cập nhật món ăn".</p>
        </div>
    </div>

</body>

</html>