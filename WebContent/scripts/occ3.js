let id = 0;
$(document).ready(function () {
    $.ajax({
        url: "OccupationController",
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
        var statut = $("#statut").val();
        console.log(statut);
        if (id === 0)
        {
            $.ajax({
                url: "OccupationController",
                data: {date:date,code:code,heureDebut:heureDebut,matricule: matricule},
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
                url: "OccupationController",
                data: {op: "update",id:id,statut:statut},
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
            url: "OccupationController",
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
        var statut = $(this).closest('tr').find('td').eq(6).text();
       
         $("#statut").val(statut);

//console.log(date);
     

    });
    
function remplir(data) 
{ var ligne = ""; 
for (var i = 0; i < data.length; i++) { 
ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].date + "</td><td>" + data[i].code+ "</td><td>" + data[i].heureDebut + "</td><td>" + data[i].heureFin + "</td><td>" + data[i].matricule + "</td><td>" + data[i].statut + "</td><td><button class='update' val='" + data[i].id + "' >Modifier</button></td></tr>"; } 
$("#content").html(ligne); 
}


});