
function define_sprite(_dir = 0, _sprite_side, _sprite_front, _sprite_back)
{
    var _sprite;
    
    switch (_dir) {
        case 0: _sprite = _sprite_side; break;
        case 1: _sprite = _sprite_back; break;
        case 2: _sprite = _sprite_side; break;
        case 3: _sprite = _sprite_front; break;
    	
    }
    
    return _sprite;
}



function  define_direcao(_dir, _sprite)
{
    
}



function organiza_lista(_lista)
{
    lista_batalha = array_length(_lista)
    for(var i = 0; i < lista_batalha; i++)
    { 
       // show_debug_message(_lista[i])
        //show_debug_message(_lista[i].nome + " " + string(_lista[i].ordem))
        //if(_lista[i].ordem == 0)
        //{
            //show_message(_lista[i].nome)
        //}
    }
}


function interacao_lista_dano(lista, valor)
{
    var _lista = array_length(lista)
    
    for( var i = 0; i < _lista; i++)
    {
        var info = lista[i]
        
        info.dano_atual += valor
    }
}






function interacao_lista(lista)
{
    var _lista = array_length(lista)
    
    for( var i = 0; i < _lista; i++)
    {
        return lista[i]
    }
}



