<?php
session_start();
include 'connect_db.php';
// Kiểm tra nếu chưa đăng nhập, chuyển hướng về trang login.php
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.php");
    exit;
}
$searchQuery = '';
// Xử lý xóa món ăn
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    // Xóa các bước nấu
    $delete_steps_sql = "DELETE FROM cacbuocnau WHERE MaCongThuc = ?";
    $stmt = $conn->prepare($delete_steps_sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
    // Xóa các nguyên liệu liên kết
    $delete_ingredients_sql = "DELETE FROM congthuc_nguyenlieu WHERE MaCongThuc = ?";
    $stmt = $conn->prepare($delete_ingredients_sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
    // Xóa công thức
    $delete_recipe_sql = "DELETE FROM congthuc WHERE MaCongThuc = ?";
    $stmt = $conn->prepare($delete_recipe_sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
    header("Location: indexadmin.php");
    exit;
}
// Xử lý tìm kiếm
if (isset($_GET['query']) && !empty($_GET['query'])) {
    $searchQuery = $conn->real_escape_string($_GET['query']);
    $sql = "SELECT c.MaCongThuc, c.TenCongThuc, c.MoTa, c.TongThoiGianNau, c.AnhChiTiet,
            GROUP_CONCAT(n.TenNguyenLieu SEPARATOR ', ') AS NguyenLieu
            FROM congthuc c
            LEFT JOIN congthuc_nguyenlieu cn ON c.MaCongThuc = cn.MaCongThuc
            LEFT JOIN nguyenlieu n ON cn.MaNguyenLieu = n.MaNguyenLieu
            WHERE c.TenCongThuc REGEXP '$searchQuery'
            GROUP BY c.MaCongThuc
            ORDER BY c.MaCongThuc DESC";
    $result = $conn->query($sql);
    // Lấy các bước nấu
    $steps_result = $conn->query("SELECT * FROM cacbuocnau ORDER BY MaCongThuc, BuocThucHien");
    $steps_all = [];
    while ($step = $steps_result->fetch_assoc()) {
        $steps_all[$step['MaCongThuc']][] = $step;
    }
} else {
    $sql = "SELECT c.MaCongThuc, c.TenCongThuc, c.MoTa, c.TongThoiGianNau, c.AnhChiTiet,
            GROUP_CONCAT(n.TenNguyenLieu SEPARATOR ', ') AS NguyenLieu
            FROM congthuc AS c
            LEFT JOIN congthuc_nguyenlieu AS cn ON c.MaCongThuc = cn.MaCongThuc
            LEFT JOIN nguyenlieu AS n ON cn.MaNguyenLieu = n.MaNguyenLieu
            GROUP BY c.MaCongThuc
            ORDER BY c.MaCongThuc DESC";
    $result = $conn->query($sql);
    // Lấy các bước nấu
    $steps_result = $conn->query("SELECT * FROM cacbuocnau ORDER BY MaCongThuc, BuocThucHien");
    $steps_all = [];
    while ($step = $steps_result->fetch_assoc()) {
        $steps_all[$step['MaCongThuc']][] = $step;
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống quản lý món ăn</title>
    <link rel="stylesheet" href="./css/styleindexadmin.css">
</head>

<body>
    <header>
        <h1>Hệ thống quản lý món ăn</h1>
        <nav>
            <a href="../index.php">Trang chủ User</a> |
            <a href="indexadmin.php">Trang chủ Admin</a> |
            <a href="manage.php">Quản lý món ăn</a> |
            <a href="logout.php">Đăng xuất</a>
        </nav>
    </header>
    <form action="indexadmin.php" method="GET">
        <input type="text" name="query" placeholder="Tìm kiếm món ăn..." value="<?php echo htmlspecialchars($searchQuery); ?>">
        <button type="submit">Tìm kiếm</button>
    </form>
    <?php if (!empty($searchQuery)): ?>
        <h3>Kết quả tìm kiếm cho: "<?php echo htmlspecialchars($searchQuery); ?>"</h3>
        <?php if ($result && $result->num_rows > 0): ?>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>STT</th>
                    <th>Tên món ăn</th>
                    <th>Mô tả</th>
                    <th>Nguyên liệu</th>
                    <th>Tổng thời gian nấu</th>
                    <th>Các bước nấu</th>
                    <th>Ảnh</th>
                    <th>Thao tác</th>
                </tr>
                <?php
                $STT = 1;
                while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $STT++; ?></td>
                        <td><?php echo htmlspecialchars($row['TenCongThuc']); ?></td>
                        <td><?php echo htmlspecialchars($row['MoTa']); ?></td>
                        <td><?php echo htmlspecialchars($row['NguyenLieu']); ?></td>
                        <td><?php echo htmlspecialchars($row['TongThoiGianNau']); ?>Phút</td>
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
                        <td><img src="../main/img/<?php echo htmlspecialchars($row['AnhChiTiet']); ?>" alt="AnhChitTiet" width="150px"></td>
                        <td>
                            <a href="edit.php?id=<?php echo $row['MaCongThuc']; ?>">Sửa</a>
                            <a href="indexadmin.php?id=<?php echo $row['MaCongThuc']; ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </table>
        <?php else: ?>
            <p>Không tìm thấy kết quả nào.</p>
        <?php endif; ?>
    <?php else: ?>
        <h3>Danh sách món ăn</h3>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>STT</th>
                <th>Tên món ăn</th>
                <th>Mô tả</th>
                <th>Nguyên liệu</th>
                <th>Tổng thời gian nấu</th>
                <th>Các bước nấu</th>
                <th>Ảnh</th>
                <th>Thao tác</th>
            </tr>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php
                $STT = 1;
                while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $STT++; ?></td>
                        <td><?php echo htmlspecialchars($row['TenCongThuc']); ?></td>
                        <td><?php echo htmlspecialchars($row['MoTa']); ?></td>
                        <td><?php echo htmlspecialchars($row['NguyenLieu']); ?></td>
                        <td><?php echo htmlspecialchars($row['TongThoiGianNau']); ?>Phút</td>
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
                        <td><img src="../main/img/<?php echo htmlspecialchars($row['AnhChiTiet']); ?>" alt="AnhChitTiet" width="150px"></td>
                        <td>
                            <a href="edit.php?id=<?php echo $row['MaCongThuc']; ?>">Sửa</a>
                            <a href="indexadmin.php?id=<?php echo $row['MaCongThuc']; ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="5">Không có món ăn nào.</td>
                </tr>
            <?php endif; ?>
        </table>
    <?php endif; ?>
</body>

</html>