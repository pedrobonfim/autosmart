function finalizarAgora() {
	var nome = $("#userName").val();
	$.get("edit?nomeUsuario=" + nome, function(data) {
		var retorno = data;
		
		
	});
	
}

function editaUsuario(nomeUsuario) {
    $.post("edit", {'nomeUsuario' : nomeUsuario}, function() {
      // selecionando o elemento html através da 
      // ID e alterando o HTML dele 
      $("#edit_"+nomeUsuario).html("edit");
    });
  }

function formata_data(data) {
	if(mascaraInteiro(data)==false){
	        event.returnValue = false;
	}       
	return formataCampo(data, '00/00/0000', event);
	
}

//function validarData(data) {
//	if(data.value.length <= 9){
//		$("input[name='data']").val( '' );  
//	}
//}
			
//(new Date()).fromString("3/9/2013") : 3 of september
//(new Date()).fromString("3/9/2013", false) : 9 of march
function validarData(str, ddmmyyyy) {
	 var m = str.value.match(/(\d+)(-|\/)(\d+)(?:-|\/)(?:(\d+)\s+(\d+):(\d+)(?::(\d+))?(?:\.(\d+))?)?/);
	 if(m[2] == "/"){
	     if(ddmmyyyy === false)
	         return new Date(+m[4], +m[1] - 1, +m[3], m[5] ? +m[5] : 0, m[6] ? +m[6] : 0, m[7] ? +m[7] : 0, m[8] ? +m[8] * 100 : 0);
	     return new Date(+m[4], +m[3] - 1, +m[1], m[5] ? +m[5] : 0, m[6] ? +m[6] : 0, m[7] ? +m[7] : 0, m[8] ? +m[8] * 100 : 0);
	 }
	 return new Date(+m[1], +m[3] - 1, +m[4], m[5] ? +m[5] : 0, m[6] ? +m[6] : 0, m[7] ? +m[7] : 0, m[8] ? +m[8] * 100 : 0);
}

function MascaraRG(rg){
        if(mascaraInteiro(rg)==false){
                event.returnValue = false;
        }       
        return formataCampo(rg, '00.000.000-0', event);
}

function MascaraTelefone(telefone){
    if(mascaraInteiro(telefone)==false){
            event.returnValue = false;
    }       
    return formataCampo(telefone, '(00) 00000-0000', event);
}

//formata de forma generica os campos
function formataCampo(campo, Mascara, evento) { 
        var boleanoMascara; 

        var Digitato = evento.keyCode;
        exp = /\-|\.|\/|\(|\)| /g
        campoSoNumeros = campo.value.toString().replace( exp, "" ); 

        var posicaoCampo = 0;    
        var NovoValorCampo="";
        var TamanhoMascara = campoSoNumeros.length;; 

        if (Digitato != 8) { // backspace 
                for(i=0; i<= TamanhoMascara; i++) { 
                        boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                                                || (Mascara.charAt(i) == "/"));
                        boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
                                                                || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) ;
                        if (boleanoMascara) { 
                                NovoValorCampo += Mascara.charAt(i); 
                                  TamanhoMascara++;
                        }else { 
                                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
                                posicaoCampo++; 
                          }              
                  }      
                campo.value = NovoValorCampo;
                  return true; 
        }else { 
                return true; 
        }
}

//adiciona mascara ao CPF
function MascaraCPF(cpf){
        if(mascaraInteiro(cpf)==false){
                event.returnValue = false;
        }       
        return formataCampo(cpf, '000.000.000-00', event);
}

//valida numero inteiro com mascara
function mascaraInteiro(){
        if (event.keyCode < 48 || event.keyCode > 57){
                event.returnValue = false;
                return false;
        }
        return true;
}

//valida o CPF digitado
function ValidarCPF(Objcpf){
        var cpf = Objcpf.value;
        exp = /\.|\-/g
        cpf = cpf.toString().replace( exp, "" ); 
        var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
        var soma1=0, soma2=0;
        var vlr =11;

        for(i=0;i<9;i++){
                soma1+=eval(cpf.charAt(i)*(vlr-1));
                soma2+=eval(cpf.charAt(i)*vlr);
                vlr--;
        }       
        soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
        soma2=(((soma2+(2*soma1))*10)%11);

        var digitoGerado=(soma1*10)+soma2;
        if(digitoGerado!=digitoDigitado)        
        	$("input[name='cpf']").val( '' );    
}