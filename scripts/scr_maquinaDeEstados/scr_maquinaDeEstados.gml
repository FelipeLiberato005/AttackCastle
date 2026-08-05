#region Maquina de estados

function estado() constructor 
{
    //Iniciando o estado
    static inicia = function() {};
    //Rodando o estado
    static roda = function() {};    
    //Finalizando o estado
    static finaliza = function () {};
}

//FUNÇÕES PARA CONTROLAR A MAQUINA
//Iniciando o estado
function inicia_estado(_estado)
{
    //salvando o estado passado em uma variavel
    estado_atual = _estado
    
    //Iniciando o estado atual
    estado_atual.inicia();
}

function roda_estado()
{
     estado_atual.roda();
}

function troca_estado(_estado)
{
    estado_atual.finaliza();
    
    estado_atual = _estado;
    
    estado_atual.inicia();
}
#endregion