let id = 0;
$(document).ready(function () {
    $.ajax({
        url: "SalleController",
        data: {op: "load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplir(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus);
        }
    });


    $("#add").click(function () {
        var code = $("#code").val();
        var capacite = $("#capacite").val();
        var type = $("#type").val();
        if (id === 0)
        {
            $.ajax({
                url: "SalleController",
                data: {code: code, capacite: capacite, type: type},
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    remplir(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        } else
        {
            $.ajax({
                url: "SalleController",
                data: {op: "update", id: id, code: code, type: type, capacite: capacite},
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    remplir(data);
                    id = 0;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                }
            });
        }

    });
    $("#content").on("click", ".delete", function () {
        //alert($(this).attr('val'));
        var id = $(this).closest('tr').find('td').eq(0).text();
        $.ajax({
            url: "SalleController",
            data: {op: "delete", id: id},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                remplir(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

    });
    $("#content").on("click", ".update", function () {
        //alert($(this).attr('val'));
          
         id = $(this).closest('tr').find('td').eq(0).text();
        var code = $(this).closest('tr').find('td').eq(1).text();
        var capacite = $(this).closest('tr').find('td').eq(2).text();
        var type = $(this).closest('tr').find('td').eq(3).text();
       
         $("#code").val(code);
         $("#capacite").val(capacite);
         $("#type").val(type);

//console.log(date);
     

    });
    function remplir(data) {
        var ligne = "";
        //   var mod = "";
        for (var i = 0; i < data.length; i++) {

            ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].code + "</td><td>"
                    + data[i].capacite + "</td><td>" + data[i].type + "</td><td><button class='delete' val='" + data[i].id + "'>Supprimer</button>\n\
</td><td><button class='update' val='" + data[i].id + "' >Modifier</button></td></tr>";
        }
        $("#content").html(ligne);
    }


});