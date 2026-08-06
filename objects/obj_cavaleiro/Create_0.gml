#region VARIAVEIS
gravidade = 1
vel = 1

atual = 0
chao = noone
valor_interacao = 2
nome_personagem = undefined
objeto_player = undefined
distancia_enemy = 30
alvo_enemy = undefined

ataquei = false

cron = 0
tempo = 0

_sprite = noone
sprite_index = _sprite
image_xscale = -1
#endregion







#region VARIAVEIS DE ESTADOS
estado_idle     = new estado()
estado_run      = new estado()
estado_atack      = new estado()
estado_congelado      = new estado()
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
    hspeed = vel
    
    var _lista = array_length(global.enemy)
    
    for(var i = 0; i < _lista; i++)
    {
        var _info = global.enemy[i]
        var enemy = _info.obj
        
        
        if(instance_exists(enemy))
        {
            if(point_distance(objeto_player.x, objeto_player.y, enemy.x, enemy.y) < distancia_enemy)
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
    
    var _lista = array_length(global.enemy)
    
    for(var i = 0; i < _lista; i++)
    {
        var _info = global.enemy[i]
        var enemy = _info.obj
        
        if cronometro_carga <= 0
        {
            _info.vida_atual.perde_vida(dano_atual_p) 
                 
        }
        cronometro_carga++
        
        //troca_estado(estado_congelado) 
    }
    
    if(instance_exists(enemy))
        {
            if(point_distance(objeto_player.x, objeto_player.y, enemy.x, enemy.y) < distancia_enemy)
        {
            troca_estado(estado_run)
        }
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
    var lista_p = array_length(global.personagens)
    
    for(var i = 0; i < lista_p; i++)
    {
        if(global.personagens[i].nome == nome_personagem)
        {
            _sprite = global.personagens[i].sprite
        }
    }
}




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


testa_vida = function()
{
    if keyboard_check_pressed(ord("F"))
    {
        var lista = array_length(global.batalha)
        
        for (var i = 0; i < lista; i++)
        {
            var _info = global.batalha[i]
            var nome = _info.nome
            
            if nome == "Cavaleiro"
            {
                _info.vida_atual.perde_vida(5)
            }
        }
    }
}
#endregion













#region PEGANDO ATRIBUTOS DO CONSTRUTOR

pega_dano = function()
{
    
    var lista = array_length(global.batalha)
    
    for( var i = 0; i < lista; i++)
    {
        var info = global.batalha[i]
        
        if info.obj == objeto_player
        {
            dano_atual_p = info.dano_atual
        }
    }
    
}


aumenta_dano_atual = function()
{
    if keyboard_check_pressed(ord("Z"))
    {
        interacao_lista_dano(global.batalha, 10)    
    }
    
}



pega_ataques = function()
{
    
    //var info = interacao_lista(global.batalha)
     var _lista = array_length(global.batalha)
    
    for( var i = 0; i < _lista; i++)
    {
        var info =  global.batalha[i]
        
        if info.obj == objeto_player
        {
            if array_length(ataques) <= 0
            {
                array_push(ataques, info.tipo_ataque)    
            }
            
        }
        
    }
    
    
}


reseta_recarga = function()
{
    if array_length(ataques) >= 0
    { 
        tempo = room_speed * ataques[0][0].recarga    
        cron++ 
        if cron >= tempo
        {
            cron = 0;
            cronometro_carga = 0;
        }
    }
    
    
}

#endregion






inicia_estado(estado_idle)