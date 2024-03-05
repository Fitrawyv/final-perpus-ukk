    <h1 class="mt-4">Buku</h1>
<div class="card">
    <div class="card-body">
<div class="row">
    <div class="col-md-12">
        <a href="?page=buku_tambah" class="btn btn-primary">+ Tambah Data</a>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <?php
// Koneksi ke database
$host = "localhost";
$username = "root";
$password = "";
$database = "prps";
$koneksi = mysqli_connect('localhost','root','','prps');

// Fungsi untuk melakukan pencarian
function search($keyword) {
    global $koneksi;

    // Query pencarian
    $query = "SELECT * FROM buku WHERE Judul LIKE '%".$keyword."%'";

    // Eksekusi query
    $result = mysqli_query($koneksi, $query);

    // Mengembalikan hasil pencarian
    return $result;
}

// Mengambil keyword pencarian dari URL
$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : "";

// Memanggil fungsi pencarian jika keyword tidak kosong
if (!empty($keyword)) {
    $result = search($keyword);
}

?>

<!-- Form pencarian -->
<form method="GET" action="buku.php">
    <input type="text" name="keyword" placeholder="Masukkan kata kunci" value="<?php echo $keyword; ?>">
    <button type="submit">Cari</button>
</form>

<!-- Menampilkan hasil pencarian -->
<?php
if (isset($result) && mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        echo $row['Judul']."<br>";
    }
} else {
    echo "Tidak ditemukan hasil pencarian.";
}
?>
            <tr>
                <th>No</th>
                <th>Nama Kategori</th>
                <th>Sampul</th>
                <th>Judul</th>
                <th>Penulis</th>
                <th>Penerbit</th>
                <th>Tahun Terbit</th>
                <th>Stok</th>
                <th>Aksi</th>
            </tr>
            <?php
            $i = 1;
            $query = mysqli_query($koneksi, "SELECT*FROM buku LEFT JOIN kategoribuku ON buku.id_kategori = kategoribuku.KategoriID");
            while($data = mysqli_fetch_array($query)){
                ?>
                <tr>
                <td><?php echo $i++; ?></td>
                <td><?php echo $data['NamaKategori']; ?></td>
                <td><img style="width: 150px; height:200px;" src="images/<?php echo $data['Sampul']; ?>"></td>
                <td><?php echo $data['Judul']; ?></td>
                <td><?php echo $data['Penulis']; ?></td>
                <td><?php echo $data['Penerbit']; ?></td>
                <td><?php echo $data['Tahun_Terbit']; ?></td>
                <td><?php echo $data['Stok']; ?></td>
                <td>
                <a href="?page=buku_ubah&&id=<?php echo $data['BukuID']; ?>" class="btn btn-info">Ubah</a>
                <a onclick="return confirm('Apakah Anda Yakin Menghapus Data Ini?');" href="?page=buku_hapus&&id=<?php echo $data['BukuID']; ?>" class="btn btn-info">Hapus</a>
                </td>
                </tr>
                <?php
            }
            ?>
        </table>
    </div>
</div>
    </div>
</div>