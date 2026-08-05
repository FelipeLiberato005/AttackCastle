ok = false

confirmar = function()
{
    if mouse_check_button_pressed(mb_right)
    {
        ok = true
    }
}

gerar_personagem =  function()
{
    if ok{
        var lista_batalha = array_length(global.enemy)
        
        for(i = 0; i < lista_batalha; i++)
        {
            var x_atual = obj_castle_enemy.x + (i * 30)
            instance_create_layer(x_atual, obj_castle_enemy.sprite_width*2 - 55, layer, global.enemy[i].obj)
            ok = false
            show_debug_message("Gerado!")
        }
        
    }    
}