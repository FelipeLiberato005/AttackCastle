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

/* VARIAVEL QUE GUARDARA O DANO ATUAL DO PERSONAGEM
PARA FACILITAR NA HORA QUE PRECISAR USAR O DANO ATUAL DO PERSONAGEM
NÃO PRECISARA PERCORRER A LISTA DE PERSONAGENS*/
dano_atual_p = 0

/* CRONOMETRO PARA LIMITAR O TEMPO EM QUE O PERSONAGEM ATACARÁ 
SE NÃO FIZER ISSO, SERÁ DANO INFINITO A CADA MILESIMO,
DESTRUINDO A DINAMICA DO GAME*/
cronometro_carga = 0

/* CRONOMETRO PARA LIMITAR O TEMPO EM QUE O PERSONAGEM CURARÁ 
SE NÃO FIZER ISSO, SERÁ CURA INFINITA A CADA MILESIMO,
DESTRUINDO A DINAMICA DO GAME*/
tempo_habilidade = 0


/* CRONOMETRO PARA LIMITAR O TEMPO EM QUE A HABILIDADE DO PERSONAGEM
ESTARÁ ATIVADA*/
cronometro_tempo_cura = 0

/* SÓ UMA VARIAVEL PARA CONTROLAR O MOMENTO EM QUE POSSO CHAMAR O tempo_habilidade*/
usei = true

/* GUARDA ATAQUES QUE SERÁ PEGO LA DO CONSTRUTOR
PARA FACILITAR NA HORA QUE PRECISAR USAR, PARA
NÃO PRECISAR FAZER MILHARES DE LAÇOS*/
ataques = []

//LISTA DE ALVOS, É USADO NO procura_alvo
lista_alvos = []

/* LISTA DE PERSONAGENS QUE SERÁ CURADOS
USADO NO estado_habilidade*/
lista_cura = []

//VARIAVEL QUE GUARDARÁ  O ALVO ATUAL DO PERSONAGEM
alvo_atual = noone

/* CRONOMETRO PARA A RECARGA DE ATAQUE? NÃO LEMBRO*/
tempo_recarga = 0

//VARIAVEL PARA CONTROLAR O ATAQUE DO PERSONAGEM
ataca = false

/* VARIAVEL PARA O CONSTRUTOR SABER QUAL SPRITE DEVE USAR
A IDEIA É FACILITAR NA HORA DE QUERER UMA SPRITE, INVÉS
DE FAZER UM FOR DENTRO DO CONTRUTOR FOI CRIADO UM METODO
"pega_sprit()" QUE ELE ESCOLHE A PARTIR DA STRING DESSA VARIAVEL
A VARIAVEL MUDA APARTIR DA MAQUINDA DE ESTADOS, PERCEBE-SE QUE NO COMEÇO
DE CADA ESTADO JA DEFINO O MEU sprite_estado
*/
sprite_estado = "estado_inicial"

//INICIAR CRONOMETRO DA HABILIDADE DE CURA
play_cron_habilidade = false
#endregion








#region Estados Pesonagem




/* ESTADO EM QUE O PERSONAGEM FICA PARADO (ESTADO INICIAL DO PERSONAGEM)*/
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






/* ESTADO EM QUE O PERSONAGEM VERIFICA A LISTA DE INIMIGOS DA BATALHA E ESCOLHE UM PARA SEGUIR*/
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





/* ESTADO EM QUE O PERSONAGEM VAI EM DIREÇÃO AO SEU ALVO ESCOLHIDO NO ESTADO ANTERIOR*/
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


/* ESTADO EM QUE O PERSONAGEM ESTÁ PERTO O SUFICIENTE DO ALVO PARA ATACA-LO*/
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


/* ESTADO EM QUE O PERSONAGEM USA A HABILIDADE ESPECIAL DELE*/
/* O PERSONAGEM PARA DE ATACAR O ALVO E APÓS O TERMINO DA HABILIDADE ELE PROCRA UM NOVO ALVO*/
/* O ALVO PODE SER DIFERENTE DO ANTERIAR, POIS ELE CRIA UMA NOVA LISTA COM O INIMIGOS E PEGA UM ALEATORIO DE LA*/
/* INFORMAÇÃ DA LISTA ESTA NO "procurando_alvo"*/
#region ESTADO HABILIDADE

estado_habilidade.inicia = function()
{
    sprite_estado = "estado_healer"
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
    
   if cronometro_tempo_cura >= (ataques[0][1].tempo * room_speed) 
    {
        troca_estado(procura_alvo)
        play_cron_habilidade = false
        cronometro_tempo_cura = 0
    } 
   if usei == false
   {
       play_cron_habilidade = true           
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



/* FAZ NADA POR ENQUANTO 24/08/2026*/
/* MAS JÁ É UMA IDEIA PARA CRIAR ESTADOS NEGATIVOS COMO SOFRER ATAQUES CONGELANTES POR EXEMPLO*/
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
        info.vida_atual.desenha_vida(x - 7, y - 32, 15, 1.5,c_green,,,false)
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

mostra_escudo = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        if info.obj == object_index
        {
            draw_set_font(fnt_personagens)
            info.escudo_atual.desenha_escudo(x - 7, y - 34, 15, 1.5,c_gray,,,false)
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
            else if sprite_estado == "estado_healer"
            {
                sprite_index = p.sprite_hab
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



cronometrando_habilidade = function()
{
    if play_cron_habilidade == true
    {
     cronometro_tempo_cura++   
    }
}

ganha_energia = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if info.obj == object_index
        {
            info.energia_atual.ganha_energia(0.10)
        }
    }
}


zera_energia = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if info.obj == object_index
        {
            info.energia_atual.perde_energia(100)
        }
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


zera_energia()

pega_habilidade()


inicia_estado(procura_alvo)
