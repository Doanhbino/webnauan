<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nấu ăn không khó</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css" />
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
                        <li class="uk-active"><a href="recipe.php">Công thức</a></li>
                        <li><a href="search.php">Tìm kiếm</a></li>
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
                    <a class="uk-navbar-toggle uk-hidden@m" href="#offcanvas" data-uk-toggle><span data-uk-navbar-toggle-icon></span></a>
                </div>
            </div>
        </div>
    </nav>

    <?php
    include("../admin/connect_db.php");
    // Lấy thông tin chi tiết về công thức
    if (isset($_GET['id'])) $idCT = $_GET['id'];
    else $idCT = 1;
    $sl_listCT = "SELECT * FROM congthuc WHERE MaCongThuc = '$idCT'";
    $kq_listCT = mysqli_query($conn, $sl_listCT);
    while ($d_listCT = mysqli_fetch_array($kq_listCT)) {
    ?>
        <div class="uk-container">
            <div data-uk-grid>
                <div class="uk-width-1-2@s">
                    <div><img class="uk-border-rounded-large" src="./img/<?php echo $d_listCT['AnhChiTiet']; ?>" alt="<?php echo $d_listCT['AnhChiTiet']; ?>"></div>
                </div>
                <div class="uk-width-expand@s uk-flex uk-flex-middle">
                    <div>
                        <h1><?php echo $d_listCT['TenCongThuc']; ?></h1>
                        <p><?php echo $d_listCT['MoTa']; ?></p>
                        <div class="uk-margin-medium-top uk-child-width-expand uk-text-center uk-grid-divider" data-uk-grid>
                            <div>
                                <span data-uk-icon="icon: clock; ratio: 1.4"></span>
                                <h5 class="uk-text-500 uk-margin-small-top uk-margin-remove-bottom">Active Time</h5>
                                <span class="uk-text-small"><?php echo $d_listCT['ThoiGianChuanBi']; ?> mins</span>
                            </div>
                            <div>
                                <span data-uk-icon="icon: future; ratio: 1.4"></span>
                                <h5 class="uk-text-500 uk-margin-small-top uk-margin-remove-bottom">Total Time</h5>
                                <span class="uk-text-small"><?php echo $d_listCT['TongThoiGianNau']; ?> mins</span>
                            </div>
                            <div>
                                <span data-uk-icon="icon: users; ratio: 1.4"></span>
                                <h5 class="uk-text-500 uk-margin-small-top uk-margin-remove-bottom">Yield</h5>
                                <span class="uk-text-small">Serves <?php echo $d_listCT['PhucVu']; ?></span>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>


    <div class="uk-section uk-section-default">
        <div class="uk-container uk-container-small">
            <div class="uk-grid-large" data-uk-grid>
                <div class="uk-width-expand@m">
                    <div class="uk-article">
                        <h3>Cách làm </h3>
                        <?php
                        // Lấy cách nấu
                        $sl_listCN = "SELECT * FROM cacbuocnau WHERE MaCongThuc = '$idCT'";
                        $kq_listCN = mysqli_query($conn, $sl_listCN);
                        $step = 1;
                        while ($d_listCN = mysqli_fetch_array($kq_listCN)) {
                        ?>
                            <div id="step-<?php echo $d_listCN['BuocThucHien']; ?>" class="uk-grid-small uk-margin-medium-top" data-uk-grid>
                                <div class="uk-width-auto">
                                    <a href="#" class="uk-step-icon" data-uk-icon="icon: check; ratio: 0.8" data-uk-toggle="target: #step-<?php echo $d_listCN['BuocThucHien']; ?>; cls: uk-step-active"></a>
                                </div>
                                <div class="uk-width-expand">
                                    <h5 class="uk-step-title uk-text-500 uk-text-uppercase uk-text-primary" data-uk-leader="fill:—">Step <?php echo $step++; ?></h5>
                                    <div class="uk-step-content"><?php echo $d_listCN['HuongDan']; ?></div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>

                <div class="uk-width-1-3@m">
                    <h3>Nguyên liệu</h3>
                    <?php
                    // Lấy nguyên liệu bằng cách kết 2 bảng nguyenlieu và congthuc_nguyenlieu
                    $sl_listNL = "SELECT nguyenlieu.TenNguyenLieu, nguyenlieu.SoLuong, nguyenlieu.DonVi
                                    FROM nguyenlieu
                                    JOIN congthuc_nguyenlieu ON nguyenlieu.MaNguyenLieu = congthuc_nguyenlieu.MaNguyenLieu
                                    WHERE congthuc_nguyenlieu.MaCongThuc = '$idCT'";
                    $kq_listNL = mysqli_query($conn, $sl_listNL);
                    while ($d_listNL = mysqli_fetch_array($kq_listNL)) {
                    ?>
                        <ul class="uk-list uk-list-large uk-list-divider uk-margin-medium-top">
                            <li><?php echo $d_listNL['SoLuong'] . " " . $d_listNL['DonVi'] . " " . $d_listNL['TenNguyenLieu']; ?></li>
                        </ul>
                    <?php }
                    $conn->close();
                    ?>
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
            <div class="uk-margin-medium-top uk-text-small uk-text-muted">
                <div>Make by group 9</div>
            </div>
        </div>
    </footer>
</body>

</html>