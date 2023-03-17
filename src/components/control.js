

function Control(email,passwd,nome,cognome,ct){
    
    var stop = {"email": "false", "passwd": "false","nome":"false","cognome":"false"} ;

    function isVuoto(x){
        if ((x === "") || (x === "undefined")) {
            return true;
        }
        return false;
    }
 
    function verificaRegEx(x,myRegEx){
        if ( !(myRegEx.test(x)) ){
            return false;
        }
        return true;
    }    

    if (isVuoto(email)) {
        stop.email = "true";
    } 
    if (isVuoto(passwd)) {
        stop.passwd = "true";
    }
    var myRegEx = /^[A-z0-9\.\+_-]+@[A-z0-9\._-]+\.[A-z]{2,6}$/;
    if(!verificaRegEx(email,myRegEx)) {stop.email = "true";}
    myRegEx = /^[A-z0-9\+\.\?-_]{8}/;
	if(!verificaRegEx(passwd,myRegEx)) {stop.passwd = "true";}// -> FORMATO PASSWORD NON VALIDO
	myRegEx = /[0-9]/;
	if(!verificaRegEx(passwd,myRegEx)) {stop.passwd = "true";}
	myRegEx = /[A-Z]/;
	if(!verificaRegEx(passwd,myRegEx)) {stop.passwd = "true";}
    if(ct === 1){
        return stop;
    }
    
    if (isVuoto(nome)) {
        stop.nome = "true";
    } 
    if (isVuoto(cognome)) {
        stop.cognome = "true";
    }
    return stop;

    
    
}




export default Control;