<?php
// search_suggestions.php
include 'connect_db.php';

// Kiểm tra nếu có từ khóa tìm kiếm
if (isset($_GET['query']) && !empty($_GET['query'])) {
    $searchQuery = $_GET['query'];
    $searchQuery = $conn->real_escape_string($searchQuery);  // Sử dụng real_escape_string để bảo vệ khỏi SQL Injection

    // Kiểm tra lại xem giá trị $searchQuery có hợp lệ không
    if (strlen($searchQuery) >= 3) {
        // Truy vấn cơ sở dữ liệu để tìm món ăn
        $sql = "SELECT TenCongThuc FROM congthuc WHERE TenCongThuc LIKE '%$searchQuery%' LIMIT 10";
        $result = $conn->query($sql);

        // Kiểm tra có kết quả hay không
        if ($result->num_rows > 0) {
            $suggestions = [];
            while ($row = $result->fetch_assoc()) {
                $suggestions[] = $row['TenCongThuc'];
            }
            echo json_encode($suggestions);
        } else {
            echo json_encode([]);  // Nếu không có kết quả, trả về mảng rỗng
        }
    } else {
        echo json_encode([]);  // Nếu từ khóa quá ngắn, không tìm kiếm
    }
} else {
    echo json_encode([]);  // Nếu không có từ khóa tìm kiếm
}

$conn->close();
