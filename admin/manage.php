<?php
// manage.php - Quản lý món ăn
include 'connect_db.php';

// Xóa món ăn, các bước nấu và nguyên liệu liên quan
// Xóa món ăn, các bước nấu và nguyên liệu liên quan
if (isset($_GET['delete'])) {
    $maCongThuc = $_GET['delete'];

    // Xóa nguyên liệu
    $conn->query("DELETE FROM congthuc_nguyenlieu WHERE MaCongThuc = $maCongThuc");

    // Xóa các bước nấu
    $conn->query("DELETE FROM cacbuocnau WHERE MaCongThuc = $maCongThuc");

    // Xóa món ăn
    $conn->query("DELETE FROM congthuc WHERE MaCongThuc = $maCongThuc");

    // Đặt lại AUTO_INCREMENT để đảm bảo ID mới sẽ theo thứ tự đúng
    $result = $conn->query("SELECT MAX(MaCongThuc) AS max_id FROM congthuc");
    $row = $result->fetch_assoc();
    $max_id = $row['max_id'];

    // Cập nhật AUTO_INCREMENT của bảng congthuc
    $conn->query("ALTER TABLE congthuc AUTO_INCREMENT = " . ($max_id + 1));

    echo "<script>alert('Món ăn, các bước nấu và nguyên liệu đã được xóa thành công!');</script>";
    echo "<script>window.location.href='manage.php';</script>";
}
if (isset($_POST['add']) && $_POST['add']) {
    $hinhanh_path = basename($_FILES['anh']['name']);
    // Upload file
    $target_dir = "../main/img/";
    $target_file = $target_dir . $hinhanh_path;
    move_uploaded_file($_FILES["anh"]["tmp_name"], $target_file);
}

if (isset($_POST['add'])) {
    $tenCongThuc = $_POST['tenCongThuc'];
    $moTa = $_POST['moTa'];
    $thoiGianChuanBi = $_POST['thoiGianChuanBi'];
    $tongThoiGianNau = $_POST['tongThoiGianNau'];
    $phucVu = $_POST['phucVu'];
    $tacGia = $_POST['tacGia'];
    if ($_FILES['anh']['name'] != "") $anhChiTiet = $_FILES['anh']['name'];
    else $anhChiTiet = "";
    $nguyenLieu = isset($_POST['nguyenLieu']) ? $_POST['nguyenLieu'] : [];
    $cacBuocNau = $_POST['cacBuocNau'];
    $maLoaiMonAn = $_POST['idloai'];

    // Thêm món ăn vào bảng congthuc
    $sql = "INSERT INTO congthuc (TenCongThuc, MoTa, ThoiGianChuanBi, TongThoiGianNau, PhucVu, MaLoaiMonAn, TacGia, AnhChiTiet) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiiiiss", $tenCongThuc, $moTa, $thoiGianChuanBi, $tongThoiGianNau, $phucVu, $maLoaiMonAn, $tacGia, $anhChiTiet);
    $stmt->execute();
    $maCongThuc = $stmt->insert_id; // Lấy ID của món ăn vừa thêm
    $stmt->close();
    // Thêm nguyên liệu vào bảng congthuc_nguyenlieu
    if (!empty($nguyenLieu)) {
        foreach ($nguyenLieu as $nguyenLieuId) {
            $conn->query("INSERT INTO congthuc_nguyenlieu (MaCongThuc, MaNguyenLieu) VALUES ($maCongThuc, $nguyenLieuId)");
        }
    }

    // Thêm các bước nấu vào bảng cacbuocnau
    if (!empty($cacBuocNau)) {
        $buocThucHien = 1;
        $steps = explode("\n", $cacBuocNau);
        foreach ($steps as $step) {
            $conn->query("INSERT INTO cacbuocnau (MaCongThuc, BuocThucHien, HuongDan) VALUES ($maCongThuc, $buocThucHien, '$step')");
            $buocThucHien++;
        }
    }

    echo "<script>alert('Món ăn đã được thêm thành công!');</script>";
    echo "<script>window.location.href='indexadmin.php';</script>";
}

?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Quản lý món ăn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!-- Thêm CSS cho Select2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/stylemanage.css">
</head>

<body>
    <header>
        <h1>Hệ thống quản lý món ăn</h1>
        <nav>
            <a href="indexadmin.php">Trang chủ Admin</a>
            <a href="manage.php">Quản lý món ăn</a>
            <a href="logout.php">Đăng xuất</a>
        </nav>
    </header>

    <h2>Thêm món ăn mới</h2>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="idloai">Loại món ăn: </label>
            <select name="idloai" id="idloai" class="form-control">
                <?php
                $sl_loai = "Select * from loaimonan";
                $kq_loai = mysqli_query($conn, $sl_loai);
                $id_loai = 0;
                if (isset($_GET['MaLoaiMonAn'])) $id_loai = $_GET['MaLoaiMonAn'];
                while ($d_loai = mysqli_fetch_array($kq_loai)) {
                    if ($id_loai == 0) $id_loai = $d_loai['MaLoaiMonAn'];
                ?>
                    <option value="<?php echo $d_loai['MaLoaiMonAn']; ?>" <?php if ($id_loai == $d_loai['MaLoaiMonAn']) echo "selected"; ?>><?php echo $d_loai['TenLoaiMonAn']; ?></option>
                <?php } ?>
            </select>
            <label for="tenCongThuc">Tên món ăn: </label>
            <input type="text" name="tenCongThuc" class="form-control" placeholder="Tên món ăn" required>
            <label for="moTa">Mô tả món ăn: </label>
            <input type="text" name="moTa" class="form-control" placeholder="Mô tả món ăn" required>
            <label for="thoiGianChuanBi">Thời gian chuẩn bị: </label>
            <input type="number" name="thoiGianChuanBi" class="form-control" placeholder="Thời gian chuẩn bị (phút)" required>
            <label for="tongThoiGianNau">Tổng thời gian nấu: </label>
            <input type="number" name="tongThoiGianNau" class="form-control" placeholder="Tổng thời gian nấu (phút)" required>
            <label for="phucVu">Phục vụ: </label>
            <input type="number" name="phucVu" class="form-control" placeholder="Số phần" required>
            <label for="tacGia">Tác giả: </label>
            <input type="text" name="tacGia" class="form-control" placeholder="Tác giả" required>
            <label for="anh">File ảnh: </label>
            <input type="file" name="anh" class="form-control" required>
            <label for="nguyenLieu">Nguyên liệu:</label><br>
            <select id="nguyenLieu" name="nguyenLieu[]" class="form-control" multiple="multiple" style="width: 100%;" required>
                <?php
                $nguyenLieu_sql = "SELECT * FROM nguyenlieu";
                $nguyenLieu_result = $conn->query($nguyenLieu_sql);
                while ($nguyenLieu = $nguyenLieu_result->fetch_assoc()):
                ?>
                    <option value="<?= $nguyenLieu['MaNguyenLieu'] ?>"><?= htmlspecialchars($nguyenLieu['TenNguyenLieu']) ?></option>
                <?php endwhile; ?>
            </select>

            <label for="cacBuocNau">Các bước nấu:</label>
            <textarea id="cacBuocNau" name="cacBuocNau" class="form-control" placeholder="Nhập các bước nấu, xuống hàng để thêm bước" required></textarea>
            <input type="submit" name="add" class="btn btn-primary mt-3" value="Thêm món ăn"></input>
        </div>
    </form>
    <script>
        function validateForm() {
            // Kiểm tra nguyên liệu
            let nguyenLieu = document.getElementById("nguyenLieu").selectedOptions;
            if (nguyenLieu.length === 0) {
                alert("Vui lòng chọn ít nhất một nguyên liệu.");
                return false;
            }

            // Kiểm tra thời gian chuẩn bị, tổng thời gian nấu và số phần ăn
            let thoiGianChuanBi = document.querySelector("input[name='thoiGianChuanBi']").value;
            let tongThoiGianNau = document.querySelector("input[name='tongThoiGianNau']").value;
            let phucVu = document.querySelector("input[name='phucVu']").value;

            if (thoiGianChuanBi < 0 || tongThoiGianNau < 0 || phucVu <= 0) {
                alert("Thời gian chuẩn bị, tổng thời gian nấu không thể âm và số phần ăn phải lớn hơn 0.");
                return false;
            }

            return true; // Allow form submission if valid
        }
    </script>

    </div>
    </form>



    <!-- Đóng kết nối ở đây -->
    <?php $conn->close(); ?>

    <!-- Thêm JS cho Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        $(document).ready(function() {
            // Khởi tạo Select2 cho ô nguyên liệu
            $('#nguyenLieu').select2({
                placeholder: "Chọn nguyên liệu",
                width: '100%'
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>