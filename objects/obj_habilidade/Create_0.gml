
heroi_atual = 0




desenha_selecao = function()
{
    
    var list = array_length(global.heroi_batalha)
    
    for( var i = 0; i <list; i++)
    {
        var info = global.heroi_batalha[i]
        
        if instance_exists(info.obj)
        {
            var _x = info.obj.x
            var _y = info.obj.y
            
            if i == heroi_atual && info.is_hero == true
            {
                draw_sprite(spr_selecionado, 0 , _x, _y - 35)          
            }
            
        }
    } 
}


troca_atual = function()
{
   if (keyboard_check_pressed(vk_up)) heroi_atual++;
								
	if (keyboard_check_pressed(vk_down)) heroi_atual--;	
	
	var _qtd = array_length(global.heroi_batalha)
	
	heroi_atual = clamp(heroi_atual, 0, _qtd-1)
    
}


desenha_habilidade = function()
{
    
    var list = array_length(global.heroi_batalha)
    
    for( var i = 0; i < list; i++)
    {
        var info = global.heroi_batalha[i]
        if(instance_exists(info.obj))
        {
            //var _x = info.obj.x
            //var _y = info.obj.y
            
            
            var _x = 50 + (i * 170)
             
            
            draw_text(_x, 210, info.tipo_ataque[1].nome)
        }
        
    }
    
}

