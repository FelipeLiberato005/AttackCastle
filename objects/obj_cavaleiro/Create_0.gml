#region VARIAVEIS
batata = 0
atual = 0

nome_personagem = undefined
objeto_player = undefined


distancia_enemy = 30
alvo_enemy = undefined

ataquei = false

cron = 0
tempo = 0
vel = 0.5

//vida = 0


//_sprite = spr_cavaleiro
//sprite_index = _sprite
image_xscale = -1
#endregion

randomise()





#region VARIAVEIS DE ESTADOS
estado_idle         = new estado()
procura_alvo        = new estado()
estado_run          = new estado()
estado_atack        = new estado()
estado_congelado    = new estado()
estado_morte        = new estado()
#endregion







#region VARIAVEIS ATRIBUTOS PRINCIPAIS


dano_atual_p = 0


cronometro_carga = 0

ataques = []
lista_alvos = []
alvo_atual = noone
tempo_recarga = 0
ataca = false
#endregion








#region Estados Pesonagem





#region ESTADO IDLE
estado_idle.inicia = function()
{
    
}


estado_idle.roda = function()
{
   
    if mouse_check_button_pressed(mb_left)
    {
        troca_estado(procura_alvo)
    }
    
}

#endregion







#region PROCURANDO O ALVO

procura_alvo.inicia = function()
{
    
    global.arena = deleta_personagem(alvo_atual, global.arena);
    alvo_atual = noone;
    var lista_alvos = [];
    
    
    for (var i = 0; i < array_length(global.arena); i++)
    {
        
        var alvo = global.arena[i];

        if (!alvo.is_hero && instance_exists(alvo.obj))
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






#region DIREÇÃO AO ALVO
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
    
    for (var i = 0; i < list; i++)
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









#region ESTADO CONGELADO

estado_congelado.inicia = function()
{
    var cor_rgb = make_colour_rgb(0, 200, 255)
    
    image_blend = cor_rgb
    image_speed = 0
}



estado_congelado.roda = function()
{
    
}
#endregion



#endregion















#region Metodos



mostra_vida = function()
{
    var list = array_length(global.personagens)
    
    for( var i = 0; i < list; i ++)
    {
        var info = global.personagens[i]
        if info.obj == object_index
    {
        draw_set_font(fnt_personagens)
        info.vida_atual.desenha_vida(x - 7, y - 32, 15, 1.5,,,,false)
        draw_set_font(-1)
    }
    }
    
}

mostra_energia = function()
{
    
    var list = array_length(global.personagens)
    
    for( var i = 0; i < list; i ++)
    {
        var info = global.personagens[i]
        var _cor = make_colour_rgb(0, 100, 210)
        if info.obj == object_index
        {
            draw_set_font(fnt_personagens)
            info.energia_atual.desenha_energia(x - 7, y - 30, 15, 1.5,_cor,,,false)
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

recarrega_ataque = function()
{
    tempo_recarga++;
}


pega_sprit = function()
{
     var list = array_length(global.personagens)
    
    for( var i = 0; i < list; i++)
    {
        var p = global.personagens[i]
        if p.obj == object_index
        {
            sprite_index = p.sprite_run
        }
    }
}


#endregion













#region PEGANDO ATRIBUTOS DO CONSTRUTOR

pegando_vida = function()
{
    var _list = array_length(global.personagens)
    
    for( var i = 0; i < _list; i++)
    {
        var personagem = global.personagens[i]
        
        if personagem.obj == object_index
        {
            vida = personagem.vida_base
        }
        
    }
}


pega_habilidade = function()
{
    
    
    var _list = array_length(global.personagens)
    
    for( var i = 0; i < _list; i++)
    {
        var personagem = global.personagens[i]
        
        if personagem.obj == object_index
        {
            array_push(ataques, personagem.tipo_ataque)
        }
        
    }
}



tira_vida = function()
{
    var list = array_length(global.personagens)
    
    for( var i = 0; i < list; i++)
    {
        var info = global.personagens[i]
        
        if info.obj == object_index
        {
            if keyboard_check_pressed(ord("B"))
            {
                info.vida_atual.perde_vida(5)
            }
        }
    }
}


#endregion



pega_habilidade()
pega_sprit()

inicia_estado(procura_alvo)



