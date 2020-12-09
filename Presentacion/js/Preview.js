
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#ContentPlaceHolder1_imgPortada').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#ContentPlaceHolder1_fupImagenPortada").change(function () {
    readURL(this);
});