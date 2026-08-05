#region VARIAVEIS
gravidade = 1
vel = 1
estado_idle     = new estado()
estado_run      = new estado()
estado_atack      = new estado()
atual = 0
chao = noone
valor_interacao = 2
nome_personagem = undefined
objeto_enemy = undefined
distancia_enemy = 15

_sprite = noone
sprite_index = _sprite
image_xscale = 1

#endregion












#region Estados Pesonagem

#region ESTADO IDLE
estado_idle.inicia = function()
{
    
}


estado_idle.roda = function()
{
    
    if !chao{
        y += gravidade
    }
    else {
    	troca_estado(estado_run)
    }
    
    
}

#endregion


#region ESTADO RUN
estado_run.inicia = function()
{
    
}

estado_run.roda = function()
{
    hspeed = -vel
    
     var _lista = array_length(global.batalha)
    
    for(var i = 0; i < _lista; i++)
    {
        var _info = global.batalha[i]
        var hero = _info.obj
        
        
        if(instance_exists(hero))
        {
            if(point_distance(objeto_enemy.x, objeto_enemy.y, hero.x, hero.y) < distancia_enemy)
        {
            troca_estado(estado_atack)
        }
        }
        
    }
}
#endregion



#region ESTADO ATACK

estado_atack.inicia = function()
{
    hspeed = 0;
}



estado_atack.roda = function()
{
    
}

#endregion

#endregion















#region Metodos
toca_chao = function()
{
    chao = place_meeting(x, y - valor_interacao, obj_colisor)
}


escolhe_personagem = function()
{
    sprite_index = _sprite
}



troca_skin = function()
{
    var lista_p = array_length(global.p_enemy)
    
    for(var i = 0; i < lista_p; i++)
    {
        if(global.p_enemy[i].nome == nome_personagem)
        {
            _sprite = global.p_enemy[i].sprite
            image_blend = global.p_enemy[i].cor
        }
    }
}


morre = function()
{
    var lista = array_length(global.enemy)
        
        for (var i = 0; i < lista; i++)
        {
            var _info = global.enemy[i]
           
            if _info.vida_atual.vida == 0
            {
                instance_destroy(_info.obj)
                array_delete(global.enemy, i, 1)
            }
        }
}


mostra_vida = function()
{
    var tam = array_length(global.enemy)
    for (var i = 0; i < tam; i++) {
    	var _info = global.enemy[i]
        var nome = _info.nome
        var _x = _info.obj.x
        var _y = _info.obj.y
        
       
        draw_set_font(fnt_personagens)
        _info.vida_atual.desenha_vida(_x - 5, _y - 30, 10, 1, , , , true)
        draw_text(_x - 8, _y - 50, _info.vida_atual.vida)
        draw_set_font(-1)
        
    }
}


#endregion











inicia_estado(estado_idle)