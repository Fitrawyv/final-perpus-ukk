<?php
$id = $_GET['id'];

// Delete related rows in the 'peminjam' table first
mysqli_query($koneksi, "DELETE FROM peminjam WHERE BukuID=$id");

// Delete the row from the 'buku' table
mysqli_query($koneksi, "DELETE FROM buku WHERE BukuID=$id");
?>
<script>
    alert('Hapus Data Berhasil');
    location.href = "index.php?page=buku";
</script>