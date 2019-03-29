function ValidateEmail(email) {
    var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return expr.test(email);
};
/*function ValidateNumber(number){
	
	  if (isNaN(number)) 
	  {
	    alert("Must input numbers");
	    return false;
	  }
}*/