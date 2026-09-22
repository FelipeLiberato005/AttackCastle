
num_heroi = 0
troca_painel = 0
desenhei = false






desenha_habilidades = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if instance_exists(info.obj)
        {
          var _x = 60
          var _y = 80  + (i * 120)
          //var painel_personagem = info.painel_habilidade  
          if info.is_hero == true
        {
            
            draw_sprite_ext(spr_painel_redondo_santa, 0, _x, _y, 1, 1, 0, c_white, 1)
            //show_message(info.nome + ":" + " Criado!")
            info.desenha_painel = true
        }     
        }
    }
}


desenha_tecla_habilidade = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        var _x = 145 + (i * 45)
        var _y = 224  
        var valor_num = i + 1
        if instance_exists(info.obj)
        {
            if info.is_hero == true
            {
                draw_set_colour(make_colour_rgb(255, 100, 100))
                draw_text(_x, _y, "["+string(valor_num)+"]")
            }
        }
    }
}

desenha_barra_vida_energia = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if instance_exists(info.obj)
        {
            var _x = 35
            var _y = 100 + (i * 120)
            var _larg = 50
            var _alt = 6
            var cor = make_colour_rgb(0, 255, 100)
            var cor2 = make_colour_rgb(0, 100, 255)
            if info.is_hero == true
            {
                info.vida_atual.desenha_vida(_x, _y - 1, _larg, _alt + 1, cor,,,false)
                info.energia_atual.desenha_energia(_x, _y + 6, _larg, _alt, cor2,,,false)
            }
        }
    }
}