<?php
session_start();
// hapus session
session_destroy();

// alihkan ke halaman login (index.html) dan berikan alert = 2
header('Location: index.html?alert=2');
?>