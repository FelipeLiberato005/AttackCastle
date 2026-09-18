valor    = 0
//image_xscale = image_xscale*0.8


muda_spritee = function()
{
    if valor == 0
    {
        sprite_index = spr_painel_santa_inicio        
    }
    else {
    	sprite_index = spr_painel_santa_hab
    }
}


muda_valor = function()
{
    if keyboard_check_pressed(vk_left) valor--;
        
    if keyboard_check_pressed(vk_right) valor++;
        
    valor = clamp(valor, 0, 1)
}