function validate(){
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirm-password").value;
	 
    if(email.substring(email.indexOf('@')).localeCompare("@pucit.edu.pk")!=0){
        document.getElementById("error").style.display = "block"
        document.getElementById("error").textContent = " ⚠️ Email is not of Pucit Domain"
        return false;
    }
    else{
        document.getElementById("error").textContent = ""
        document.getElementById("error").style.display = "none"
    }
    
    if(password.localeCompare(confirm) != 0){
        document.getElementById("error").style.display = "block"
        document.getElementById("error").textContent = " ⚠️ Password are not Matching"
        return false;
    }
    else{
        document.getElementById("error").style.display = "none"
    }

}