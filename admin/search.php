<?php
// search.php
include 'connect_db.php';

$searchQuery = '';
$message = '';
$searchResults = [];

if (isset($_POST['search'])) {
    $searchQuery = $_POST['searchQuery'];
    
    if (empty($searchQuery)) {
        $message = "Vui lòng nhập tên món ăn để tìm kiếm.";
    } else {
        // Truy vấn tìm kiếm món ăn với nguyên liệu và các bước nấu
        $searchQuery = $conn->real_escape_string($searchQuery);
        
        // Lấy các công thức tìm kiếm cùng với nguyên liệu
        $sql = "
            SELECT c.MaCongThuc, c.TenCongThuc, c.MoTa, c.ThoiGianChuanBi, c.TongThoiGianNau, c.PhucVu, c.TacGia, c.Anh,
                GROUP_CONCAT(n.TenNguyenLieu SEPARATOR ', ') AS NguyenLieu
            FROM congthuc c
            LEFT JOIN congthuc_nguyenlieu cn ON c.MaCongThuc = cn.MaCongThuc
            LEFT JOIN nguyenlieu n ON cn.MaNguyenLieu = n.MaNguyenLieu
            WHERE c.TenCongThuc LIKE '%$searchQuery%'
            GROUP BY c.MaCongThuc
            ORDER BY c.MoTa ASC;
        ";
        $result = $conn->query($sql);

        // Lấy các bước nấu của công thức
        $steps_sql = "SELECT * FROM cacbuocnau WHERE MaCongThuc IN (SELECT MaCongThuc FROM congthuc WHERE TenCongThuc LIKE '%$searchQuery%') ORDER BY MaCongThuc, BuocThucHien";
        $steps_result = $conn->query($steps_sql);
        $steps_all = [];
        while ($step = $steps_result->fetch_assoc()) {
            $steps_all[$step['MaCongThuc']][] = $step;
        }

        // Lưu kết quả
        if ($result->num_rows > 0) {
            $searchResults = $result->fetch_all(MYSQLI_ASSOC);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .table th, .table td {
            text-align: center;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        .navbar-nav a:hover { 
            text-decoration: underline; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hệ thống tìm kiếm món ăn</h1>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="indexadmin.php">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="list.php">Danh sách món ăn</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manage.php">Quản lý món ăn</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="logout.php">Đăng xuất</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Thanh tìm kiếm -->
        <div class="search-bar">
            <form method="post" action="" class="d-flex">
                <input type="text" class="form-control me-2" name="searchQuery" placeholder="Nhập tên món ăn..." value="<?php echo htmlspecialchars($searchQuery); ?>">
                <button type="submit" name="search" class="btn btn-outline-success">Tìm kiếm</button>
            </form>
        </div>

        <!-- Hiển thị kết quả tìm kiếm -->
        <?php if (!empty($searchQuery)): ?>
            <h3>Kết quả tìm kiếm cho: "<?php echo htmlspecialchars($searchQuery); ?>"</h3>
            <?php if (!empty($searchResults)): ?>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Tên món ăn</th>
                            <th>Mô tả</th> <!-- Thêm cột mô tả -->
                            <th>Nguyên liệu</th>
                            <th>Cách bước nấu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($searchResults as $row): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['TenCongThuc']); ?></td>
                                <td><?php echo isset($row['MoTa']) ? nl2br(htmlspecialchars($row['MoTa'])) : 'Chưa có mô tả'; ?></td>
                                <td><?php echo isset($row['NguyenLieu']) ? nl2br(htmlspecialchars($row['NguyenLieu'])) : 'Chưa có nguyên liệu'; ?></td>
                                <td>
                                    <?php if (isset($steps_all[$row['MaCongThuc']])): ?>
                                        <ul>
                                            <?php foreach ($steps_all[$row['MaCongThuc']] as $step): ?>
                                                <li><strong>Bước <?= $step['BuocThucHien'] ?>:</strong> <?= htmlspecialchars($step['HuongDan']) ?></li>
                                            <?php endforeach; ?>
                                        </ul>
                                    <?php else: ?>
                                        <p>Chưa có bước nấu</p>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>Không tìm thấy kết quả nào.</p>
            <?php endif; ?>
        <?php endif; ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<?php
// Đóng kết nối
$conn->close();
?>
