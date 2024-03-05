<?php
include 'koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login Perpustakaan Digital</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body style="background-image: url(7.jpg);">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Login Perpustakaan Digital</h3>
                                </div>
                                <div class="card-body">
                                    <?php
                                    if (isset($_POST['login'])) {
                                        $username = $_POST['username'];
                                        $password = md5($_POST['password']);

                                        $data = mysqli_query($koneksi, "SELECT*FROM userid where username='$username' and password='$password'");
                                        $cek = mysqli_num_rows($data);
                                        if ($cek > 0) {

                                            $_SESSION['userid'] = mysqli_fetch_array($data);
                                            echo '<script>alert("Selamat Datang, Login Berhasil"); location.href="index.php";</script>';
                                        } else {
                                            echo '<script>alert("Maaf, Username/Password Salah")</script>';
                                        }
                                    }
                                    ?>

                                    <form method="post">
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputusername">Username</label>
                                            <input class="form-control py-4" id="inputusername" type="text" name="username" placeholder="Enter username" />
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputPassword">Password</label>
                                            <input class="form-control py-4" id="inputPassword" type="password" name="password" placeholder="Enter Password" />
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <button class="btn btn-primary" type="submit" name="login" value="login">Login</button>
                                            <h7 href="register.php" >Jika belum memiliki akun silahkan register</h7>
                                            <a class="btn btn-danger" href="register.php">Register</a>
                                        </div>
                                    </form>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                            &copy; 2024 Perpustakaan Digital.
                                        </div>
                                     
                                    </div>
                                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="datatables-simple-demo.js"></script>

</html>