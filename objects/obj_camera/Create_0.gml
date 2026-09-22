largura = 200;
altura = 100;
valor_alvo = 0
alvo = noone;
num_alvos = 0
xTo = x;
yTo = y;


troca_alvo = function()
{
   if (keyboard_check_pressed(vk_up)) valor_alvo++;
    
	if (keyboard_check_pressed(vk_down)) valor_alvo--; 
        
	var _qtd = array_length(global.arena)
    var lista_alvos = []
	for( var i = 0; i < _qtd; i++)
    {
        var info = global.arena[i]
        if instance_exists(info.obj)
        {
            if info.is_hero == true
            {
                array_push(lista_alvos, info.nome)
            }
        }
    }
    var numAlvos = array_length(lista_alvos) 
    show_debug_message("alvos: " + string(array_length(lista_alvos)))
	valor_alvo = clamp(valor_alvo, 0, numAlvos-1)
    
}
