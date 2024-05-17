/* VALIDACIONES */

// Valida el formato del rut con su cadena completa "XXXXXXXX-X"
var Fn = {
	validaRut : function (rutCompleto) {
		if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
			return false;
		var tmp 	= rutCompleto.split('-');
		var digv	= tmp[1]; 
		var rut 	= tmp[0];
		if ( digv == 'K' ) digv = 'k' ;
		return (Fn.dv(rut) == digv );
	},
	dv : function(T){
		var M=0,S=1;
		for(;T;T=Math.floor(T/10))
			S=(S+T%10*(9-M++%6))%11;
		return S?S-1:'k';
	}
}

// Agrega guión al rut en caso de no contenerlo
function agregar_guion() {
    let rut = $("#v_rut").val().replaceAll(".","").replaceAll("-","");
    if (rut.length > 1){
        rut = rut.substring(0, rut.length-1) + "-" + rut.substring(rut.length-1);
    }
    $("#v_rut").val(rut);
    return rut;
}

// Valida solo el ingreso de letras y espacio.
function validar_letras() {
    let regex = new RegExp("^[a-zA-Z ]+$");
    let key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
      event.preventDefault();
      return false;
    }
}

// Permite buscar un caracter en especifico y retorna la cantidad de veces que se repite.
function buscar_caracter(mail, caracter) {
    let contador = 0;
    for (let i = 0; i < mail.length; i++) {
      if (mail[i] === caracter)
        contador += 1;
    }
    return contador;
}

// validacion punto despues de arroba en email.
function validar_punto_email(mail) {
    let despues_arroba = mail.split("@")[1];
    let contador = 0;
    for (let i = 0; i < despues_arroba.length; i++) {
      if (despues_arroba[i] === ".")
        contador += 1;
    }
    return contador;
}

// Muestra un mensaje de error cuando el formato del email ingresado no cumple con el estandar.
function mostrar_error_email() {
    let email = $("#v_email").val();
    let invalid = "";

    if (email != "" && email.includes("@")) {
        let caract_duplicado = buscar_caracter(email, "@");
        let existe_punto = validar_punto_email(email);

        let last_pos = "";
        let last_punto = "";
        // Verificamos que exista algún caracter despues del punto.
        if (existe_punto >= 1) {
            last_pos = email.split(".");
            last_punto = last_pos[last_pos.length -1].length;
        }

        // Validamos que el @ no este duplicado, que exista solo 1 punto despues del @ y que exista algún caracter despues del ultimo punto (EJM. @prueba.cl)
        if(caract_duplicado > 1 || existe_punto == 0 || existe_punto > 1 || last_punto == 0){
            invalid = "¡Formato de email incorrecto!";
            $("#invalid_email").text(invalid)
            return false;
        }else{
            // Verificamos que exista algun caracter entre el @ y el punto.
            let last_arroba = email.split("@")[1];
            if (last_arroba.split(".")[0].length > 0) {
                $("#invalid_email").text("")
                return true;
            }else{
                invalid = "¡Formato de email incorrecto!";
                $("#invalid_email").text(invalid)
                return false;
            }
        }
    }else{
        if (email != "") {
            invalid = "¡Formato de email incorrecto!";
            $("#invalid_email").text(invalid)
            return false;
        }else{
            $("#invalid_email").text("")
            return false;
        }
    }
}

// Permite validar para evitar el ingreso de caracteres especiales.
function valida_caracteres_email() {
    let regex = new RegExp("^[a-zA-Z@.0-9_-]+$");
    let key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
      event.preventDefault();
      return false;
    }
}

// Validamos que el alias contenga numeros y letras, además que tenga más de 5 caracteres
function validar_alias(alias) {

    // Validamos por separado que contenga numeros y letras. 
    let solo_letras = alias.trim().toLowerCase().replace(/\d+/g, "");
    let solo_numeros = alias.trim().toLowerCase().replace(/[a-z.]/g, "");

    if (alias != "") {
        if (solo_letras.length > 0 && solo_numeros.length > 0 && alias.trim().length >= 5) {
            invalid = "";
            $("#invalid_alias").html(invalid);

            return true;
        }else{
            invalid = "¡Debe contener números, letras <br> y más de 5 caracteres!";
            $("#invalid_alias").html(invalid);
            return false;
        }
    }else{
        if (alias != "") {
            invalid = "¡Debe ingresar un alias!";
            $("#invalid_alias").html(invalid);
            return false;
        }else{
            $("#invalid_alias").text("")
            return false;
        }
    }
}

// Muestra un mensaje de error cuando el rut del usuario no es válido.
function mostrar_error_rut(rut1) {
    let invalid = ""; 
    let rut = rut1.replaceAll(".","");
    if (!rut.includes("-")) rut = agregar_guion(rut);

    if(!Fn.validaRut(rut) && rut != "") invalid = "¡Rut inválido!";

    $("#invalid_rut").text(invalid)
}

// Validamos que el nombre no este vacio.
function validar_nombre(nombre) {
    let invalid = ""; 
    if (nombre.trim() == "") {
        invalid = "¡Debe ingresar un nombre!";
    }
    
    $("#invalid_name").text(invalid);
}

// Permite validar todos los campos contenidos en el formulario.
function validar_campos() {
    let nombres = $("#v_nombre").val().trim();
    let alias = $("#v_alias").val().trim();
    let rut = $("#v_rut").val().trim().replaceAll(".","");
    let email = $("#v_email").val().trim();
    let select_region = $("#select_region").val();
    let select_comuna = $("#select_comuna").val();
    let select_candidato = $("#select_candidato").val();
    let nosotros = $("input[name='checks_nosotros']:checked").length;

    let result_email = mostrar_error_email(email);
    let result_alias = validar_alias(alias);
    // Agrega guión al rut en caso de no contenerlo
    if (!rut.includes("-")) rut = agregar_guion(rut);

    // En primera instancia validamos que el formato del rut sea correcto.
    if (Fn.validaRut(rut)){
        // Verificamos que seleccione un minimo de 2 opciones
        if (nosotros < 2) alert("¡Debe seleccionar al menos 2 opciones de como se enteró de nosotros!");
        
        // Validamos que el resto de campos cumpla con los estandares y validaciones correspondientes.
        if ((nombres && select_region && select_comuna && select_candidato) != "" && result_alias && result_email && nosotros >= 2) return true; else alert("¡Debes completar todos los campos!"); return false; 
    }else{
        alert('¡Debes ingresar un Rut válido!')
        return false;
    }
}
/* FIN VALIDACIONES */

// Permite cargar las regiones a visualizar.
function traer_regiones() {
    $.ajax({
        type:'POST',
        url: './back/back.php',
        data:{traer_regiones: 1},
        success: function (data) {
            var json = JSON.parse(data);
            let html_r = "";
            let regiones = [];
            regiones = json;
            if (regiones.length > 0) {
                html_r = `<option value="">Seleccione una región</option>`;
                regiones.forEach(el => {
                    html_r += `<option value="`+el.id+`">`+el.region+`</option>`;
                });
            }

            $("#select_region").html(html_r);
        },
        error: function () {
            alert("¡Ocurrio un problema al cargar las regiones!")
        }
    });
}

// Permite filtrar las comunas acorde a la región seleccionada
function filtrar_comunas() {
    let region_id = $("#select_region").val();

    $.ajax({
        type:'POST',
        url: './back/back.php',
        data:{filtrar_comunas: 1, region_id},
        success: function (data) {
            var json = JSON.parse(data);
            let html_c = "";
            let comunas = [];
            comunas = json;
            if (comunas.length > 0) {
                html_c = `<option value="">Seleccione una comuna</option>`;
                comunas.forEach(el => {
                    html_c += `<option value="`+el.id+`">`+el.comuna+`</option>`;
                });
            }

            $("#select_comuna").html(html_c);
        },
        error: function () {
            alert("¡Ocurrio un problema al cargar las comunas!")
        }
    });
}

// Permite mostrar el o los candidatos
function traer_candidatos() {
    $.ajax({
        type:'POST',
        url: './back/back.php',
        data:{traer_candidato: 1},
        success: function (data) {
            var json = JSON.parse(data);
            let html_c = "";
            let candidato = [];
            candidato = json;
            if (candidato.length > 0) {
                html_c = `<option value="">Seleccione un candidato</option>`;
                candidato.forEach(el => {
                    html_c += `<option value="`+el.id+`">`+el.nombre+`</option>`;
                });
            }
            $("#select_candidato").html(html_c);

        },
        error: function () {
            alert("¡Ocurrio un problema al cargar los candidatos!")
        }
    });
}

// Permite traer los valores de checkbox de "como se enteró de nosotros"
function traer_nosotros() {
    $.ajax({
        type:'POST',
        url: './back/back.php',
        data:{traer_nosotros: 1},
        success: function (data) {
            var json = JSON.parse(data);
            let html_n = "";
            let nosotros = [];
            nosotros = json;
            if (nosotros.length > 0) {
                nosotros.forEach(el => {
                    html_n += `
                        <label for="check_`+el.id+`">
                            <input name="checks_nosotros" id="check_`+el.id+`" type="checkbox" value="`+el.id+`" required>`+el.nombre+`
                        </label>`;
                });
            }
            $("#nosotros_container").html(html_n);
        },
        error: function () {
            alert("¡Ocurrio un problema al cargar la información de como se enteró de nosotros!")
        }
    });
}

// Permite registrar el voto y los datos del votante.
function enviar_voto() {
    event.preventDefault();

    let nombres = $("#v_nombre").val().trim();
    let alias = $("#v_alias").val().trim();
    let rut = $("#v_rut").val().trim().replaceAll(".","");
    let email = $("#v_email").val().trim();
    let region_id = $("#select_region").val();
    let comuna_id = $("#select_comuna").val();
    let candidato_id = $("#select_candidato").val();
    let nosotros = [];

    $("input[name='checks_nosotros']:checked").each(function(){
        nosotros.push($(this).val());
    });

    // Verificamos que se cumplan todas las validaciones para guardar el voto.
    let validado = validar_campos();

    if (validado) {
        $.ajax({
            type: 'POST',
            url: './back/back.php',
            data: {
                enviar_voto: 1, nombres, alias, rut, email, region_id, comuna_id, candidato_id, nosotros
            },
            success: function(data) {
                var json = JSON.parse(data);
                if (parseInt(json.error) == 0){
                    $(".form-container")[0].reset(); 
                    $("#select_comuna").html("");
                }

                alert(json.mensaje);
            },
            error: function () {
                alert("¡Ocurrio un problema al enviar la votación!")
            }
        });
    }
}

$(document).ready(function() {
    // Cargamos funciones por defecto.
    traer_regiones();
    traer_candidatos();
    traer_nosotros();

    // Agrega guión al rut en función al soltar tecla.
    $("#v_rut").on("keyup", function(){ agregar_guion(); });
    agregar_guion();

    // Muestra un error cuando el rut ingresado es incorrecto.
    $("#v_rut").on("change", function(){ mostrar_error_rut(this.value); });

    // Validamos que el nombre solo permita el ingreso de letras
    $("#v_nombre").on("keypress", function(){ validar_letras(); });

    // Validamos que el alias contenga letras y numeros.
    $("#v_alias").on("keyup", function(){ validar_alias(this.value); });

    // Validamos que exista nombre 
    $("#v_nombre").on("keyup", function(){ validar_nombre(this.value);});

    // Validamos que el mail cumpla con estandares.
    $("#v_email").on("keypress", function(){ valida_caracteres_email(); });
});