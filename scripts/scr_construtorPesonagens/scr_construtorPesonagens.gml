function criar_personagem(
    _nome,
    _cor,
    _obj,
    _spr = noone,
    _is_hero = true,
    _vida_base = 100,
    _dano = 10
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
    
    tipo_ataque = []
    
}

#region SANTA
var santa = new criar_personagem(
    "Santa",
    make_colour_rgb(255, 255, 255),
    obj_santa,
    spr_santa,
    ,
    50,
    15
    )

array_push(santa.tipo_ataque, 
        {nome:"ATK", recarga:5, dano: 15})
#endregion


#region CAVALEIRO
var cavaleiro = new criar_personagem(
    "Cavaleiro",
    make_colour_rgb(255, 255, 255),
    obj_cavaleiro,
    spr_cavaleiro,
    ,
    100,
    18
)
array_push(cavaleiro.tipo_ataque, 
        {nome:"ATK", recarga:2, dano:5})


#endregion

#region ENEMY
var cavaleiro_enemy = new criar_personagem(
    "Cavaleiro_Enemy",
    make_colour_rgb(255, 0, 0),
    obj_enemy2,
    spr_cavaleiro,
    false,
    500
)


var santa_enemy = new criar_personagem(
    "Santa_Enemy",
    make_colour_rgb(0, 255, 0),
    obj_enemy3,
    spr_santa,
    false,
    500
)
#endregion


global.personagens = [santa, cavaleiro]

global.p_enemy = [cavaleiro_enemy, santa_enemy]

global.arena = [santa, cavaleiro, santa_enemy, cavaleiro_enemy]



