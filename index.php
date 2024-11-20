<?php session_start(); ?>

<!DOCTYPE html>
<html lang="vi" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nấu ăn không khó</title>
    <link rel="shortcut icon" type="image/png" href="./main/img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Leckerli+One&amp;display=swap" rel="stylesheet">
    <script src="./main/js/uikit.js"></script>
    <script src="./main/js/script.js"></script>
    <link rel="stylesheet" href="./main/css/main.css" />
    <link rel="stylesheet" href="./main/css/style.css" />
    <style>
        body {
            color: #333333;
        }
    </style>
</head>

<body>
    <nav class="uk-navbar-container uk-letter-spacing-small">
        <div class="uk-container header">
            <div class="uk-position-z-index" data-uk-navbar>
                <div class="uk-navbar-left">
                    <a class="uk-navbar-item uk-logo" href="index.php">Nấu ăn không khó</a>
                    <ul class="uk-navbar-nav uk-visible@m uk-margin-large-left">
                        <li class="uk-active"><a href="index.php">Trang chủ</a></li>
                        <li><a href="./main/recipe.php">Công thức</a></li>
                        <li><a href="./main/search.php">Tìm kiếm</a></li>
                        <li><a href="./main/contact.php">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav uk-visible@m">
                        <?php
                        if (isset($_SESSION['TenDangNhap'])) {
                            // Nếu đã đăng nhập, hiển thị nút Đăng xuất
                            echo '<li><a href="./admin/logout.php">Đăng xuất</a></li>';
                        } else {
                            // Nếu chưa đăng nhập, hiển thị nút Đăng nhập
                            echo '<li><a href="./main/sign-in.php">Đăng nhập</a></li>';
                        }
                        ?>
                    </ul>
                    <div class="uk-navbar-item bg">
                        <div><a class="uk-button uk-button-primary" href="./admin/indexadmin.php">Quản trị viên</a></div>
                    </div>
                    <a class="uk-navbar-toggle uk-hidden@m" href="#offcanvas" data-uk-toggle><span
                            data-uk-navbar-toggle-icon></span></a>
                </div>
            </div>
        </div>
    </nav>
    <footer
        class="uk-container header-img">
        <div class="uk-border-rounded-large uk-background-top-center uk-background-cover 
        uk-background-norepeat uk-light uk-inline uk-overflow-hidden uk-width-1-1 "
            style="background-image: url(./main/img/header.jpg);">
            <div class="uk-position-cover uk-header-overlay"></div>
            <div class="uk-position-relative" data-uk-grid>
                <div class="uk-width-1-2@m uk-flex uk-flex-middle">
                    <div class="uk-padding-large uk-padding-remove-right">
                        <h1 class="uk-heading-small uk-margin-remove-top">Chọn từ hàng ngàn công thức nấu ăn</h1>
                        <p class="uk-text-secondary">Tích hợp một cách thích hợp giá trị hợp lý về mặt kỹ thuật với các phương tiện
                            thông tin có thể mở rộng đàm phán các lĩnh vực chủ đề chiến lược bền vững</p>
                    </div>
                </div>
                <div class="uk-width-expand@m">
                </div>
            </div>
        </div>
        </>
        <div class="uk-section uk-section-default">
            <div class="uk-container">
                <div data-uk-grid>
                    <div class="uk-width-1-4@m sticky-container">
                        <div data-uk-sticky="offset: 100; bottom: true; media: @m;">
                            <h2>Công thức nấu ăn</h2>
                            <ul class="uk-nav-default uk-nav-parent-icon uk-nav-filter uk-margin-medium-top" data-uk-nav>
                                <li class="uk-parent uk-open">
                                    <a href="#">Loại món ăn</a>
                                    <ul class="uk-nav-sub">
                                        <?php
                                        include("./admin/connect_db.php");
                                        $sl_dm = "SELECT * FROM loaimonan";
                                        $kq_dm = mysqli_query($conn, $sl_dm);
                                        while ($d_dm = mysqli_fetch_array($kq_dm)) {
                                        ?>
                                            <li>
                                                <a href="index.php?MaLoaiMonAn=<?php echo $d_dm['MaLoaiMonAn'] ?>"><?php echo $d_dm['TenLoaiMonAn'] ?></a>
                                            </li>
                                        <?php
                                        }
                                        ?>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="uk-width-expand@m">
                        <div data-uk-grid>
                            <div class="uk-width-expand@m">
                                <form class="uk-search uk-search-default uk-width-1-1 uk-margin-small-bottom" action="./main/search.php" method="GET">
                                    <span data-uk-search-icon></span>
                                    <input class="uk-search-input uk-text-small uk-border-rounded uk-form-large" type="search" name="query" placeholder="Tìm kiếm công thức..." required>
                                </form>
                            </div>
                        </div>
                        <div id="recipeList" class="uk-child-width-1-2 uk-child-width-1-3@s" data-uk-grid>
                            <?php
                            // Thiết lập phân trang
                            // Giới hạn số món ăn của mỗi trang
                            $limit = 6;
                            // Xử lý nếu người dùng truy cập thẳng vào trang
                            if (isset($_GET['page'])) $page = $_GET['page'];
                            else $page = 1;
                            // tính toán offset(vị trí bắt đầu)
                            $offset = ($page - 1) * $limit;
                            // Kiểm tra và lấy giá trị của MaLoaiMonAn từ URL
                            if (isset($_GET['MaLoaiMonAn'])) $maloaimonan = $_GET['MaLoaiMonAn'];
                            else $maloaimonan = null;
                            $dk = $maloaimonan ? "WHERE MaLoaiMonAn = $maloaimonan" : "";

                            // Truy vấn dữ liệu từ bảng congthuc với giới hạn từ $offset->$limit
                            $slloc = "SELECT * 
                                FROM congthuc 
                                $dk 
                                LIMIT $limit
                                OFFSET $offset";
                            $kqloc = mysqli_query($conn, $slloc);
                            while ($dloc = mysqli_fetch_array($kqloc)) { ?>
                                <div class="recipe" data-type="<?php echo $dloc['MaLoaiMonAn']; ?>">
                                    <div class="uk-card">
                                        <!-- Hình ảnh món ăn và overlay -->
                                        <div class="uk-card-media-top uk-inline uk-light">
                                            <img class="uk-border-rounded-medium" src="./main/img/<?php echo $dloc['AnhChiTiet']; ?>" alt="<?php echo $dloc['TenCongThuc']; ?>" style="width: 320px; height: 320px;">
                                            <div class="uk-position-cover uk-card-overlay uk-border-rounded-medium"></div>
                                            <div class="uk-position-xsmall uk-position-top-right">
                                                <a href="#" class="uk-icon-button uk-like uk-position-z-index uk-position-relative" data-uk-icon="heart"></a>
                                            </div>
                                        </div>
                                        <!-- Nội dung thông tin món ăn -->
                                        <div>
                                            <h3 class="uk-card-title uk-text-500 uk-margin-small-bottom uk-margin-top description1 "><?php echo $dloc['TenCongThuc']; ?></h3>
                                            <p class="description"><?php echo $dloc["MoTa"]; ?></p>
                                            <div class="uk-text-xsmall uk-text-muted" data-uk-grid>
                                                <div class="uk-width-expand uk-text-right">by <?php echo $dloc["TacGia"]; ?></div>
                                            </div>
                                        </div>
                                        <!-- Link đến chi tiết món ăn -->
                                        <a href="./main/recipe.php?id=<?php echo $dloc["MaCongThuc"]; ?>" class="uk-position-cover"></a>
                                    </div>
                                </div>

                            <?php
                            }
                            ?>
                        </div>
                        <?php

                        // Tính tổng số món ăn để tạo phân trang
                        $sqlCount = "SELECT COUNT(*) as total FROM congthuc $dk";
                        $resultCount = $conn->query($sqlCount);
                        $total = $resultCount->fetch_assoc()['total'];
                        $totalPages = ceil($total / $limit); // tính số trang
                        ?>
                        <!-- Phân trang -->
                        <div class="uk-margin-large-top uk-text-small">
                            <ul class="uk-pagination uk-flex-center uk-text-500 uk-margin-remove" data-uk-margin>
                                <?php if ($page > 1): ?>
                                    <li>
                                        <a href="?page=<?php echo $page - 1; ?><?php echo $maloaimonan ? '&MaLoaiMonAn=' . $maloaimonan : ''; ?>">« Trước</a>
                                    </li>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                                    <li class="<?php echo ($i === $page) ? 'uk-active' : ''; ?>">
                                        <a href="?page=<?php echo $i; ?><?php echo $maloaimonan ? '&MaLoaiMonAn=' . $maloaimonan : ''; ?>"><?php echo $i; ?></a>
                                    </li>
                                <?php endfor; ?>

                                <?php if ($page < $totalPages): ?>
                                    <li><a href="?page=<?php echo $page + 1; ?><?php echo $maloaimonan ? '&MaLoaiMonAn=' . $maloaimonan : ''; ?>">Tiếp theo »</a></li>
                                <?php endif;
                                $conn->close(); ?>
                            </ul>
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
                <div class="uk-margin-medium-top uk-text-small uk-text-center">
                    Make by group 9
                </div>
            </div>
        </footer>
</body>

</html>