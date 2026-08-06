#region VARIAVEIS

atual = 0

nome_personagem = undefined
objeto_player = undefined


distancia_enemy = 30
alvo_enemy = undefined

ataquei = false

cron = 0
tempo = 0
vel = 0.5

_sprite = spr_santa
sprite_index = _sprite
image_xscale = -1
#endregion







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
}


procura_alvo.roda = function()
{
    hspeed = 0.5
    direction = point_direction(x, y, obj_enemy2.x, obj_enemy2.y)
    
}

#endregion







#region ESTADO RUN
estado_run.inicia = function()
{
    
}

estado_run.roda = function()
{
   
}
#endregion









#region ESTADO ATACK

estado_atack.inicia = function()
{
    
    
}

estado_atack.roda = function()
{
    
    
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
    var tam = array_length(global.batalha)
    for (var i = 0; i < tam; i++) {
    	var _info = global.batalha[i]
        var nome = _info.nome
        var _x = _info.obj.x
        var _y = _info.obj.y
        
       
        draw_set_font(fnt_personagens)
        _info.vida_atual.desenha_vida(_x - 5, _y - 30, 10, 1, , , , true)
        draw_text(_x - 8, _y - 50, _info.vida_atual.vida)
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


#endregion













#region PEGANDO ATRIBUTOS DO CONSTRUTOR



#endregion






inicia_estado(estado_idle)