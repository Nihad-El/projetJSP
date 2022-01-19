let id = 0;
$(document).ready(function () {
    $.ajax({
        url: "ClientController",
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
        var matricule = $("#matricule").val();
        var nom = $("#nom").val();
        var prenom = $("#prenom").val();
        if (id === 0)
        {
            $.ajax({
                url: "ClientController",
                data: {matricule: matricule, nom: nom, prenom: prenom},
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
                url: "ClientController",
                data: {op: "update", id: id,matricule: matricule, nom: nom, prenom: prenom},
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
            url: "ClientController",
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
        var matricule = $(this).closest('tr').find('td').eq(1).text();
        var nom = $(this).closest('tr').find('td').eq(2).text();
        var prenom = $(this).closest('tr').find('td').eq(3).text();
       
         $("#matricule").val(matricule);
         $("#nom").val(nom);
         $("#prenom").val(prenom);

//console.log(date);
     

    });
    function remplir(data) {
        var ligne = "";
        //   var mod = "";
        for (var i = 0; i < data.length; i++) {

            ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].matricule + "</td><td>"
                    + data[i].nom + "</td><td>" + data[i].prenom + "</td><td><button class='delete' val='" + data[i].id + "'>Supprimer</button>\n\
</td><td><button class='update' val='" + data[i].id + "' >Modifier</button></td></tr>";
        }
        $("#content").html(ligne);
    }


});