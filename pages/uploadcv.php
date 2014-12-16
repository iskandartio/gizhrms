<?php
if (isset($_FILES['uploadFileCV']['name'])) {
echo 'Start';
$target_dir = "uploads/";
$target_dir = $target_dir . basename( $_FILES["uploadFileCV"]["name"]);
$uploadOk=1;

if (move_uploaded_file($_FILES["uploadFileCV"]["tmp_name"], $target_dir)) {
    echo "The file ". basename( $_FILES["uploadFileCV"]["name"]). " has been uploaded.";
} else {
    echo "Sorry, there was an error uploading your file.";
}
$target_dir = $target_dir . basename( $_FILES["uploadFileLetter"]["name"]);
if (move_uploaded_file($_FILES["uploadFileLetter"]["tmp_name"], $target_dir)) {
    echo "The file ". basename( $_FILES["uploadFileLetter"]["name"]). " has been uploaded.";
} else {
    echo "Sorry, there was an error uploading your file.";
}
}
?>
<script>
	var validFileSize = 1 * 1024 * 1024;

    function CheckFileSize(file) {
        /*global document: false */
        var fileSize = file.files[0].size;
        var isValidFile = false;
        if (fileSize !== 0 && fileSize <= validFileSize) {
            isValidFile = true;
        }
        else {
            file.value = null;
            alert("File Size Should be less than 1 MB.");
        }
        return isValidFile;
    }
	var validFilesTypes = ["doc", "docx", "pdf"];

    function CheckExtension(file) {
        /*global document: false */
        var filePath = file.value;
        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
        var isValidFile = false;

        for (var i = 0; i < validFilesTypes.length; i++) {
            if (ext == validFilesTypes[i]) {
                isValidFile = true;
                break;
            }
        }

        if (!isValidFile) {
            file.value = null;
            alert("Invalid File. Valid extensions are:\n\n" + validFilesTypes.join(", "));
        }

        return isValidFile;
    }
	function CheckFile(file) {
        var isValidFile = CheckExtension(file);

        if (isValidFile)
            isValidFile = CheckFileSize(file);

        return isValidFile;
    }
	$(function() {
		$('#uploadFileCV').change(function() {
			CheckFile(this);
		});
		$('#uploadFileLetter').change(function() {
			CheckFile(this);
		});
		$('#btnUpload').click(function() {
			if ($('#uploadFileCV').val()==""||$('#uploadFileLetter').val()=="") {
				alert('CV and Covering Letter are required');
				return;
			}
			$('form#data').submit();
		});
		$("form#data").submit(function(){

			var formData = new FormData($(this)[0]);
			
			$.ajax({
				url: "upload.php",
				type: 'POST',
				data: formData,
				async: false,
				success: function (data) {
					alert(data)
				},
				cache: false,
				contentType: false,
				processData: false
			});

			return false;
		});
		$('#btnDownloadCV').click(function() {
			var data={}
			data['type']="cv";
			var success=function (msg) {
				if (msg!='ok') {
					alert('Please upload your CV');
					return;
				}
				location.href="uploadajax?type=cv";
			}
			ajax("upload.php", data, success);
			
		});
		$('#btnDownloadLetter').click(function() {
			var data={}
			data['type']="letter";
			var success=function (msg) {
				if (msg!='ok') {
					alert('Please upload your covering letter');
					return;
				}
				location.href="uploadajax?type=letter";
			}
			ajax("upload.php", data, success);
		});
	});
</script>
<form action="upload.php" id="data" method="post" enctype="multipart/form-data">
<table>
<tr><td>CV</td><td>:</td><td><input type="file" id="uploadFileCV" name="uploadFileCV" accept=".pdf,.docx,.doc"></td></tr>
<tr><td>Covering Letter</td><td>:</td><td><input type="file" id="uploadFileLetter" name="uploadFileLetter" accept=".pdf,.docx,.doc"></td></tr>
</table>
  
</form>
<button class="button_link" id="btnUpload">Upload</button>
<button class="button_link" id="btnDownloadCV">Download CV</button>
<button class="button_link" id="btnDownloadLetter">Download Letter</button>

