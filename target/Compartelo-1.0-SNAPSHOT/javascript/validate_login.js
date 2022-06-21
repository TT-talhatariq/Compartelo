function validate(){
    let email = document.getElementById("email").value;
    if(email.substring(email.indexOf('@')).localeCompare("@pucit.edu.pk")!=0){

        document.getElementById("error").style.display = "block"
        document.getElementById("error").textContent = " ⚠️ Email is not of Pucit Domain"
        return false;

    }

}