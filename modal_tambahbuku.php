<?php 
include 'fungsi.php';
?>
<div class="modal-body">
    <div class="form-group">
        <label for="kdbuku">Kode Buku</label>
        <input type="text" class="form-control" id="kdbuku" name="kdbuku" required>
    </div>
    <div class="form-group">
        <label for="judul">Judul</label>
        <input type="text" class="form-control" id="judul" name="judul" required>
    </div>
    <div class="form-group">
        <label for="tahun">Tahun</label>
        <input type="text" class="form-control" id="tahun" name="tahun" required>
    </div>
    <div class="form-group">
        <label for="jumlah">Jumlah</label>
        <input type="text" class="form-control" id="jumlah" name="jumlah" required>
    </div>
<?php 
$row=tampil('pengarang');
?>
    <div class="form-group">
        <label for="idpeng">Pengarang</label>
        <select class="form-control" id="idpeng" name="idpeng" required>
            <option value="" selected disabled hidden>Choose here</option>
            <?php while($data= mysqli_fetch_assoc($row)): ?>
            <option value="<?= $data['idpeng'];?>"><?= $data['nm_pengarang'];?></option>
            <?php endwhile; ?>
        </select>
    </div>
<?php 
$row=tampil('penerbit');
?>
    <div class="form-group">
        <label for="idpen">Penerbit</label>
        <select class="form-control" id="idpen" name="idpen" required>
            <option value="" selected disabled hidden>Choose here</option>
            <?php while($data= mysqli_fetch_assoc($row)): ?>
            <option value="<?= $data['idpen'];?>"><?= $data['penerbit'];?></option>
            <?php endwhile; ?>
        </select>
    </div>

 </div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="submit" name="tambah" class="btn btn-success">Tambah Buku</button>
</div>