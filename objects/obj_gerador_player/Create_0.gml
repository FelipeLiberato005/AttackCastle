ok  = noone
tempo_geracao = room_speed * 2
gerar = true
valor_ordem = 0



#region METODOS


pressionar_botao = function()
{
    ok = mouse_check_button_pressed(mb_left)
}

gerar_personagem =  function()
{
    if ok{
        lista_batalha = array_length(global.batalha)
        
        for(i = 0; i < lista_batalha; i++)
        {
            var x_atual = obj_castle.x - (i * 30)
            //global.batalha[i].ordem = valor_ordem
            instance_create_layer(x_atual, obj_castle.sprite_width*2 + 55, layer, global.batalha[i].obj)
            //valor_ordem++;    
        }
        
    }    
}


estatisca_heroi = function()
{
    
    
    var info = global.batalha[1]
    var h = info.tipo_ataque[0]
    show_message(h.nome + " | " + string(h.recarga))
}
#endregion

