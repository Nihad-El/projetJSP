let id = 0;
$(document).ready(function () {
    $.ajax({
        url: "CrenonController",
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
        var heureDebut = $("#heureDebut").val();
        var heureFin = $("#heureFin").val();
        if (id === 0)
        {
            $.ajax({
                url: "CrenonController",
                data: {heureDebut: heureDebut, heureFin: heureFin},
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
                url: "CrenonController",
                data: {op: "update", id: id,heureDebut: heureDebut, heureFin: heureFin},
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
            url: "CrenonController",
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
        var heureDebut = $(this).closest('tr').find('td').eq(1).text();
        var heureFin = $(this).closest('tr').find('td').eq(2).text();
       
         $("#heureDebut").val(heureDebut);
         $("#heureFin").val(heureFin);

//console.log(date);
     

    });
    function remplir(data) {
        var ligne = "";
        //   var mod = "";
        for (var i = 0; i < data.length; i++) {

            ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].heureDebut + "</td><td>"
                    + data[i].heureFin + "</td><td><button class='delete' val='" + data[i].id + "'>Supprimer</button>\n\
</td></tr>";
        }
        $("#content").html(ligne);
    }


});