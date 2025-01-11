<?php
include 'fungsi.php';

$id = $_GET['id'];
$row = mysqli_query($conn, "SELECT * FROM anggota WHERE id='$id'");
$data = mysqli_fetch_assoc($row);

?>
<div class="modal-body">
    <input type="text" name="id" id="id" value="<?= $id; ?>" hidden>
    <div class="form-group">
        <label for="idagt">ID Anggota</label>
        <input type="text" class="form-control" id="idagt" name="idagt" value="<?= $data['idagt']; ?>" required>
    </div>
    <div class="form-group">
        <label for="nama">Nama</label>
        <input type="text" class="form-control" id="nama" name="nama" value="<?= $data['nama']; ?>" required>
    </div>
    <div class="form-group">
        <label for="nama">Password</label>
        <input type="password" class="form-control" id="pass" name="pass" value="<?= $data['password']; ?>" required>
    </div>
    <div class="form-group">
        <label for="t4lahir">Tempat Lahir</label>
        <input type="text" class="form-control" id="t4lahir" name="t4lahir" value="<?= $data['t4lahir']; ?>" required>
    </div>
    <div class="form-group">
        <label for="tglhr">Tanggal Lahir</label>
        <input type="text" class="form-control" id="tglhr" name="tglhr" value="<?= $data['tglhr']; ?>" required>
    </div>
    <div class="form-group">
        <label for="jkel">Jenis Kelamin</label>
        <input type="text" class="form-control" id="jkel" name="jkel" value="<?= $data['jkel']; ?>" required>
    </div>
    <div class="form-group">
        <label for="alamat">Alamat</label>
        <input type="text" class="form-control" id="alamat" name="alamat" value="<?= $data['alamat']; ?>" required>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="submit" name="edit" class="btn btn-success">Edit</button>
</div>