<?php
// logout.php

session_start();

// hủy toàn bộ các session
session_destroy();

// Chuyển hướng về trang đăng nhập
header("Location: ../index.php");
exit;
