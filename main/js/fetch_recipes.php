<?php
// Kết nối đến cơ sở dữ liệu
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "webnauan";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Lấy giá trị phucvu từ URL
$phucvu = isset($_GET['phucvu']) ? (int)$_GET['phucvu'] : 0;

// Truy vấn dữ liệu từ bảng congthuc theo phucvu
$sql = "SELECT MaCongThuc, TenCongThuc, MoTa, TacGia, Anh, PhucVu FROM congthuc WHERE PhucVu = $phucvu";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo '<div class="recipe" data-type="' . $row["PhucVu"] . '">';
        echo '  <div class="uk-card">';
        echo '    <div class="uk-card-media-top uk-inline uk-light">';
        echo '      <img class="uk-border-rounded-medium" src="img/' . $row["Anh"] . '" alt="' . $row["TenCongThuc"] . '">';
        echo '      <div class="uk-position-cover uk-card-overlay uk-border-rounded-medium"></div>';
        echo '      <div class="uk-position-xsmall uk-position-top-right">';
        echo '        <a href="#" class="uk-icon-button uk-like uk-position-z-index uk-position-relative" data-uk-icon="heart"></a>';
        echo '      </div>';
        echo '    </div>';
        echo '    <div>';
        echo '      <h3 class="uk-card-title uk-text-500 uk-margin-small-bottom uk-margin-top">' . $row["TenCongThuc"] . '</h3>';
        echo '      <p>' . $row["MoTa"] . '</p>';
        echo '      <div class="uk-text-xsmall uk-text-muted" data-uk-grid>';
        echo '        <div class="uk-width-expand uk-text-right">by ' . $row["TacGia"] . '</div>';
        echo '      </div>';
        echo '    </div>';
        echo '    <a href="recipe.php?id=' . $row["MaCongThuc"] . '" class="uk-position-cover"></a>';
        echo '  </div>';
        echo '</div>';
    }
} else {
    echo "<p>Không có công thức nào để hiển thị.</p>";
}

$conn->close();
?>
