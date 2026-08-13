function criar_personagem(
    _nome,
    _cor,
    _obj,
    idle_spr    = sprite_personagem_teste,
    run_spr     = sprite_personagem_teste,
    atack_spr   = sprite_personagem_teste,
    hab_spr     = sprite_personagem_teste,
    _is_hero    = true,
    _vida_base  = 100,
    _dano       = 10,
    morto       = false
) constructor {
    
    /* NOME PERSONAGEM*/
    nome = _nome
    
    /* COR PERSONAGEM*/
    cor = _cor
    
    /* OBJETO DO PERSONAGEM*/
    obj = _obj
    
    /* SPRITES PERSONAGEM*/
    /*IDLE*/sprite_idle = idle_spr
    /*RUN*/sprite_run = run_spr
    /*ATACK*/sprite_atack = atack_spr
    /*HABILIDADE*/sprite_hab = hab_spr
    
    
    
    /* PERSONAGEM ALIADO OU INIMIGO?*/
    is_hero = _is_hero
    
    /* VIDA INICIAL DO PERSONAGEM*/
    vida_base = _vida_base
    
    /* VIDA ATUAL DO PERSONAGEM*/
    vida_atual = new scr_vida(vida_base)
    
    /* DANO INICIAL DO PERSONAGEM*/
    dano_base = _dano
    
    /* DANO ATUAL DO PERSONAGEM*/
    dano_atual = dano_base
    
    /* PERSONAGEM ESTÁ MORTO OU VIVO?*/
    is_morto = morto
    
    /* LISTA DE HABILIDADES DO PERSONAGEM*/
    tipo_ataque = []
    
}



#region HEROIS



#region SANTA
var santa = new criar_personagem(
    /*NOME*/
    "Santa",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_santa,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    spr_santa_run,
    /*SPRITE_ATACK*/
    spr_santa_atack,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    ,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )

/*STRUCT DE HABILIDADES*/
array_push(santa.tipo_ataque,
        //NOME         RECARGA     DANO
        {nome:"ATK", recarga:0.8, dano: 15})
#endregion





#region CAVALEIRO
var cavaleiro = new criar_personagem(
    /*NOME*/
    "CAVALEIRO",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_cavaleiro,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    spr_cavaleiro,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    ,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )

/*STRUCT DE HABILIDADES*/
array_push(cavaleiro.tipo_ataque,
        //NOME         RECARGA     DANO
        {nome:"ATK", recarga:0.8, dano: 15})
#endregion




#region ORC
var orc = new criar_personagem(
    /*NOME*/
    "ORC",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_orc,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    ,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )

/*STRUCT DE HABILIDADES*/
        //NOME         RECARGA     DANO
array_push(orc.tipo_ataque, 
        {nome:"ATK", recarga:2.0, dano:22})

#endregion




#region ARQUEIRO
var arqueiro = new criar_personagem(
    /*NOME*/
    "ARQUEIRO",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_arqueiro,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    spr_arqueira_run,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    ,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(arqueiro.tipo_ataque, 
        {nome:"ATK", recarga:0.2, dano:11})

#endregion




#region MAGO
var mago = new criar_personagem(
    /*NOME*/
    "ORC",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_mago,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    ,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(mago.tipo_ataque, 
        {nome:"ATK", recarga:0.6, dano:13})

#endregion



#endregion











#region ENEMY


#region ENEMY 1
var enemy_1 = new criar_personagem(
    /*NOME*/
    "ENEMY 1",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_enemy_1,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    false,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(enemy_1.tipo_ataque, 
        {nome:"ATK", recarga:0.8, dano: 15})
#endregion



#region ENEMY 2
var enemy_2 = new criar_personagem(
    /*NOME*/
    "ENEMY 2",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_enemy_2,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    false,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(enemy_2.tipo_ataque, 
        {nome:"ATK", recarga:1.5, dano: 18})

#endregion



#region ENEMY 3
var enemy_3 = new criar_personagem(
    /*NOME*/
    "ENEMY 3",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_enemy_3,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    false,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(enemy_3.tipo_ataque, 
        {nome:"ATK", recarga:1.3, dano: 18})

#endregion



#region ENEMY 4
var enemy_4 = new criar_personagem(
    /*NOME*/
    "ENEMY 4",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_enemy_4,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    false,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(enemy_4.tipo_ataque, 
        {nome:"ATK", recarga:0.5, dano: 13})

#endregion



#region ENEMY 5
var enemy_5 = new criar_personagem(
    /*NOME*/
    "ENEMY 5",
    /*COR*/
    make_colour_rgb(255, 255, 255),
    /*OBJETO*/
    obj_enemy_5,
    /*SPRITE_IDLE*/
    ,
    /*SPRITE_RUN*/
    ,
    /*SPRITE_ATACK*/
    ,
    /*SPRITE_HAB*/
    ,
    /*HEROI?*/
    false,
    /*VIDA BASE*/
    50,
    /*DANO*/
    15
    /*MORTO?*/
    )
array_push(enemy_5.tipo_ataque, 
        {nome:"ATK", recarga:0.8, dano: 15})

#endregion


#endregion










global.personagens = [santa, cavaleiro, arqueiro, mago, orc]

global.p_enemy = [enemy_1, enemy_2, enemy_3, enemy_4, enemy_5]

                    //HEROI
global.arena = [santa, cavaleiro, arqueiro, mago, orc,
                    //ENEMYS
                enemy_1, enemy_2, enemy_3, enemy_4, enemy_5]



