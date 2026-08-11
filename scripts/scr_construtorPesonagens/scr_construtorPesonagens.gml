function criar_personagem(
    _nome,
    _cor,
    _obj,
    _spr = sprite_personagem_teste,
    _is_hero = true,
    _vida_base = 100,
    _dano = 10,
    morto = false
) constructor {
    
    nome = _nome
    cor = _cor
    obj = _obj
    sprite = _spr
    is_hero = _is_hero
    vida_base = _vida_base
    vida_atual = new scr_vida(vida_base)
    dano_base = _dano
    dano_atual = dano_base
    is_morto = morto
    tipo_ataque = []
    
}



#region HEROIS



#region SANTA
var santa = new criar_personagem(
    "Santa",
    make_colour_rgb(255, 255, 255),
    obj_santa,
    ,
    ,
    50,
    15
    )

array_push(santa.tipo_ataque, 
        {nome:"ATK", recarga:0.8, dano: 15})
#endregion





#region CAVALEIRO
var cavaleiro = new criar_personagem(
    "Cavaleiro",
    make_colour_rgb(255, 255, 255),
    obj_cavaleiro,
    ,
    ,
    150,
    18
)
array_push(cavaleiro.tipo_ataque, 
        {nome:"ATK", recarga:1.5, dano:18})

#endregion




#region ORC
var orc = new criar_personagem(
    "Orc",
    make_colour_rgb(255, 255, 255),
    obj_orc,
    ,
    ,
    100,
    25
)
array_push(orc.tipo_ataque, 
        {nome:"ATK", recarga:2.0, dano:22})

#endregion




#region ARQUEIRO
var arqueiro = new criar_personagem(
    "Arqueiro",
    make_colour_rgb(255, 255, 255),
    obj_arqueiro,
    ,
    ,
    75,
    15
)
array_push(arqueiro.tipo_ataque, 
        {nome:"ATK", recarga:0.2, dano:11})

#endregion




#region MAGO
var mago = new criar_personagem(
    "Mago",
    make_colour_rgb(255, 255, 255),
    obj_mago,
    ,
    ,
    100,
    12
)
array_push(mago.tipo_ataque, 
        {nome:"ATK", recarga:0.6, dano:13})

#endregion



#endregion











#region ENEMY


#region ENEMY 1
var enemy_1 = new criar_personagem(
    "Enemy 1",
    make_colour_rgb(255, 0, 0),
    obj_enemy_1,
    ,
    false,
    50
)
array_push(enemy_1.tipo_ataque, 
        {nome:"ATK", recarga:0.8, dano: 15})
#endregion



#region ENEMY 2
var enemy_2= new criar_personagem(
    "Enemy 2",
    make_colour_rgb(0, 255, 0),
    obj_enemy_2,
    ,
    false,
    120
)
array_push(enemy_2.tipo_ataque, 
        {nome:"ATK", recarga:1.5, dano: 18})

#endregion



#region ENEMY 3
var enemy_3= new criar_personagem(
    "Enemy 3",
    make_colour_rgb(0, 255, 0),
    obj_enemy_3,
    ,
    false,
    50
)
array_push(enemy_3.tipo_ataque, 
        {nome:"ATK", recarga:1.3, dano: 18})

#endregion



#region ENEMY 4
var enemy_4 = new criar_personagem(
    "Enemy 4",
    make_colour_rgb(0, 255, 0),
    obj_enemy_4,
    ,
    false,
    50
)
array_push(enemy_4.tipo_ataque, 
        {nome:"ATK", recarga:0.5, dano: 13})

#endregion



#region ENEMY 5
var enemy_5 = new criar_personagem(
    "Enemy 5",
    make_colour_rgb(0, 255, 0),
    obj_enemy_5,
    ,
    false,
    50
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



