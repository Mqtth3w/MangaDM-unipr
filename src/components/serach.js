function Search(testo){
    
        function verificaRegEx(x,myRegEx){
            if ( !(myRegEx.test(x)) ){
                return false;
            }
            return true;
        }    
 
        var str = {"nome": "","nvol": ""};
        var splitting = testo.split(' ');
 
        if(splitting.length === 1){
            str.nome = "-1";
            return str;
        } 
        var myRegEx = /^[0-9]{1,3}$/;
        var nome = splitting[0];
        var nvol = splitting[(splitting.length)-1];
        if(!verificaRegEx(nvol,myRegEx)) { //L'ultimo non è un numero
            str.nome = "-1";
            return str;
        }
        str.nvol = nvol;
        for(var i = 1; i<splitting.length-1;i++ ){
            nome += " " +splitting[i];
        }
        str.nome = nome;
        return str;
    
}

export default Search;