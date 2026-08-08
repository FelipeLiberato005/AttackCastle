sprite_index = spr_santa
image_blend = make_colour_rgb(0, 255, 0)

vel = 1
vida = 0
vida_atual = new scr_vida(vida)
//vspeed = vel;

#region METODOS TESTE


bati_parede = function()
{
    parede = place_meeting(x, y, obj_colisor)
}

movimenta = function()
{
    
    
    if parede
    {
        if vspeed == 1
        {
            vspeed = -1
        }
        else if vspeed == -1 {
            vspeed = 1
        }
    }
}

desenha_vida = function ()
{
    var p = interacao_lista(global.p_enemy)
    if p.obj == object_index
    {
        draw_set_font(fnt_personagens)
        p.vida_atual.desenha_vida(x - 5, y - 30, 10, 1)
        draw_set_font(-1)
    }
}

#endregion