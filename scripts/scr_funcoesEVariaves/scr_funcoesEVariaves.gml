


/*     PEGA SPRITE    */
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









/*   DELETA PERSONAGEM DA LISTA ESCOLHIDA   */

function deleta_personagem(alvo, lista)
{
    
   {
    if (alvo != noone)
    {
        var indice = array_get_index(lista, alvo);

        if (indice != -1)
        {
            array_delete(lista, indice, 1);
        }
    }

    return lista;
}
}
    
    
    



 /*  FUNÇÃO PARA PEGAR DISTANCIA DE OBJETOS */

///@description PEGA A DISTANCIA DO OBJETO E COMPARA COM A DO ALVO
///@parameter {num} menor_ou_maior 1 = sinal de maior != 1 menor
///@parameter {object} alvo_atual Alvo atual
///@parameter {function} estado_personagem Estado em que será direcionado após a condição ser atingida
///@param {num} valor_distancia Valor da distancia entre o objeto e o alvo atual
function distancia_alvo(alvo_atual, estado_personagem, valor_distancia, menor_ou_maior )
{
    
    var _x = alvo_atual.obj.x;
    var _y = alvo_atual.obj.y;
    var sinal = menor_ou_maior
    
    var _dist = point_distance(x, y, _x, _y);

    
   
    direction = point_direction(x, y, _x, _y);

    x += lengthdir_x(2, direction);
    y += lengthdir_y(2, direction);
    
    if (x > _x)
    {
        image_xscale = 1;
    }
    else
    {
        image_xscale = -1;
    }
    
    
    if sinal == 1
    { 
        if (point_distance(x, y, _x, _y) > valor_distancia) 
        {
            troca_estado(estado_personagem);
        }       
    }
    else
    {
        if (point_distance(x, y, _x, _y) < valor_distancia) 
        {
            troca_estado(estado_personagem);
        }
    }
    
}




