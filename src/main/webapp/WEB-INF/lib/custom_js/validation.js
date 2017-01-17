/**
 * Created by vural on 17-Dec-16.
 */
function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('passwordConfirm');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field
    //and the confirmation field
    if(pass1.value == pass2.value){

        //The passwords match.
        //Set the color to the good color and inform
        //the user that they have entered the correct password
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }
    else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }



}

function checkMail() {
    var message = document.getElementById('confirmMailMessage');
    var mail = document.getElementById('mail');

    console.assert(mail);
    var atpos = mail.value.indexOf("@");
    var dotpos = mail.value.lastIndexOf(".");

    var message = document.getElementById('confirmMailMessage');
    var badColor = "#ff6666";

    if(mail.value == "")
        return true;

    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=mail.length) {

        mail.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Invalid mail";
        return false;
    }

    /*if(mail.value == "" || mail.value == " "){
        message.innerHTML = "Invalid mail";
    }*/
}

function onlyDigit()
{

    var isbn = document.getElementById('isbn').value;
    if(isbn.match(/^\d+/))
    {
        alert("Please only enter numeric characters! (Allowed input:0-9)")
    }
}