
num_heroi = 0
troca_painel = 0
desenhei = false



troca_atual = function()
{
   if (keyboard_check_pressed(vk_up)) num_heroi++;
    
	if (keyboard_check_pressed(vk_down)) num_heroi--; 
    
	var _qtd = array_length(global.arena)
	
	num_heroi = clamp(num_heroi, 0, _qtd-1)
    
    
}


muda_painel = function()
{
   if (keyboard_check_pressed(vk_right)) troca_painel++;
								
	if (keyboard_check_pressed(vk_left)) troca_painel--;	
	
	
	troca_painel = clamp(troca_painel, 0, 1)
    
}


desenha_habilidades = function()
{
    var list = array_length(global.arena)
    for( var i = 0; i < list; i++)
    {
        var info = global.arena[i]
        
        if instance_exists(info.obj)
        {
          var _x = 135 + (i * 45)
          var _y = 235    
          var painel_personagem = info.painel_habilidade  
          if info.is_hero == true && info.desenha_painel == false
        {
            var painel = instance_create_layer(_x, _y, layer, obj_painel)
            painel.sprite_index = painel_personagem
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
            var _x = 135 + (i * 45)
            var _y = 275
            var _larg = 43
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