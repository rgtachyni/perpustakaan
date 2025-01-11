<?php
session_start();
include 'header.php';
include 'db_connection.php'; // Pastikan koneksi ke database sudah diatur di file ini
?>

<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h3 class="m-0 font-weight-bold text-primary">Laporan Peminjaman Buku</h3>
    <hr>

    <!-- Form Filter Bulanan -->
    <form method="GET" action="">
        <div class="form-row align-items-center">
            <div class="col-auto">
                <select name="bulan" class="form-control" required>
                    <option value="">-- Pilih Bulan --</option>
                    <?php
                    for ($i = 1; $i <= 12; $i++) {
                        $bulan = str_pad($i, 2, "0", STR_PAD_LEFT);
                        $selected = (isset($_GET['bulan']) && $_GET['bulan'] == $bulan) ? 'selected' : '';
                        echo "<option value='$bulan' $selected>$bulan</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="col-auto">
                <select name="tahun" class="form-control" required>
                    <option value="">-- Pilih Tahun --</option>
                    <?php
                    $currentYear = date("Y");
                    for ($i = $currentYear - 10; $i <= $currentYear; $i++) {
                        $selected = (isset($_GET['tahun']) && $_GET['tahun'] == $i) ? 'selected' : '';
                        echo "<option value='$i' $selected>$i</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </div>
    </form>

    <br>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Daftar Pengembalian Buku</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead class="thead-dark">
                        <tr>
                            <th>No</th>
                            <th>Anggota</th>
                            <th>Buku</th>
                            <th>Tanggal Pinjam</th>
                            <th>Tanggal Harus Kembali</th>
                            <th>Tanggal Kembali</th>
                            <th>Denda</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $where = "";

                        if (isset($_GET['bulan']) && isset($_GET['tahun'])) {
                            $bulan = $_GET['bulan'];
                            $tahun = $_GET['tahun'];
                            $where = "WHERE MONTH(a.tglp) = '$bulan' AND YEAR(a.tglp) = '$tahun'";
                        }

                        $query = "SELECT a.id, a.tglp, a.tglhk, a.tglk, a.denda, b.nama, c.judul 
                                  FROM kembali a
                                  JOIN anggota b ON a.idagt = b.idagt
                                  JOIN buku c ON a.kdbuku = c.kdbuku 
                                  $where";

                        $result = mysqli_query($conn, $query);

                        while ($data = mysqli_fetch_assoc($result)) : ?>
                            <tr>
                                <td><?= $no++; ?></td>
                                <td><?= $data["nama"]; ?></td>
                                <td><?= $data["judul"]; ?></td>
                                <td><?= $data["tglp"]; ?></td>
                                <td><?= $data["tglhk"]; ?></td>
                                <td><?= $data["tglk"]; ?></td>
                                <td>Rp. <?= number_format($data["denda"], 0, ',', '.'); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

<?php include 'footer.php'; ?>
<script>
    document.getElementById("kembali").className = "nav-item active";
</script>