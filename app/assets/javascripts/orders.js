
$(function () {
    $("#btnAdd").bind("click", function () {
        var div = $("<tr />");
        div.html(GetDynamicTextBox(""));
        $("#TextBoxContainer").append(div);
    });
    $("body").on("click", ".remove", function () {
        $(this).closest("tr").remove();
    });
});
function GetDynamicTextBox(value) {
    return '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' +
    '<td><select status="" class="form-control"><option> Select</option><option> Ongoing</option><option> Completed</option></select></td>' +
    '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' +
    '<td><select status="" class="form-control"><option> Select</option><option> Ongoing</option><option> Completed</option></select></td>' +
     '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' +
    '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' +
    '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' +
    '<td><button type="button" class="btn btn-danger remove"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td>'
}
