<?php
// Database connection settings
session_start();
include("../admin/connect_db.php");

// Get the search query
$query = isset($_GET['query']) ? $_GET['query'] : '';

// Get the current page number or set to 1 if not present
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 8; // Number of results per page
$offset = ($page - 1) * $limit; // Calculate offset

// Prepare the SQL statement
$sql = "SELECT MaCongThuc, TenCongThuc, MoTa, TacGia, AnhChiTiet, PhucVu FROM congthuc WHERE TenCongThuc REGEXP ? LIMIT ? OFFSET ?";
$stmt = $conn->prepare($sql);
$searchTerm = $query;
$stmt->bind_param("sii", $searchTerm, $limit, $offset);
$stmt->execute();
$result = $stmt->get_result();

// Get total number of results for pagination
$totalSql = "SELECT COUNT(*) FROM congthuc WHERE TenCongThuc REGEXP ?";
$totalStmt = $conn->prepare($totalSql);
$totalStmt->bind_param("s", $searchTerm);
$totalStmt->execute();
$totalStmt->bind_result($totalResults);
$totalStmt->fetch();
$totalStmt->close();

$totalPages = ceil($totalResults / $limit); // Calculate total pages
?>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Kocina | Search Results</title>
  <link rel="shortcut icon" type="image/png" href="img/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&amp;display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Leckerli+One&amp;display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/main.css" />
  <script src="js/uikit.js"></script>
  <style>
    .search-container {
      display: flex;
      justify-content: center;
      margin: 0, 50px, 0, 0;
    }

    .uk-search-input {
      width: 80%;
      /* Make the search input wider */
      font-size: 20px;
      /* Increase font size */
      padding: 15px;
      /* Increase padding for a larger input */
      border-radius: 25px;
      /* Rounded corners for a softer look */
      border: 2px solid #ccc;
      /* Add a border */
    }

    .uk-search-input:focus {
      border-color: #ff6f61;
      /* Change border color on focus */
      outline: none;
      /* Remove default outline */

    }

    .description {
      display: -webkit-box;
      -webkit-line-clamp: 3;
      /* Hiển thị 3 dòng */
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  </style>
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
            <li class="uk-active"><a href="search.php">Tìm kiếm</a></li>
            <li><a href="contact.php">Liên hệ</a></li>
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
  <div class="uk-section uk-section-default uk-padding-remove-top">
    <div class="uk-container search-items">
      <!-- Thanh tìm kiếm -->
      <div class="search-container">
        <form class="uk-search uk-search-default uk-width-1-1" action="search.php" method="GET">

          <input class="uk-search-input uk-text-small uk-border-rounded uk-form-large uk-navbar-center " type="search" name="query" placeholder="Tìm kiếm món ăn..." required>
        </form>
      </div>
      <!--  kết thúc Thanh tìm kiếm -->
      <!-- Hiển thị các món ăn -->
      <div class="uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-margin-medium-top" data-uk-grid>
        <?php
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo '<div>';
            echo '  <div class="uk-card">';
            echo '    <div class="uk-card-media-top uk-inline uk-light">';
            echo '      <img class="uk-border-rounded-medium" src="img/' . $row["AnhChiTiet"] . '" alt="' . htmlspecialchars($row["TenCongThuc"]) . '" style="width: 320px; height: 320px;">';
            echo '      <div class="uk-position-cover uk-card-overlay uk-border-rounded-medium"></div>';
            echo '      <div class="uk-position-xsmall uk-position-top-right">';
            echo '        <a href="#" class="uk-icon-button uk-like uk-position-z-index uk-position-relative" data-uk-icon="heart"></a>';
            echo '      </div>';
            echo '    </div>';
            echo '    <div>';
            echo '      <h3 class="uk-card-title uk-text-500 uk-margin-small-bottom uk-margin-top">' . htmlspecialchars($row["TenCongThuc"]) . '</h3>';
            echo '      <p class="description">' . htmlspecialchars($row["MoTa"]) . '</p>';
            echo '      <div class="uk-text-xsmall uk-text-muted" data-uk-grid>';
            echo '        <div class="uk-width-expand uk-text-right">by ' . htmlspecialchars($row["TacGia"]) . '</div>';
            echo '      </div>';
            echo '    </div>';
            echo '    <a href="recipe.php?id=' . $row["MaCongThuc"] . '" class="uk-position-cover"></a>';
            echo '  </div>';
            echo '</div>';
          }
        } else {
          echo "<p>No recipes found.</p>";
        }

        $stmt->close();
        $conn->close();
        ?>
      </div>
      <!--  kết thúc Hiển thị các món ăn -->
      <!-- tạo danh sách phân trang    -->
      <div class="uk-margin-large-top uk-text-small">
        <ul class="uk-pagination uk-flex-center uk-text-500 uk-margin-remove" data-uk-margin>
          <?php if ($page > 1): ?>
            <li><a href="?query=<?php echo urlencode($query); ?>&page=<?php echo $page - 1; ?>" data-uk-pagination-previous></a></li>
          <?php endif; ?>

          <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <li class="<?php echo ($i === $page) ? 'uk-active' : ''; ?>">
              <a href="?query=<?php echo urlencode($query); ?>&page=<?php echo $i; ?>"><?php echo $i; ?></a>
            </li>
          <?php endfor; ?>

          <?php if ($page < $totalPages): ?>
            <li><a href="?query=<?php echo urlencode($query); ?>&page=<?php echo $page + 1; ?>" data-uk-pagination-next></a></li>
          <?php endif; ?>
        </ul>
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

</body>

</html>