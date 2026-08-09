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


_sprite = spr_santa
sprite_index = _sprite
image_xscale = -1
#endregion

randomise()





#region VARIAVEIS DE ESTADOS
estado_idle         = new estado()
procura_alvo        = new estado()
estado_run          = new estado()
estado_atack        = new estado()
estado_congelado    = new estado()
#endregion







#region VARIAVEIS ATRIBUTOS PRINCIPAIS


dano_atual_p = 0


cronometro_carga = 0

ataques = []
lista_alvos = []
alvo_atual = undefined
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
    
    image_blend = c_aqua
    //deleta_personagem(alvo_atual, global.arena)
    alvo_atual = undefined
    show_message(array_length(global.arena))
    var lista_alvos = [];
    show_message("Primeiro: " + string(alvo_atual))
    
    
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
        show_message("Segundo: " + string(alvo_atual.nome))
        troca_estado(estado_run)
        
    }
}


procura_alvo.roda = function()
{
    
}
#endregion






#region DIREÇÃO AO ALVO
estado_run.inicia = function()
{
    image_blend = c_orange
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

    direction = point_direction(x, y, _x - 25, _y);

    hspeed = 1;
    vspeed = 1

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
    image_blend = c_maroon
    
}

estado_atack.roda = function()
{
    var p = interacao_lista(global.personagens)
    if p.obj == object_index
    {
        if tempo_recarga >= (ataques[0][0].recarga * room_speed)
        {
            alvo_atual.vida_atual.perde_vida(ataques[0][0].dano)
            tempo_recarga = 0
            
        }
    }
    
   if alvo_atual.vida_atual.vida <= 0 {
    deleta_personagem(alvo_atual, global.arena)
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
    var p = interacao_lista(global.personagens)
    if p.obj == object_index
    {
        draw_set_font(fnt_personagens)
        p.vida_atual.desenha_vida(x - 5, y - 30, 10, 1)
        draw_set_font(-1)
    }
}


morre = function()
{
    var lista = array_length(global.batalha)
        
        for (var i = 0; i < lista; i++)
        {
            var _info = global.batalha[i]
           
            if _info.vida_atual.vida == 0
            {
                instance_destroy(_info.obj)
                array_delete(global.batalha, i, 1)
            }
        }
}


colidi_parede = function()
{
    chao = place_meeting(x, y, obj_colisor)
    move_and_collide(0, 0, obj_colisor)
}

recarrega_ataque = function()
{
    tempo_recarga++;
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
    var list = interacao_lista(global.personagens)
    
    if list.obj == object_index
    {
        array_push(ataques, list.tipo_ataque)
    }
}


testa_vida = function()
{
    var p = interacao_lista(global.personagens)
    
    if keyboard_check_pressed(ord("P"))
    {
        if p.obj == object_index
    {
        p.vida_atual.perde_vida(5)
    }    
    }
}
#endregion



pega_habilidade()


inicia_estado(estado_idle)