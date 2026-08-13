
image_blend = make_colour_rgb(255, 0, 0)


#region VARIAVEIS
vel = 1
alvo_atual = noone

tempo_recarga = 0
ataques = []
#endregion





#region VARIAVEIS ESTADOS
estado_idle         = new estado()
procura_alvo        = new estado()
estado_run          = new estado()
estado_atack        = new estado()
estado_congelado    = new estado()
estado_morte        = new estado()
#endregion






#region MAQUINAS DE ESTADOS

#region PROCURA ALVO

procura_alvo.inicia = function()
{
    global.arena = deleta_personagem(alvo_atual, global.arena);
    alvo_atual = noone;
    var lista_alvos = [];
    
    
    for (var i = 0; i < array_length(global.arena); i++)
    {
        
        var alvo = global.arena[i];

        if (alvo.is_hero == true && instance_exists(alvo.obj))
        {
            array_push(lista_alvos, alvo);
        }
    }

    if (array_length(lista_alvos) > 0)
    {
        var indice = irandom(array_length(lista_alvos) - 1);

        alvo_atual = lista_alvos[indice];

        troca_estado(estado_run);
    }
}



procura_alvo.roda = function()
{
    
}

#endregion








#region ESTADO INDO EM DIREÇÃO AO ALVO
estado_run.inicia = function()
{
    
}



estado_run.roda = function()
{
    if (!instance_exists(alvo_atual.obj))
    {
        troca_estado(procura_alvo);
        return;
    }

    var _x = alvo_atual.obj.x;
    var _y = alvo_atual.obj.y;
    
    
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
    
    
      if (point_distance(x, y, _x, _y) < 25)
    {
        troca_estado(estado_atack);
    }
    
}
#endregion






#region ESTADO ATACK

estado_atack.inicia = function()
{
    vspeed = 0
    hspeed = 0
}


estado_atack.roda = function()
{
    var list = array_length(global.arena)
    
    for( var i = 0; i < list; i++)
    {
        var p = global.arena[i]
        if p.obj == object_index
    {
        if tempo_recarga >= (ataques[0][0].recarga * room_speed)
        {
            alvo_atual.vida_atual.perde_vida(ataques[0][0].dano)
            tempo_recarga = 0
            
        }
    }    
    }
    
    if alvo_atual.is_morto == true{
        troca_estado(procura_alvo)
    }
}
#endregion

#endregion







#region METODOS TESTE



desenha_vida = function ()
{
    var list = array_length(global.p_enemy)
    for( var i = 0; i < list; i++)
    {
        var p = global.p_enemy[i]
        
        if(p.obj == object_index)
        {
            draw_set_font(fnt_personagens)
            p.vida_atual.desenha_vida(x - 5, y - 30, 10, 1)
            draw_set_font(-1)
        }
    }
}

morre = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var p = global.arena[i]
        
        if p.obj == object_index
        {
            if p.vida_atual.vida <= 0
            {
                p.is_morto = true
                instance_destroy()
            }
        }
        
    }
}

pega_ataques = function()
{
    var list = array_length(global.p_enemy)
    
    for( var i = 0; i < list; i++)
    {
        var p = global.p_enemy[i]
        
        if p.obj == object_index
        {
            array_push(ataques, p.tipo_ataque)
        }
    }
}


recarrega_ataque = function()
{
    tempo_recarga++;
}


pega_sprit = function()
{
     var list = array_length(global.p_enemy)
    
    for( var i = 0; i < list; i++)
    {
        var p = global.p_enemy[i]
        if p.obj == object_index
        {
            sprite_index = p.sprite_run
        }
    }
}

#endregion


pega_ataques()
pega_sprit()

inicia_estado(procura_alvo)