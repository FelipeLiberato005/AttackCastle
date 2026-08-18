#region VARIAVEIS
batata = 0
atual = 0

nome_personagem = undefined
objeto_player = undefined


distancia_enemy = room_width
alvo_enemy = undefined

ataquei = false

cron = 0
tempo = 0
vel = 0.5

//vida = 0


//_sprite = spr_santa
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
estado_habilidade   = new estado()
#endregion







#region VARIAVEIS ATRIBUTOS PRINCIPAIS


dano_atual_p = 0


cronometro_carga = 0

tempo_habilidade = 0

usei = true

ataques = []
lista_alvos = []
lista_cura = []
alvo_atual = noone
tempo_recarga = 0
ataca = false
sprite_estado = "estado_inicial"
#endregion








#region Estados Pesonagem





#region ESTADO IDLE
estado_idle.inicia = function()
{
    sprite_estado = "estado_inicial"
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
    sprite_estado = "estado_alvo"
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
    if keyboard_check_pressed(vk_enter)
    {
        troca_estado(estado_habilidade)
    }
}
#endregion






#region DIREÇÃO AO ALVO
estado_run.inicia = function()
{
    sprite_estado = "estado_segue"
    
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
    
    
    
      if (point_distance(x, y, _x, _y) < distancia_enemy)
    {
        troca_estado(estado_atack);
    }
    
   
}

#endregion



#region ESTADO ATACK
estado_atack.inicia = function()
{
    sprite_estado = "estado_atack"
    vspeed = 0
    hspeed = 0
    
    
}

estado_atack.roda = function()
{
    
    var list = array_length(global.arena)
    
    for( var i = 0; i < list; i++)
    {
      var p = global.arena[i]
      if p.obj == object_index && instance_exists(p.obj) 
    {
        if tempo_recarga >= (ataques[0][0].recarga * room_speed)
        {
            alvo_atual.vida_atual.perde_vida(p.dano_atual)
            var k = instance_create_layer(alvo_atual.obj.x, alvo_atual.obj.y - 20, layer, obj_contagem)  
            k.txtCura = p.dano_atual
            tempo_recarga = 0
          
        } 
    }    
    }
    
    
    
    
    if alvo_atual.is_morto == true{
        troca_estado(procura_alvo)
    }
}

#endregion



#region ESTADO HABILIDADE

estado_habilidade.inicia = function()
{
    //show_message("habilidade!")
    lista_cura = []
    //instance_create_layer(96, 64, layer, obj_area_cura)
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if info.is_hero != false
        {
            array_push(lista_cura, info)    
        }
        
    }
}


estado_habilidade.roda = function()
{
    
   if usei == false
   {          
       
       var list = array_length(lista_cura)
       for( var i = 0; i < list; i++)
       {
           var info = lista_cura[i]
           
           if instance_exists(info.obj)
           {
               var _x = info.obj.x
               var _y = info.obj.y
               cura = ((ataques[0][1].cura/100) * dano_atual_p)
               
               
               info.vida_atual.ganha_vida(cura)
               var k = instance_create_layer(_x, _y - 20, layer, obj_contagem)    
               k.txtCura = cura 
               k.cor = c_green
           }
            
        }
        usei = true
    
   }    
        
        //show_message("Segundo: " + string(tempo_habilidade))
       //show_debug_message("Cura: " + string(cura) + "Dano: " + string(dano_atual_p) )
   
   }
#endregion




#region ESTADO CONGELADO

estado_congelado.inicia = function()
{
    sprite_estado = "estado_congelado"
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
            info.energia.desenha_energia(x - 7, y - 30, 15, 1.5,_cor,,,false)
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
            if sprite_estado == "estado_segue" or sprite_estado == "estado_alvo" 
            {
                sprite_index = p.sprite_run    
            }
            else if sprite_estado == "estado_atack"
            {
                sprite_index = p.sprite_atack
            }
            
        }
    }
}


seleciona_habilidade = function()
{
    
    var list = array_length(global.arena)
    
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if info.obj == object_index
        {
            info.is_selection = true
        }
    }
    
}


recarrega_habilidade = function()
{
    tempo_habilidade++
    
    if tempo_habilidade >= ataques[0][1].recarga
    {
        tempo_habilidade = 0
        usei = false
    }
}
#endregion













#region PEGANDO ATRIBUTOS DO CONSTRUTOR


pega_habilidade = function()
{
    var list = interacao_lista(global.personagens)
    
    if list.obj == object_index
    {
        array_push(ataques, list.tipo_ataque)
    }
}



pega_dano_atual = function()
{
    var list = array_length(global.personagens)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        if info.obj == object_index
        {
            dano_atual_p = info.dano_atual
        }
    }
}




aumenta_dano = function()
{
    var list = array_length(global.personagens)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        if info.obj == object_index
        {
            if keyboard_check_pressed(ord("X"))
            {
                info.dano_atual++;
            }
        }
    }
}

#endregion




pega_habilidade()


inicia_estado(procura_alvo)