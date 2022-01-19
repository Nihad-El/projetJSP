<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Inscription" method="post">
            <fieldset><legend>
                Inscription
                </legend>
                <table border="0">
                    
                        <tr>
                            <td>Nom</td>
                            <td><input type="text" name="nom" value="" /></td>
                        </tr>
                        <tr>
                            <td>Prenom</td>
                            <td><input type="text" name="prenom" value="" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="" /></td>
                        </tr>
                        <tr>
                            <td>Mot de passe</td>
                            <td><input type="password" name="password" value="" /></td>
                        </tr>
                        <tr>
                            <td>Date de naissance</td>
                            <td><input type="date" name="date" value="" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Valider" />
                                <input type="reset" value="Annuler" /></td>
                        </tr>
                   
                </table>

            </fieldset>
            
            
            
        </form>
    </body>
</html>